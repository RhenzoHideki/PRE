%*7.* Um vetor gaussiano $arrow(X) = mat(X_1 , X_2 , X_3)^T$ tem média nula e matriz covariância $ C_arrow(X) = mat(5 , 0 ,2 ; 0 , 4 , 0 ; 2 , 0 ,3 ) $
%Determine:
%"(a)" "Pr"[3<= X_1 <=4].
%"(b)" "Pr"[3<= X_1 <=4 " e " X_2 < 0].
%"(c)" "Pr"[3<= X_1 <=4 " e "  X_2 < 0 | X_3 = 3].
%"(d)" "Pr"[X_1 + X_2 + X_3 > 2].

clear all; close all ; clc;
pkg load statistics;

N = 10000000;%Número de realizações

mu = [0;0;0]; % Vetor média
C = [ 5 0 2; 0 4 0; 2 0 3]; % Matriz covariaância

vetX = mvnrnd(mu, C, N);
X1 = vetX(:,1)';
X2 = vetX(:,2)';
X3 = vetX(:,3)';

dx1 = 0.1 ;x1 = -9: dx1:9;

%"(a)" "Pr"[3<= X_1 <=4].

Pr_a_sim = mean(( 3 <= X1) & (X1 <= 4))
Pr_a_teo =  normcdf(4/sqrt(5)) - normcdf(3/sqrt(5))

%"(b)" "Pr"[3<= X_1 <=4 " e " X_2 < 0].
idxb = (-0.5 <= X2) &( X2 <= 0.5);
X_b_cond = X1(idxb);
Pr_b_sim = mean(3 <= X_b_cond & X_b_cond <= 4)
Pr_b_teo =  normcdf(4/sqrt(5)) - normcdf(3/sqrt(5))

%"(c)" "Pr"[3<= X_1 <=4 " e "  X_2 < 0 | X_3 = 3].
idxc = (2.8 <= X3) &( X3 <= 3.2)  & (-0.5 <= X2) &( X2 <= 0.5);
X_c_cond  = X1(idxc);
Pr_c_sim = mean(3 <= X_c_cond & X_c_cond <= 4)
Pr_c_teo =  normcdf((4-2)/sqrt(11/3)) - normcdf((3-2)/sqrt(11/3))

%"(d)" "Pr"[X_1 + X_2 + X_3 > 2].

Pr_d_sim = mean((X1+X2+X3) > 2)
Pr_d_teo = 1 - normcdf((2-0)/sqrt(16))
