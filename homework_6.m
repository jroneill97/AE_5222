clc; clear;

dist_mat = [[0 66 94 64   132  124];
            [66  0 36 54   70  145]
            [94 36   0  52 72  140]
            [64 54 52    0 118  92]
            [132 70 72 118   0 209]
            [124 145 140 92 209  0]];
        
all_paths = perms(1:6);
temp      = ones(length(all_paths),1);
% all_paths = [all_paths 1*temp;    % Creates all possible paths in a
%              all_paths 2*temp;    % massive permutation matrix
%              all_paths 3*temp;
%              all_paths 4*temp; 
%              all_paths 5*temp;
%              all_paths 6*temp]; 
         
Nodes = struct;
for i = 1:length(all_paths)
    Nodes(i).path = all_paths(i,:);
    Nodes(i).node = i;
    Nodes(i).adjacent_nodes = 0;
end

%% Fill in adjacency and cost matrices

% There are 6 adjacent paths (nodes) for each node.
% need to make 6 adjacent paths, then find which nodes correspond to each
% Each node will be assigned to the adjacent_nodes arrays for each Node(i)
cost_mat = zeros(length(Nodes));
adj_mat  = zeros(length(Nodes));

for n = 1:length(Nodes)
    for swap_idx = 1:6
        swapped_path = swap_with_bt(Nodes(n).path,swap_idx);
        for i = 1:length(Nodes)
            if Nodes(i).path == swapped_path
                 Nodes(n).adjacent_nodes(end+1) = i;
            end
        end
    end    
    
    Nodes(n).path_cost = dist_mat(Nodes(n).path(1),Nodes(n).path(2)) + ...
                         dist_mat(Nodes(n).path(3),Nodes(n).path(4)) + ...
                         dist_mat(Nodes(n).path(5),Nodes(n).path(6));
                     
    for j = 2:7 % there's a random 0 in the beginning of the path so j
                % needs to be 2:7 instead of 1:6
        cost_mat(n,Nodes(n).adjacent_nodes(j)) = Nodes(n).path_cost;
        adj_mat(n,Nodes(n).adjacent_nodes(j)) = 1;
    end
end

%% Dijkstra's algorithm to find minimum path

start_node = 528; % node where the question says the pallets start
end_node   = 720;
[cost, path, n_iterations] = dijkstra(adj_mat,cost_mat,start_node,end_node);

fprintf('------ Calculated Minimum Cost Path ------\n\n');
fprintf('Path cost = %d\n\n', cost);
fprintf('     p1 |  p2 |  p3 |  p4 |  p5 |  \n');
for node = path
    disp(Nodes(node).path);    
end



%% Function definition
function swapped_path = swap_with_bt(path,idx)
    swapped_path = path;
    swapped_path([idx end]) = path([end idx]);    
end




















