function U = gauss_elim_partial_pivoting(M)
[m,n] = size(M);
k=1; % k is for column
j=1; % j is for row

while (j<=m) && (k<=m)
    % find the absolute value below
    % the pivot position
    a = abs(M(j:end, k));
    if max(a)==0
        k = k+1;
        % if all zeros below (and possibly including)
        % the pivot, no need to swaps rows, so move on
        % to the next column
        continue
        % but stay on the same row <- this is where k
        % is important
        
        % need to deal with the case that entry
        % in the pivot position is zero
    else
        % set b to be portion of k-th column below (and
        % including) (j, k) position
        b=M(j:end,k);

        % select the index of the max element in the current
        % column
        % pivot position (j, k) is non-zero
        [max_elem, idx] = max(b);

        % reindex to get correct index for full j-th
        % column
        idx=idx+j-1;
        
        % swap rows to get rid of zero in pivot position
        swap=M(j,:);
        M(j,:)=M(idx,:);
        M(idx,:)=swap;
    end
    
    for i = j+1:m
        % perform type III operations
        M(i,:) = M(i,:)-(M(i,k)/M(j,k))*M(j,:);
    end
    M
    j=j+1;
    k=k+1;
end
U=M;