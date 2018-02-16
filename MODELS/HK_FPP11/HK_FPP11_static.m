function [residual, g1, g2, g3] = HK_FPP11_static(y, x, params)
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
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 41, 1);

%
% Model equations
%

lhs =y(14);
rhs =y(3)*4;
residual(1)= lhs-rhs;
lhs =y(15);
rhs =0.25*(4*y(8)+4*y(8)+4*y(8)+4*y(8));
residual(2)= lhs-rhs;
lhs =y(16);
rhs =4*y(8);
residual(3)= lhs-rhs;
lhs =y(17);
rhs =y(11)-y(12);
residual(4)= lhs-rhs;
lhs =y(18);
rhs =y(11);
residual(5)= lhs-rhs;
lhs =y(14);
rhs =params(32)*x(5)+y(18)*params(31)+y(18)*params(30)+y(18)*params(29)+y(18)*params(28)+y(18)*params(27)+y(18)*params(26)+y(18)*params(25)+y(18)*params(24)+y(18)*params(23)+y(17)*params(22)+y(17)*params(21)+y(17)*params(20)+y(17)*params(19)+y(17)*params(18)+y(17)*params(17)+y(17)*params(16)+y(17)*params(15)+y(17)*params(14)+y(16)*params(13)+y(16)*params(12)+y(16)*params(11)+y(16)*params(10)+y(16)*params(6)+y(16)*params(5)+y(14)*params(1)+y(14)*params(2)+y(14)*params(3)+y(14)*params(4)+y(16)*params(7)+y(16)*params(8)+y(16)*params(9);
residual(6)= lhs-rhs;
lhs =y(1);
rhs =y(1)*params(39)/params(43)+params(40)/params(43)*y(2)-1/params(43)*(y(3)-y(5)-y(4));
residual(7)= lhs-rhs;
lhs =y(4);
rhs =(params(40)+params(39)*params(52)-params(43))*params(41)*y(6)+((params(40)+params(39)*params(53)-params(43))*params(42)+params(39)*params(38)*(params(53)-1))*params(37)*y(7);
residual(8)= lhs-rhs;
lhs =y(2);
rhs =y(2)*params(46)/(1+params(44))-y(1)*params(47)/(1+params(44))-(y(3)-y(5)-y(4))+y(13);
residual(9)= lhs-rhs;
lhs =y(5);
rhs =params(65)*(y(5)*params(46)*params(59)+y(5)*params(62))+y(1)*params(48)+x(3);
residual(10)= lhs-rhs;
lhs =y(9);
rhs =params(39)*(y(11)-y(7));
residual(11)= lhs-rhs;
lhs =y(12);
rhs =params(41)*y(6)-y(7)*params(42)*params(37);
residual(12)= lhs-rhs;
lhs =y(1);
rhs =y(11)-y(12);
residual(13)= lhs-rhs;
lhs =y(8);
rhs =y(5);
residual(14)= lhs-rhs;
lhs =0;
rhs =y(5);
residual(15)= lhs-rhs;
lhs =y(6);
rhs =params(52)*y(6)+x(1);
residual(16)= lhs-rhs;
lhs =y(7);
rhs =params(53)*y(7)+x(2);
residual(17)= lhs-rhs;
lhs =y(13);
rhs =y(13)*params(51)+x(4);
residual(18)= lhs-rhs;
lhs =y(19);
rhs =y(16);
residual(19)= lhs-rhs;
lhs =y(20);
rhs =y(16);
residual(20)= lhs-rhs;
lhs =y(21);
rhs =y(16);
residual(21)= lhs-rhs;
lhs =y(22);
rhs =y(17);
residual(22)= lhs-rhs;
lhs =y(23);
rhs =y(17);
residual(23)= lhs-rhs;
lhs =y(24);
rhs =y(17);
residual(24)= lhs-rhs;
lhs =y(25);
rhs =y(18);
residual(25)= lhs-rhs;
lhs =y(26);
rhs =y(18);
residual(26)= lhs-rhs;
lhs =y(27);
rhs =y(18);
residual(27)= lhs-rhs;
lhs =y(28);
rhs =y(8);
residual(28)= lhs-rhs;
lhs =y(29);
rhs =y(8);
residual(29)= lhs-rhs;
lhs =y(30);
rhs =y(18);
residual(30)= lhs-rhs;
lhs =y(31);
rhs =y(18);
residual(31)= lhs-rhs;
lhs =y(32);
rhs =y(18);
residual(32)= lhs-rhs;
lhs =y(33);
rhs =y(17);
residual(33)= lhs-rhs;
lhs =y(34);
rhs =y(17);
residual(34)= lhs-rhs;
lhs =y(35);
rhs =y(17);
residual(35)= lhs-rhs;
lhs =y(36);
rhs =y(14);
residual(36)= lhs-rhs;
lhs =y(37);
rhs =y(14);
residual(37)= lhs-rhs;
lhs =y(38);
rhs =y(14);
residual(38)= lhs-rhs;
lhs =y(39);
rhs =y(16);
residual(39)= lhs-rhs;
lhs =y(40);
rhs =y(16);
residual(40)= lhs-rhs;
lhs =y(41);
rhs =y(16);
residual(41)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(41, 41);

  %
  % Jacobian matrix
  %

  g1(1,3)=(-4);
  g1(1,14)=1;
  g1(2,8)=(-4);
  g1(2,15)=1;
  g1(3,8)=(-4);
  g1(3,16)=1;
  g1(4,11)=(-1);
  g1(4,12)=1;
  g1(4,17)=1;
  g1(5,11)=(-1);
  g1(5,18)=1;
  g1(6,14)=1-(params(4)+params(3)+params(1)+params(2));
  g1(6,16)=(-(params(13)+params(12)+params(11)+params(10)+params(9)+params(8)+params(7)+params(6)+params(5)));
  g1(6,17)=(-(params(22)+params(21)+params(20)+params(19)+params(18)+params(17)+params(16)+params(15)+params(14)));
  g1(6,18)=(-(params(31)+params(30)+params(29)+params(28)+params(27)+params(26)+params(25)+params(24)+params(23)));
  g1(7,1)=1-params(39)/params(43);
  g1(7,2)=(-(params(40)/params(43)));
  g1(7,3)=1/params(43);
  g1(7,4)=(-(1/params(43)));
  g1(7,5)=(-(1/params(43)));
  g1(8,4)=1;
  g1(8,6)=(-((params(40)+params(39)*params(52)-params(43))*params(41)));
  g1(8,7)=(-(((params(40)+params(39)*params(53)-params(43))*params(42)+params(39)*params(38)*(params(53)-1))*params(37)));
  g1(9,1)=params(47)/(1+params(44));
  g1(9,2)=1-params(46)/(1+params(44));
  g1(9,3)=1;
  g1(9,4)=(-1);
  g1(9,5)=(-1);
  g1(9,13)=(-1);
  g1(10,1)=(-params(48));
  g1(10,5)=1-params(65)*(params(46)*params(59)+params(62));
  g1(11,7)=params(39);
  g1(11,9)=1;
  g1(11,11)=(-params(39));
  g1(12,6)=(-params(41));
  g1(12,7)=params(42)*params(37);
  g1(12,12)=1;
  g1(13,1)=1;
  g1(13,11)=(-1);
  g1(13,12)=1;
  g1(14,5)=(-1);
  g1(14,8)=1;
  g1(15,5)=(-1);
  g1(16,6)=1-params(52);
  g1(17,7)=1-params(53);
  g1(18,13)=1-params(51);
  g1(19,16)=(-1);
  g1(19,19)=1;
  g1(20,16)=(-1);
  g1(20,20)=1;
  g1(21,16)=(-1);
  g1(21,21)=1;
  g1(22,17)=(-1);
  g1(22,22)=1;
  g1(23,17)=(-1);
  g1(23,23)=1;
  g1(24,17)=(-1);
  g1(24,24)=1;
  g1(25,18)=(-1);
  g1(25,25)=1;
  g1(26,18)=(-1);
  g1(26,26)=1;
  g1(27,18)=(-1);
  g1(27,27)=1;
  g1(28,8)=(-1);
  g1(28,28)=1;
  g1(29,8)=(-1);
  g1(29,29)=1;
  g1(30,18)=(-1);
  g1(30,30)=1;
  g1(31,18)=(-1);
  g1(31,31)=1;
  g1(32,18)=(-1);
  g1(32,32)=1;
  g1(33,17)=(-1);
  g1(33,33)=1;
  g1(34,17)=(-1);
  g1(34,34)=1;
  g1(35,17)=(-1);
  g1(35,35)=1;
  g1(36,14)=(-1);
  g1(36,36)=1;
  g1(37,14)=(-1);
  g1(37,37)=1;
  g1(38,14)=(-1);
  g1(38,38)=1;
  g1(39,16)=(-1);
  g1(39,39)=1;
  g1(40,16)=(-1);
  g1(40,40)=1;
  g1(41,16)=(-1);
  g1(41,41)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],41,1681);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],41,68921);
end
end
end
end
