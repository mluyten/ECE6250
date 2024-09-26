function Q = gramschmidt(A)
    sz = size(A);
    K = sz(2);
    Q = zeros(sz);
    for i = 1:K
        Q(:,i) = A(:,i);
        for j = 1:i
            Q(:,i) = Q(:,i) - A(:,i)'*Q(:,j)*Q(:,j);
        end
        Q(:,i) = Q(:,i) / norm(Q(:,i));
    end
end