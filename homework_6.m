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
        swapped_path = swap_elements(Nodes(n).path,swap_idx);
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


start_node = 528; % node where the question says the pallets start
end_node   = 720;
[cost, path, n_iterations] = dijkstra(adj_mat,cost_mat,start_node,end_node);

fprintf('------ Calculated Minimum Cost Path ------\n\n');
for node = path
    disp(Nodes(node).path);    
end


function swapped_path = swap_elements(path,first_idx)
    [~, l] = size(path);
    if first_idx == l
        swapped_path = [path(end) path(2:(end-1)) path(1)];
        return;
    end
    swapped_path = path;
    swapped_path([first_idx first_idx+1]) = path([first_idx+1 first_idx]);    
end




















