clc; clf; clear variables; 
hw2_2017_main;

V = struct;

for i = 1:N_G^2
    V(i).coordinate = grid_world.coordinates(:,i);
    V(i).node = i;
end

G = flipud(reshape(V',[N_G,N_G])');

% ----- Used ____'s code to calculate adjacency matrix ----- %
[r, c] = size(G);                            % Get the matrix size
diagVec1 = repmat([ones(c-1, 1); 0], r, 1);  % Make the first diagonal vector
                                             %   (for horizontal connections)
diagVec1 = diagVec1(1:end-1);                % Remove the last value
diagVec2 = ones(c*(r-1), 1);                 % Make the second diagonal vector
                                             %   (for vertical connections)
adj = diag(diagVec1, 1)+diag(diagVec2, c);   % Add the diagonals to a zero matrix
adj = adj+adj.';                             % Add the matrix to a transposed copy of
                                             %   itself to make it symmetric                                             
% -----

edge_cost = 0;
node_array = [0;0];
hold on;
for i = 1:N_G^2
    for j = i:N_G^2
        if adj(i,j) == 1
            node_array = [node_array [V(i).node; V(j).node]];
            edge_cost = [edge_cost 0.5*(threat_value_true(V(i).node) + threat_value_true(V(j).node))];
        end
    end
end
node_array = node_array(:,2:end);
edge_cost = edge_cost(2:end);
E = [node_array; edge_cost]';
pos = grid_world.coordinates';

[cost, path] = dijkstra(pos,E,1,N_G^2);

%% Plotting the path 
contour3( linspace(-1,1,N_G), linspace(-1,1,N_G),reshape(threat_value_true,[N_G N_G])',N_G);
[g1, g2] = gradient(reshape(threat_value_true,[N_G N_G])');
quiver(linspace(-1,1,N_G), linspace(-1,1,N_G),g1,g2);
for i = 1:length(path)-1
    node = path(i);
    node_future = path(i+1);
    current_h = interp2(linspace(-1,1,N_G),...
                        linspace(-1,1,N_G),...
                        reshape(threat_value_true,[N_G N_G])',...
                        V(node).coordinate(1),V(node).coordinate(2));
    future_h = interp2(linspace(-1,1,N_G),...
                    linspace(-1,1,N_G),...
                    reshape(threat_value_true,[N_G N_G])',...
                    V(node_future).coordinate(1),V(node_future).coordinate(2));        
            
    line([V(node).coordinate(1) V(node_future).coordinate(1)],...
         [V(node).coordinate(2) V(node_future).coordinate(2)],...
         [current_h future_h],...
         'Color','red','LineWidth',2);
end










