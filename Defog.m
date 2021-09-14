
function rImg = Defog(HazeImg, t, A,delta)

t = max(abs(t), 0.00001).^delta;
if length(A) == 1
    A = A * ones(3, 1);
end
R = (HazeImg(:, :, 1) - A(1)) ./ t + A(1);  R = max(R, 0); R = min(R, 1);
G = (HazeImg(:, :, 2) - A(2)) ./ t + A(2);  G = max(G, 0); G = min(G, 1);
B = (HazeImg(:, :, 3) - A(3)) ./ t + A(3);  B = max(B, 0); B = min(B, 1);
rImg = cat(3, R, G, B);
