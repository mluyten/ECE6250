function [x, iter] = sdsolve(H, b, tol, maxiter)
    x = zeros(size(b));
    r = b - H(x);
    for iter = 1:maxiter
        if norm(r)/norm(b) < tol
            break;
        end
        q = H(r);
        a = (r'*r)/(r'*q);
        x = x + a * r;
        if mod(iter, 50) == 0
            r = b - H(x);
        else
            r = r - a*q;
        end
    end
end