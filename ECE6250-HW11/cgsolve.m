function [x, iter] = cgsolve(H, b, tol, maxiter, N)
    x = zeros(size(b));
    r = b - H(x);
    d = r;
    for iter = 1:maxiter
        if norm(r)/norm(b) < tol
            break;
        end
        a = (r'*r)/(d'*H(d));
        x = x + a * d;
        if mod(iter, 50) == 0
            r1 = b - H(x);
        else
            r1 = r - a*H(d);
        end
        beta = (r1'*r1)/(r'*r);
        d = r1 + beta * d;
        r = r1;
    end
end