function [residual, g1, g2] = NK_CGG02_static(y, x, params)
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

residual = zeros( 59, 1);

%
% Model equations
%

T213 = 1/params(35);
T233 = 1/params(43);
lhs =y(17);
rhs =y(5);
residual(1)= lhs-rhs;
lhs =y(18);
rhs =0.25*(y(4)+y(4)+y(37)+y(38));
residual(2)= lhs-rhs;
lhs =y(19);
rhs =y(4);
residual(3)= lhs-rhs;
lhs =y(20);
rhs =y(1);
residual(4)= lhs-rhs;
lhs =y(21);
rhs =y(3);
residual(5)= lhs-rhs;
lhs =y(17);
rhs =params(32)*x(7)+params(31)*y(30)+params(30)*y(29)+params(29)*y(28)+y(21)*params(28)+params(27)*y(41)+params(26)*y(40)+params(25)*y(39)+y(21)*params(24)+y(21)*params(23)+params(22)*y(27)+params(21)*y(26)+params(20)*y(25)+y(20)*params(19)+params(18)*y(44)+params(17)*y(43)+params(16)*y(42)+y(20)*params(15)+y(20)*params(14)+params(13)*y(24)+params(12)*y(23)+params(11)*y(22)+y(19)*params(10)+y(19)*params(6)+y(19)*params(5)+y(17)*params(1)+params(2)*y(45)+params(3)*y(46)+params(4)*y(47)+params(7)*y(48)+params(8)*y(49)+params(9)*y(50);
residual(6)= lhs-rhs;
lhs =y(13);
rhs =params(32)*x(5)+params(22)*y(36)+params(21)*y(35)+params(20)*y(34)+params(19)*y(9)+params(18)*y(53)+params(17)*y(52)+params(16)*y(51)+params(15)*y(9)+params(14)*y(9)+params(13)*y(33)+params(12)*y(32)+params(11)*y(31)+params(10)*y(12)+params(6)*y(12)+params(5)*y(12)+params(1)*y(13)+params(2)*y(54)+params(3)*y(55)+params(4)*y(56)+params(7)*y(57)+params(8)*y(58)+params(9)*y(59);
residual(7)= lhs-rhs;
lhs =y(1);
rhs =y(1)-T213*(y(5)-y(4)-y(6));
residual(8)= lhs-rhs;
lhs =y(4);
rhs =y(4)*params(36)+y(1)*params(37)+y(7);
residual(9)= lhs-rhs;
residual(10) = y(6);
lhs =y(2);
rhs =T233*((1+params(44))*y(8)-params(41)*y(11));
residual(11)= lhs-rhs;
lhs =y(1);
rhs =y(3)-y(2);
residual(12)= lhs-rhs;
lhs =y(8);
rhs =y(8)*params(38)+x(2);
residual(13)= lhs-rhs;
lhs =y(7);
rhs =y(7)*params(39)+x(1);
residual(14)= lhs-rhs;
lhs =y(9);
rhs =y(9)-T213*(y(13)-y(12)-y(14))+x(4);
residual(15)= lhs-rhs;
lhs =y(12);
rhs =y(12)*params(36)+y(9)*params(37)+y(15);
residual(16)= lhs-rhs;
residual(17) = y(14);
lhs =y(10);
rhs =T233*((1+params(44))*y(16)-y(3)*params(41));
residual(18)= lhs-rhs;
lhs =y(9);
rhs =y(11)-y(10);
residual(19)= lhs-rhs;
lhs =y(16);
rhs =params(38)*y(16)+x(6);
residual(20)= lhs-rhs;
lhs =y(15);
rhs =params(39)*y(15)+x(3);
residual(21)= lhs-rhs;
lhs =y(22);
rhs =y(19);
residual(22)= lhs-rhs;
lhs =y(23);
rhs =y(22);
residual(23)= lhs-rhs;
lhs =y(24);
rhs =y(23);
residual(24)= lhs-rhs;
lhs =y(25);
rhs =y(20);
residual(25)= lhs-rhs;
lhs =y(26);
rhs =y(25);
residual(26)= lhs-rhs;
lhs =y(27);
rhs =y(26);
residual(27)= lhs-rhs;
lhs =y(28);
rhs =y(21);
residual(28)= lhs-rhs;
lhs =y(29);
rhs =y(28);
residual(29)= lhs-rhs;
lhs =y(30);
rhs =y(29);
residual(30)= lhs-rhs;
lhs =y(31);
rhs =y(12);
residual(31)= lhs-rhs;
lhs =y(32);
rhs =y(31);
residual(32)= lhs-rhs;
lhs =y(33);
rhs =y(32);
residual(33)= lhs-rhs;
lhs =y(34);
rhs =y(9);
residual(34)= lhs-rhs;
lhs =y(35);
rhs =y(34);
residual(35)= lhs-rhs;
lhs =y(36);
rhs =y(35);
residual(36)= lhs-rhs;
lhs =y(37);
rhs =y(4);
residual(37)= lhs-rhs;
lhs =y(38);
rhs =y(37);
residual(38)= lhs-rhs;
lhs =y(39);
rhs =y(21);
residual(39)= lhs-rhs;
lhs =y(40);
rhs =y(39);
residual(40)= lhs-rhs;
lhs =y(41);
rhs =y(40);
residual(41)= lhs-rhs;
lhs =y(42);
rhs =y(20);
residual(42)= lhs-rhs;
lhs =y(43);
rhs =y(42);
residual(43)= lhs-rhs;
lhs =y(44);
rhs =y(43);
residual(44)= lhs-rhs;
lhs =y(45);
rhs =y(17);
residual(45)= lhs-rhs;
lhs =y(46);
rhs =y(45);
residual(46)= lhs-rhs;
lhs =y(47);
rhs =y(46);
residual(47)= lhs-rhs;
lhs =y(48);
rhs =y(19);
residual(48)= lhs-rhs;
lhs =y(49);
rhs =y(48);
residual(49)= lhs-rhs;
lhs =y(50);
rhs =y(49);
residual(50)= lhs-rhs;
lhs =y(51);
rhs =y(9);
residual(51)= lhs-rhs;
lhs =y(52);
rhs =y(51);
residual(52)= lhs-rhs;
lhs =y(53);
rhs =y(52);
residual(53)= lhs-rhs;
lhs =y(54);
rhs =y(13);
residual(54)= lhs-rhs;
lhs =y(55);
rhs =y(54);
residual(55)= lhs-rhs;
lhs =y(56);
rhs =y(55);
residual(56)= lhs-rhs;
lhs =y(57);
rhs =y(12);
residual(57)= lhs-rhs;
lhs =y(58);
rhs =y(57);
residual(58)= lhs-rhs;
lhs =y(59);
rhs =y(58);
residual(59)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(59, 59);

  %
  % Jacobian matrix
  %

  g1(1,5)=(-1);
  g1(1,17)=1;
  g1(2,4)=(-0.5);
  g1(2,18)=1;
  g1(2,37)=(-0.25);
  g1(2,38)=(-0.25);
  g1(3,4)=(-1);
  g1(3,19)=1;
  g1(4,1)=(-1);
  g1(4,20)=1;
  g1(5,3)=(-1);
  g1(5,21)=1;
  g1(6,17)=1-params(1);
  g1(6,19)=(-(params(10)+params(6)+params(5)));
  g1(6,20)=(-(params(19)+params(15)+params(14)));
  g1(6,21)=(-(params(28)+params(24)+params(23)));
  g1(6,22)=(-params(11));
  g1(6,23)=(-params(12));
  g1(6,24)=(-params(13));
  g1(6,25)=(-params(20));
  g1(6,26)=(-params(21));
  g1(6,27)=(-params(22));
  g1(6,28)=(-params(29));
  g1(6,29)=(-params(30));
  g1(6,30)=(-params(31));
  g1(6,39)=(-params(25));
  g1(6,40)=(-params(26));
  g1(6,41)=(-params(27));
  g1(6,42)=(-params(16));
  g1(6,43)=(-params(17));
  g1(6,44)=(-params(18));
  g1(6,45)=(-params(2));
  g1(6,46)=(-params(3));
  g1(6,47)=(-params(4));
  g1(6,48)=(-params(7));
  g1(6,49)=(-params(8));
  g1(6,50)=(-params(9));
  g1(7,9)=(-(params(19)+params(15)+params(14)));
  g1(7,12)=(-(params(10)+params(6)+params(5)));
  g1(7,13)=1-params(1);
  g1(7,31)=(-params(11));
  g1(7,32)=(-params(12));
  g1(7,33)=(-params(13));
  g1(7,34)=(-params(20));
  g1(7,35)=(-params(21));
  g1(7,36)=(-params(22));
  g1(7,51)=(-params(16));
  g1(7,52)=(-params(17));
  g1(7,53)=(-params(18));
  g1(7,54)=(-params(2));
  g1(7,55)=(-params(3));
  g1(7,56)=(-params(4));
  g1(7,57)=(-params(7));
  g1(7,58)=(-params(8));
  g1(7,59)=(-params(9));
  g1(8,4)=(-T213);
  g1(8,5)=T213;
  g1(8,6)=(-T213);
  g1(9,1)=(-params(37));
  g1(9,4)=1-params(36);
  g1(9,7)=(-1);
  g1(10,6)=1;
  g1(11,2)=1;
  g1(11,8)=(-(T233*(1+params(44))));
  g1(11,11)=(-(T233*(-params(41))));
  g1(12,1)=1;
  g1(12,2)=1;
  g1(12,3)=(-1);
  g1(13,8)=1-params(38);
  g1(14,7)=1-params(39);
  g1(15,12)=(-T213);
  g1(15,13)=T213;
  g1(15,14)=(-T213);
  g1(16,9)=(-params(37));
  g1(16,12)=1-params(36);
  g1(16,15)=(-1);
  g1(17,14)=1;
  g1(18,3)=(-(T233*(-params(41))));
  g1(18,10)=1;
  g1(18,16)=(-(T233*(1+params(44))));
  g1(19,9)=1;
  g1(19,10)=1;
  g1(19,11)=(-1);
  g1(20,16)=1-params(38);
  g1(21,15)=1-params(39);
  g1(22,19)=(-1);
  g1(22,22)=1;
  g1(23,22)=(-1);
  g1(23,23)=1;
  g1(24,23)=(-1);
  g1(24,24)=1;
  g1(25,20)=(-1);
  g1(25,25)=1;
  g1(26,25)=(-1);
  g1(26,26)=1;
  g1(27,26)=(-1);
  g1(27,27)=1;
  g1(28,21)=(-1);
  g1(28,28)=1;
  g1(29,28)=(-1);
  g1(29,29)=1;
  g1(30,29)=(-1);
  g1(30,30)=1;
  g1(31,12)=(-1);
  g1(31,31)=1;
  g1(32,31)=(-1);
  g1(32,32)=1;
  g1(33,32)=(-1);
  g1(33,33)=1;
  g1(34,9)=(-1);
  g1(34,34)=1;
  g1(35,34)=(-1);
  g1(35,35)=1;
  g1(36,35)=(-1);
  g1(36,36)=1;
  g1(37,4)=(-1);
  g1(37,37)=1;
  g1(38,37)=(-1);
  g1(38,38)=1;
  g1(39,21)=(-1);
  g1(39,39)=1;
  g1(40,39)=(-1);
  g1(40,40)=1;
  g1(41,40)=(-1);
  g1(41,41)=1;
  g1(42,20)=(-1);
  g1(42,42)=1;
  g1(43,42)=(-1);
  g1(43,43)=1;
  g1(44,43)=(-1);
  g1(44,44)=1;
  g1(45,17)=(-1);
  g1(45,45)=1;
  g1(46,45)=(-1);
  g1(46,46)=1;
  g1(47,46)=(-1);
  g1(47,47)=1;
  g1(48,19)=(-1);
  g1(48,48)=1;
  g1(49,48)=(-1);
  g1(49,49)=1;
  g1(50,49)=(-1);
  g1(50,50)=1;
  g1(51,9)=(-1);
  g1(51,51)=1;
  g1(52,51)=(-1);
  g1(52,52)=1;
  g1(53,52)=(-1);
  g1(53,53)=1;
  g1(54,13)=(-1);
  g1(54,54)=1;
  g1(55,54)=(-1);
  g1(55,55)=1;
  g1(56,55)=(-1);
  g1(56,56)=1;
  g1(57,12)=(-1);
  g1(57,57)=1;
  g1(58,57)=(-1);
  g1(58,58)=1;
  g1(59,58)=(-1);
  g1(59,59)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],59,3481);
end
end
