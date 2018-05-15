function [residual, g1, g2] = NK_CFP10_static(y, x, params)
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

residual = zeros( 57, 1);

%
% Model equations
%

T197 = 1/params(35);
lhs =y(30);
rhs =y(4)*4;
residual(1)= lhs-rhs;
lhs =y(31);
rhs =y(5)+y(5)+y(44)+y(45);
residual(2)= lhs-rhs;
lhs =y(32);
rhs =4*y(5);
residual(3)= lhs-rhs;
lhs =y(33);
rhs =y(1)-y(15);
residual(4)= lhs-rhs;
lhs =y(34);
rhs =y(1);
residual(5)= lhs-rhs;
lhs =y(30);
rhs =params(32)/100*x(4)+params(31)*y(43)+params(30)*y(42)+params(29)*y(41)+y(34)*params(28)+params(27)*y(48)+params(26)*y(47)+params(25)*y(46)+y(34)*params(24)+y(34)*params(23)+params(22)*y(40)+params(21)*y(39)+params(20)*y(38)+y(33)*params(19)+params(18)*y(51)+params(17)*y(50)+params(16)*y(49)+y(33)*params(15)+y(33)*params(14)+params(13)*y(37)+params(12)*y(36)+params(11)*y(35)+y(32)*params(10)+y(32)*params(6)+y(32)*params(5)+y(30)*params(1)+params(2)*y(52)+params(3)*y(53)+params(4)*y(54)+params(7)*y(55)+params(8)*y(56)+params(9)*y(57);
residual(6)= lhs-rhs;
lhs =y(1)*params(36)+params(37)*y(11);
rhs =y(14);
residual(7)= lhs-rhs;
lhs =y(1)*params(36)+params(37)*y(12);
rhs =y(13);
residual(8)= lhs-rhs;
lhs =0;
rhs =y(4)-y(5);
residual(9)= lhs-rhs;
lhs =y(7);
rhs =(-(1/(1+params(41))*y(29)));
residual(10)= lhs-rhs;
lhs =y(8)+y(9);
rhs =y(1)+y(6)+y(7)*params(41);
residual(11)= lhs-rhs;
lhs =y(8);
rhs =T197*(y(29)+y(8)-y(3)*(params(36)+params(37))*params(38)*(1-params(35))+y(7)*(1+params(41)*params(35)-params(40)*(1-params(35))*params(39)*params(38)));
residual(12)= lhs-rhs;
lhs =y(6);
rhs =y(3)*(params(36)+params(37))+y(7)*params(39)*params(40);
residual(13)= lhs-rhs;
lhs =y(1);
rhs =y(27)+y(12)*(1-params(39))+y(11)*params(39);
residual(14)= lhs-rhs;
lhs =y(5);
rhs =y(6)*params(43)+y(5)*params(35)+params(43)*y(28);
residual(15)= lhs-rhs;
lhs =y(10);
rhs =y(1)-y(6)*(params(38)-1);
residual(16)= lhs-rhs;
lhs =y(7)*params(40);
rhs =y(1)+y(6)-y(14)-y(11);
residual(17)= lhs-rhs;
lhs =y(2);
rhs =y(27)*(1+params(37))/(params(36)+params(37));
residual(18)= lhs-rhs;
lhs =y(3);
rhs =y(1)-y(2);
residual(19)= lhs-rhs;
lhs =y(15)*params(36)+params(37)*y(23);
rhs =y(26);
residual(20)= lhs-rhs;
lhs =y(15)*params(36)+params(37)*y(24);
rhs =y(25);
residual(21)= lhs-rhs;
lhs =0;
rhs =y(17);
residual(22)= lhs-rhs;
lhs =y(19);
rhs =(-(1/(1+params(41))*y(29)));
residual(23)= lhs-rhs;
lhs =y(20)+y(21);
rhs =y(15)+y(18)+params(41)*y(19);
residual(24)= lhs-rhs;
lhs =y(20);
rhs =T197*(y(29)+y(20)-(params(36)+params(37))*params(38)*(1-params(35))*y(16)+(1+params(41)*params(35)-params(40)*(1-params(35))*params(39)*params(38))*y(19));
residual(25)= lhs-rhs;
lhs =y(18);
rhs =(params(36)+params(37))*y(16)+params(39)*params(40)*y(19);
residual(26)= lhs-rhs;
lhs =y(15);
rhs =y(27)+(1-params(39))*y(24)+params(39)*y(23);
residual(27)= lhs-rhs;
residual(28) = y(18);
lhs =y(22);
rhs =y(15)-(params(38)-1)*y(18);
residual(29)= lhs-rhs;
lhs =params(40)*y(19);
rhs =y(15)+y(18)-y(26)-y(23);
residual(30)= lhs-rhs;
lhs =y(16);
rhs =y(15)-y(2);
residual(31)= lhs-rhs;
lhs =y(27);
rhs =y(27)*params(44)+x(1);
residual(32)= lhs-rhs;
lhs =y(28);
rhs =y(28)*params(46)+x(2);
residual(33)= lhs-rhs;
lhs =y(29);
rhs =y(29)*params(47)+x(3);
residual(34)= lhs-rhs;
lhs =y(35);
rhs =y(32);
residual(35)= lhs-rhs;
lhs =y(36);
rhs =y(35);
residual(36)= lhs-rhs;
lhs =y(37);
rhs =y(36);
residual(37)= lhs-rhs;
lhs =y(38);
rhs =y(33);
residual(38)= lhs-rhs;
lhs =y(39);
rhs =y(38);
residual(39)= lhs-rhs;
lhs =y(40);
rhs =y(39);
residual(40)= lhs-rhs;
lhs =y(41);
rhs =y(34);
residual(41)= lhs-rhs;
lhs =y(42);
rhs =y(41);
residual(42)= lhs-rhs;
lhs =y(43);
rhs =y(42);
residual(43)= lhs-rhs;
lhs =y(44);
rhs =y(5);
residual(44)= lhs-rhs;
lhs =y(45);
rhs =y(44);
residual(45)= lhs-rhs;
lhs =y(46);
rhs =y(34);
residual(46)= lhs-rhs;
lhs =y(47);
rhs =y(46);
residual(47)= lhs-rhs;
lhs =y(48);
rhs =y(47);
residual(48)= lhs-rhs;
lhs =y(49);
rhs =y(33);
residual(49)= lhs-rhs;
lhs =y(50);
rhs =y(49);
residual(50)= lhs-rhs;
lhs =y(51);
rhs =y(50);
residual(51)= lhs-rhs;
lhs =y(52);
rhs =y(30);
residual(52)= lhs-rhs;
lhs =y(53);
rhs =y(52);
residual(53)= lhs-rhs;
lhs =y(54);
rhs =y(53);
residual(54)= lhs-rhs;
lhs =y(55);
rhs =y(32);
residual(55)= lhs-rhs;
lhs =y(56);
rhs =y(55);
residual(56)= lhs-rhs;
lhs =y(57);
rhs =y(56);
residual(57)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(57, 57);

  %
  % Jacobian matrix
  %

  g1(1,4)=(-4);
  g1(1,30)=1;
  g1(2,5)=(-2);
  g1(2,31)=1;
  g1(2,44)=(-1);
  g1(2,45)=(-1);
  g1(3,5)=(-4);
  g1(3,32)=1;
  g1(4,1)=(-1);
  g1(4,15)=1;
  g1(4,33)=1;
  g1(5,1)=(-1);
  g1(5,34)=1;
  g1(6,30)=1-params(1);
  g1(6,32)=(-(params(10)+params(6)+params(5)));
  g1(6,33)=(-(params(19)+params(15)+params(14)));
  g1(6,34)=(-(params(28)+params(24)+params(23)));
  g1(6,35)=(-params(11));
  g1(6,36)=(-params(12));
  g1(6,37)=(-params(13));
  g1(6,38)=(-params(20));
  g1(6,39)=(-params(21));
  g1(6,40)=(-params(22));
  g1(6,41)=(-params(29));
  g1(6,42)=(-params(30));
  g1(6,43)=(-params(31));
  g1(6,46)=(-params(25));
  g1(6,47)=(-params(26));
  g1(6,48)=(-params(27));
  g1(6,49)=(-params(16));
  g1(6,50)=(-params(17));
  g1(6,51)=(-params(18));
  g1(6,52)=(-params(2));
  g1(6,53)=(-params(3));
  g1(6,54)=(-params(4));
  g1(6,55)=(-params(7));
  g1(6,56)=(-params(8));
  g1(6,57)=(-params(9));
  g1(7,1)=params(36);
  g1(7,11)=params(37);
  g1(7,14)=(-1);
  g1(8,1)=params(36);
  g1(8,12)=params(37);
  g1(8,13)=(-1);
  g1(9,4)=(-1);
  g1(9,5)=1;
  g1(10,7)=1;
  g1(10,29)=1/(1+params(41));
  g1(11,1)=(-1);
  g1(11,6)=(-1);
  g1(11,7)=(-params(41));
  g1(11,8)=1;
  g1(11,9)=1;
  g1(12,3)=(-(T197*(-((params(36)+params(37))*params(38)*(1-params(35))))));
  g1(12,7)=(-(T197*(1+params(41)*params(35)-params(40)*(1-params(35))*params(39)*params(38))));
  g1(12,8)=1-T197;
  g1(12,29)=(-T197);
  g1(13,3)=(-(params(36)+params(37)));
  g1(13,6)=1;
  g1(13,7)=(-(params(39)*params(40)));
  g1(14,1)=1;
  g1(14,11)=(-params(39));
  g1(14,12)=(-(1-params(39)));
  g1(14,27)=(-1);
  g1(15,5)=1-params(35);
  g1(15,6)=(-params(43));
  g1(15,28)=(-params(43));
  g1(16,1)=(-1);
  g1(16,6)=params(38)-1;
  g1(16,10)=1;
  g1(17,1)=(-1);
  g1(17,6)=(-1);
  g1(17,7)=params(40);
  g1(17,11)=1;
  g1(17,14)=1;
  g1(18,2)=1;
  g1(18,27)=(-((1+params(37))/(params(36)+params(37))));
  g1(19,1)=(-1);
  g1(19,2)=1;
  g1(19,3)=1;
  g1(20,15)=params(36);
  g1(20,23)=params(37);
  g1(20,26)=(-1);
  g1(21,15)=params(36);
  g1(21,24)=params(37);
  g1(21,25)=(-1);
  g1(22,17)=(-1);
  g1(23,19)=1;
  g1(23,29)=1/(1+params(41));
  g1(24,15)=(-1);
  g1(24,18)=(-1);
  g1(24,19)=(-params(41));
  g1(24,20)=1;
  g1(24,21)=1;
  g1(25,16)=(-(T197*(-((params(36)+params(37))*params(38)*(1-params(35))))));
  g1(25,19)=(-(T197*(1+params(41)*params(35)-params(40)*(1-params(35))*params(39)*params(38))));
  g1(25,20)=1-T197;
  g1(25,29)=(-T197);
  g1(26,16)=(-(params(36)+params(37)));
  g1(26,18)=1;
  g1(26,19)=(-(params(39)*params(40)));
  g1(27,15)=1;
  g1(27,23)=(-params(39));
  g1(27,24)=(-(1-params(39)));
  g1(27,27)=(-1);
  g1(28,18)=1;
  g1(29,15)=(-1);
  g1(29,18)=params(38)-1;
  g1(29,22)=1;
  g1(30,15)=(-1);
  g1(30,18)=(-1);
  g1(30,19)=params(40);
  g1(30,23)=1;
  g1(30,26)=1;
  g1(31,2)=1;
  g1(31,15)=(-1);
  g1(31,16)=1;
  g1(32,27)=1-params(44);
  g1(33,28)=1-params(46);
  g1(34,29)=1-params(47);
  g1(35,32)=(-1);
  g1(35,35)=1;
  g1(36,35)=(-1);
  g1(36,36)=1;
  g1(37,36)=(-1);
  g1(37,37)=1;
  g1(38,33)=(-1);
  g1(38,38)=1;
  g1(39,38)=(-1);
  g1(39,39)=1;
  g1(40,39)=(-1);
  g1(40,40)=1;
  g1(41,34)=(-1);
  g1(41,41)=1;
  g1(42,41)=(-1);
  g1(42,42)=1;
  g1(43,42)=(-1);
  g1(43,43)=1;
  g1(44,5)=(-1);
  g1(44,44)=1;
  g1(45,44)=(-1);
  g1(45,45)=1;
  g1(46,34)=(-1);
  g1(46,46)=1;
  g1(47,46)=(-1);
  g1(47,47)=1;
  g1(48,47)=(-1);
  g1(48,48)=1;
  g1(49,33)=(-1);
  g1(49,49)=1;
  g1(50,49)=(-1);
  g1(50,50)=1;
  g1(51,50)=(-1);
  g1(51,51)=1;
  g1(52,30)=(-1);
  g1(52,52)=1;
  g1(53,52)=(-1);
  g1(53,53)=1;
  g1(54,53)=(-1);
  g1(54,54)=1;
  g1(55,32)=(-1);
  g1(55,55)=1;
  g1(56,55)=(-1);
  g1(56,56)=1;
  g1(57,56)=(-1);
  g1(57,57)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],57,3249);
end
end
