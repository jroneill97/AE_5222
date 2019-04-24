clc; clear;

dist_mat = [[0 66 94 64   132  124];
            [66  0 36 54   70  145]
            [94 36   0  52 72  140]
            [64 54 52    0 118  92]
            [132 70 72 118   0 209]
            [124 145 140 92 209  0]];
        
all_paths = perms(1:6);
temp      = ones(length(all_paths),1);
         
Nodes = struct;
for i = 1:length(all_paths)
    Nodes(i).config = all_paths(i,:);
    Nodes(i).node = i;
    Nodes(i).adjacent_nodes = 0;
end

%% Fill in adjacency and cost matrices

% There are 6 adjacent paths (nodes) for each node.
% need to make 6 adjacent paths, then find which nodes correspond to each
% Each node will be assigned to the adjacent_nodes arrays for each Node(i)
cost_mat = zeros(length(Nodes));
adj_mat  = zeros(length(Nodes));
E        = (zeros(1,3));
for n = 1:length(Nodes)
    for swap_idx = 1:6
        swapped_config = swap_with_bt(Nodes(n).config,swap_idx);
        for i = 1:length(Nodes)
            if isequal(Nodes(i).config, swapped_config) && (n ~= i) && (swap_idx ~= swapped_config(end))
                E(end+1,:) = [n i dist_mat(swap_idx,swapped_config(end))];
                Nodes(n).adjacent_nodes(end+1) = i;
            end
        end
    end
end
E = E(2:end,:);

for n = 1:length(Nodes)
    for j = 2:length(Nodes(n).adjacent_nodes) % there's a random 0 in the beginning of the path so j
                                              % needs to start at 2 instead of 1
        [~,temp] = ismember(E(:,1:2),[n, Nodes(n).adjacent_nodes(j)],'rows');
        [~,idx]  = min(abs(temp-1));
        cost_mat(n,Nodes(n).adjacent_nodes(j)) = E(idx,3);
        adj_mat(n,Nodes(n).adjacent_nodes(j)) = 1;
    end
end

%% Dijkstra's algorithm to find minimum path

start_node = 1; % node where the question says the pallets start
end_node   = 720;
[cost, path, n_iterations] = dijkstra(adj_mat,cost_mat,start_node,end_node);

fprintf('------ Calculated Minimum Cost Path ------\n\n');
fprintf('Path cost = %d\n\n', cost);
fprintf('     p1 |  p2 |  p3 |  p4 |  p5 |  \n');
for node = path
    disp(Nodes(node).config);    
end



%% Function definition
function swapped_config = swap_with_bt(path,idx)
    swapped_config = path;
    swapped_config([idx end]) = path([end idx]);    
end




















