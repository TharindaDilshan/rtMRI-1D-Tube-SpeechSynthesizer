function [A,B] = pad(A, B)

if(length(A) < length(B))
    A = [A zeros(1, length(B) - length(A))];
elseif(length(B) < length(A))
    B = [B zeros(1, length(A) - length(B))];
end