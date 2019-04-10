function adj = create_adjacency_matrix(G)
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
end