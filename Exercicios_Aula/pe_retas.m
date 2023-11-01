clear all; clc ; close all;
N = 1000000 %Número de realizações

dt = 0.05;
t = 0 : dt : 1; % vetor tempo

dx = 0.02;
x = -0.2 : dx : 1.2;



X = zeros(N,length(t));

for i = 1 : N
  A = rand();
  B = rand();
  X(i,:) = (B - A)*t + A;
 end

pdfX_sim = hist(X,x)/(N*dx);
pdfX_teo = zeros(length(x),length(t));

for j =1 : length(t)
  ts = min([t(j),1 - t(j)]);
  pdfX_teo(:,j) = 1/(ts * (1 - ts)) * ( ...
  x .*  ( 0 < x & x < ts ) + ...
  ts .* ( ts <= x & x < 1 - ts) + ...
  (1-x) .* ( 1 -ts <= x & x <= 1 )
  );
end

while 1
for m = 1 : length(t)
  grid on; hold on;
  
  bar(x,pdfX_sim(:,m),'r')
  plot(x, pdfX_teo(:,m),'b','LineWidth',4)
  grid on;
  xlim([-0.2,1.2]); ylim([0,2]);
  title(sprintf("t = %.2f", t(m)));
  xlabel('x'); ylabel('f_{X(y)}(x)');
  pause(0.05);
  clf
end
end