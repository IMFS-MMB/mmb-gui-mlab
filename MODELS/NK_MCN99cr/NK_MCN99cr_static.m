function [residual, g1, g2] = NK_MCN99cr_static(y, x, params)
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

residual = zeros( 31, 1);

%
% Model equations
%

T148 = 1/params(38)*1/params(40);
lhs =y(11);
rhs =400*y(4);
residual(1)= lhs-rhs;
lhs =y(12);
rhs =25*(4*y(1)+4*y(1)+4*y(21)+4*y(22));
residual(2)= lhs-rhs;
lhs =y(13);
rhs =400*y(1);
residual(3)= lhs-rhs;
lhs =y(14);
rhs =100*y(9);
residual(4)= lhs-rhs;
lhs =y(11);
rhs =params(32)*x(5)+params(22)*y(20)+params(21)*y(19)+params(20)*y(18)+y(14)*params(19)+params(18)*y(25)+params(17)*y(24)+params(16)*y(23)+y(14)*params(15)+y(14)*params(14)+params(13)*y(17)+params(12)*y(16)+params(11)*y(15)+y(13)*params(10)+y(13)*params(6)+y(13)*params(5)+y(11)*params(1)+params(2)*y(26)+params(3)*y(27)+params(4)*y(28)+params(7)*y(29)+params(8)*y(30)+params(9)*y(31);
residual(5)= lhs-rhs;
residual(6) = y(1);
lhs =y(3);
rhs =y(3)-params(35)*params(36)*(y(4)-y(1))+params(36)*y(5);
residual(7)= lhs-rhs;
lhs =y(6)-y(2);
rhs =1/(params(35)*params(38))*params(37)*(y(3)-params(39)*y(7))-y(4)*T148+y(8);
residual(8)= lhs-rhs;
lhs =y(5);
rhs =y(5)*params(41)+x(4);
residual(9)= lhs-rhs;
lhs =y(8);
rhs =y(8)*params(42)+x(1);
residual(10)= lhs-rhs;
lhs =y(7);
rhs =y(7)+params(43)+x(2);
residual(11)= lhs-rhs;
lhs =y(10);
rhs =params(44)+y(10)*params(45)+x(3);
residual(12)= lhs-rhs;
lhs =y(9);
rhs =y(3)-y(10);
residual(13)= lhs-rhs;
lhs =y(1);
rhs =y(1)*params(46)+y(9)*params(47);
residual(14)= lhs-rhs;
lhs =y(15);
rhs =y(13);
residual(15)= lhs-rhs;
lhs =y(16);
rhs =y(15);
residual(16)= lhs-rhs;
lhs =y(17);
rhs =y(16);
residual(17)= lhs-rhs;
lhs =y(18);
rhs =y(14);
residual(18)= lhs-rhs;
lhs =y(19);
rhs =y(18);
residual(19)= lhs-rhs;
lhs =y(20);
rhs =y(19);
residual(20)= lhs-rhs;
lhs =y(21);
rhs =y(1);
residual(21)= lhs-rhs;
lhs =y(22);
rhs =y(21);
residual(22)= lhs-rhs;
lhs =y(23);
rhs =y(14);
residual(23)= lhs-rhs;
lhs =y(24);
rhs =y(23);
residual(24)= lhs-rhs;
lhs =y(25);
rhs =y(24);
residual(25)= lhs-rhs;
lhs =y(26);
rhs =y(11);
residual(26)= lhs-rhs;
lhs =y(27);
rhs =y(26);
residual(27)= lhs-rhs;
lhs =y(28);
rhs =y(27);
residual(28)= lhs-rhs;
lhs =y(29);
rhs =y(13);
residual(29)= lhs-rhs;
lhs =y(30);
rhs =y(29);
residual(30)= lhs-rhs;
lhs =y(31);
rhs =y(30);
residual(31)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(31, 31);

  %
  % Jacobian matrix
  %

  g1(1,4)=(-400);
  g1(1,11)=1;
  g1(2,1)=(-200);
  g1(2,12)=1;
  g1(2,21)=(-100);
  g1(2,22)=(-100);
  g1(3,1)=(-400);
  g1(3,13)=1;
  g1(4,9)=(-100);
  g1(4,14)=1;
  g1(5,11)=1-params(1);
  g1(5,13)=(-(params(10)+params(6)+params(5)));
  g1(5,14)=(-(params(19)+params(15)+params(14)));
  g1(5,15)=(-params(11));
  g1(5,16)=(-params(12));
  g1(5,17)=(-params(13));
  g1(5,18)=(-params(20));
  g1(5,19)=(-params(21));
  g1(5,20)=(-params(22));
  g1(5,23)=(-params(16));
  g1(5,24)=(-params(17));
  g1(5,25)=(-params(18));
  g1(5,26)=(-params(2));
  g1(5,27)=(-params(3));
  g1(5,28)=(-params(4));
  g1(5,29)=(-params(7));
  g1(5,30)=(-params(8));
  g1(5,31)=(-params(9));
  g1(6,1)=1;
  g1(7,1)=(-(params(35)*params(36)));
  g1(7,4)=params(35)*params(36);
  g1(7,5)=(-params(36));
  g1(8,2)=(-1);
  g1(8,3)=(-(1/(params(35)*params(38))*params(37)));
  g1(8,4)=T148;
  g1(8,6)=1;
  g1(8,7)=(-(1/(params(35)*params(38))*params(37)*(-params(39))));
  g1(8,8)=(-1);
  g1(9,5)=1-params(41);
  g1(10,8)=1-params(42);
  g1(12,10)=1-params(45);
  g1(13,3)=(-1);
  g1(13,9)=1;
  g1(13,10)=1;
  g1(14,1)=1-params(46);
  g1(14,9)=(-params(47));
  g1(15,13)=(-1);
  g1(15,15)=1;
  g1(16,15)=(-1);
  g1(16,16)=1;
  g1(17,16)=(-1);
  g1(17,17)=1;
  g1(18,14)=(-1);
  g1(18,18)=1;
  g1(19,18)=(-1);
  g1(19,19)=1;
  g1(20,19)=(-1);
  g1(20,20)=1;
  g1(21,1)=(-1);
  g1(21,21)=1;
  g1(22,21)=(-1);
  g1(22,22)=1;
  g1(23,14)=(-1);
  g1(23,23)=1;
  g1(24,23)=(-1);
  g1(24,24)=1;
  g1(25,24)=(-1);
  g1(25,25)=1;
  g1(26,11)=(-1);
  g1(26,26)=1;
  g1(27,26)=(-1);
  g1(27,27)=1;
  g1(28,27)=(-1);
  g1(28,28)=1;
  g1(29,13)=(-1);
  g1(29,29)=1;
  g1(30,29)=(-1);
  g1(30,30)=1;
  g1(31,30)=(-1);
  g1(31,31)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],31,961);
end
end
