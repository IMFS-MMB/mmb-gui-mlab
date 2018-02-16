function [residual, g1, g2] = NK_RW97_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                     columns: variables in declaration order
%                                                     rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 38, 1);

%
% Model equations
%

T179 = params(36)^(-1);
lhs =y(10);
rhs =y(5)*4;
residual(1)= lhs-rhs;
lhs =y(11);
rhs =0.25*(4*y(1)+4*y(1)+4*y(25)+4*y(26));
residual(2)= lhs-rhs;
lhs =y(12);
rhs =4*y(1);
residual(3)= lhs-rhs;
lhs =y(13);
rhs =y(6);
residual(4)= lhs-rhs;
lhs =y(14);
rhs =y(2);
residual(5)= lhs-rhs;
lhs =y(15);
rhs =y(9);
residual(6)= lhs-rhs;
lhs =y(10);
rhs =params(32)*x(2)+params(31)*y(24)+params(30)*y(23)+params(29)*y(22)+y(14)*params(28)+params(27)*y(29)+params(26)*y(28)+params(25)*y(27)+y(14)*params(24)+y(14)*params(23)+params(22)*y(21)+params(21)*y(20)+params(20)*y(19)+y(13)*params(19)+params(18)*y(32)+params(17)*y(31)+params(16)*y(30)+y(13)*params(15)+y(13)*params(14)+params(13)*y(18)+params(12)*y(17)+params(11)*y(16)+y(12)*params(10)+y(12)*params(6)+y(12)*params(5)+y(10)*params(1)+params(2)*y(33)+params(3)*y(34)+params(4)*y(35)+params(7)*y(36)+params(8)*y(37)+params(9)*y(38);
residual(7)= lhs-rhs;
lhs =y(15);
rhs =params(34)*x(3);
residual(8)= lhs-rhs;
lhs =y(1);
rhs =y(1)*params(35)+y(6)*params(40)+y(7);
residual(9)= lhs-rhs;
lhs =y(7);
rhs =y(7)*params(41)+x(1);
residual(10)= lhs-rhs;
lhs =y(6);
rhs =y(6)-params(36)*(y(5)-y(1)-y(4));
residual(11)= lhs-rhs;
residual(12) = y(4);
lhs =y(3);
rhs =T179*y(8)/(T179+params(39));
residual(13)= lhs-rhs;
lhs =y(6);
rhs =y(2)-y(3);
residual(14)= lhs-rhs;
lhs =y(8);
rhs =y(9)+y(8)*params(42);
residual(15)= lhs-rhs;
lhs =y(16);
rhs =y(12);
residual(16)= lhs-rhs;
lhs =y(17);
rhs =y(16);
residual(17)= lhs-rhs;
lhs =y(18);
rhs =y(17);
residual(18)= lhs-rhs;
lhs =y(19);
rhs =y(13);
residual(19)= lhs-rhs;
lhs =y(20);
rhs =y(19);
residual(20)= lhs-rhs;
lhs =y(21);
rhs =y(20);
residual(21)= lhs-rhs;
lhs =y(22);
rhs =y(14);
residual(22)= lhs-rhs;
lhs =y(23);
rhs =y(22);
residual(23)= lhs-rhs;
lhs =y(24);
rhs =y(23);
residual(24)= lhs-rhs;
lhs =y(25);
rhs =y(1);
residual(25)= lhs-rhs;
lhs =y(26);
rhs =y(25);
residual(26)= lhs-rhs;
lhs =y(27);
rhs =y(14);
residual(27)= lhs-rhs;
lhs =y(28);
rhs =y(27);
residual(28)= lhs-rhs;
lhs =y(29);
rhs =y(28);
residual(29)= lhs-rhs;
lhs =y(30);
rhs =y(13);
residual(30)= lhs-rhs;
lhs =y(31);
rhs =y(30);
residual(31)= lhs-rhs;
lhs =y(32);
rhs =y(31);
residual(32)= lhs-rhs;
lhs =y(33);
rhs =y(10);
residual(33)= lhs-rhs;
lhs =y(34);
rhs =y(33);
residual(34)= lhs-rhs;
lhs =y(35);
rhs =y(34);
residual(35)= lhs-rhs;
lhs =y(36);
rhs =y(12);
residual(36)= lhs-rhs;
lhs =y(37);
rhs =y(36);
residual(37)= lhs-rhs;
lhs =y(38);
rhs =y(37);
residual(38)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(38, 38);

  %
  % Jacobian matrix
  %

  g1(1,5)=(-4);
  g1(1,10)=1;
  g1(2,1)=(-2);
  g1(2,11)=1;
  g1(2,25)=(-1);
  g1(2,26)=(-1);
  g1(3,1)=(-4);
  g1(3,12)=1;
  g1(4,6)=(-1);
  g1(4,13)=1;
  g1(5,2)=(-1);
  g1(5,14)=1;
  g1(6,9)=(-1);
  g1(6,15)=1;
  g1(7,10)=1-params(1);
  g1(7,12)=(-(params(10)+params(6)+params(5)));
  g1(7,13)=(-(params(19)+params(15)+params(14)));
  g1(7,14)=(-(params(28)+params(24)+params(23)));
  g1(7,16)=(-params(11));
  g1(7,17)=(-params(12));
  g1(7,18)=(-params(13));
  g1(7,19)=(-params(20));
  g1(7,20)=(-params(21));
  g1(7,21)=(-params(22));
  g1(7,22)=(-params(29));
  g1(7,23)=(-params(30));
  g1(7,24)=(-params(31));
  g1(7,27)=(-params(25));
  g1(7,28)=(-params(26));
  g1(7,29)=(-params(27));
  g1(7,30)=(-params(16));
  g1(7,31)=(-params(17));
  g1(7,32)=(-params(18));
  g1(7,33)=(-params(2));
  g1(7,34)=(-params(3));
  g1(7,35)=(-params(4));
  g1(7,36)=(-params(7));
  g1(7,37)=(-params(8));
  g1(7,38)=(-params(9));
  g1(8,15)=1;
  g1(9,1)=1-params(35);
  g1(9,6)=(-params(40));
  g1(9,7)=(-1);
  g1(10,7)=1-params(41);
  g1(11,1)=(-params(36));
  g1(11,4)=(-params(36));
  g1(11,5)=params(36);
  g1(12,4)=1;
  g1(13,3)=1;
  g1(13,8)=(-(T179/(T179+params(39))));
  g1(14,2)=(-1);
  g1(14,3)=1;
  g1(14,6)=1;
  g1(15,8)=1-params(42);
  g1(15,9)=(-1);
  g1(16,12)=(-1);
  g1(16,16)=1;
  g1(17,16)=(-1);
  g1(17,17)=1;
  g1(18,17)=(-1);
  g1(18,18)=1;
  g1(19,13)=(-1);
  g1(19,19)=1;
  g1(20,19)=(-1);
  g1(20,20)=1;
  g1(21,20)=(-1);
  g1(21,21)=1;
  g1(22,14)=(-1);
  g1(22,22)=1;
  g1(23,22)=(-1);
  g1(23,23)=1;
  g1(24,23)=(-1);
  g1(24,24)=1;
  g1(25,1)=(-1);
  g1(25,25)=1;
  g1(26,25)=(-1);
  g1(26,26)=1;
  g1(27,14)=(-1);
  g1(27,27)=1;
  g1(28,27)=(-1);
  g1(28,28)=1;
  g1(29,28)=(-1);
  g1(29,29)=1;
  g1(30,13)=(-1);
  g1(30,30)=1;
  g1(31,30)=(-1);
  g1(31,31)=1;
  g1(32,31)=(-1);
  g1(32,32)=1;
  g1(33,10)=(-1);
  g1(33,33)=1;
  g1(34,33)=(-1);
  g1(34,34)=1;
  g1(35,34)=(-1);
  g1(35,35)=1;
  g1(36,12)=(-1);
  g1(36,36)=1;
  g1(37,36)=(-1);
  g1(37,37)=1;
  g1(38,37)=(-1);
  g1(38,38)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],38,1444);
end
end
