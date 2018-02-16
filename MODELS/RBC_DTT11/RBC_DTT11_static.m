function [residual, g1, g2] = RBC_DTT11_static(y, x, params)
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

residual = zeros( 53, 1);

%
% Model equations
%

T196 = exp(exp(y(22))^2/2);
T197 = T196/2;
T200 = (exp(y(22))^2-y(10))/1.414213562373095;
T201 = T200/exp(y(22));
T202 = erf(T201);
T207 = y(10)/1.414213562373095/exp(y(22));
T208 = erf(T207);
T226 = exp((-0.5)*(y(10)/exp(y(22)))^2);
T229 = T226/2.506628274794649/exp(y(22));
T247 = exp(y(2))*exp(y(4))/(1-y(17)/y(18));
T254 = exp(y(1))^(-params(35));
T389 = exp(y(1))*getPowerDeriv(exp(y(1)),(-params(35)),1);
T429 = 2/(exp(T201^2)*1.772453850905516);
T436 = 2/(1.772453850905516*exp(T207^2));
T466 = (1-y(17)/y(18))*(1-y(17)/y(18));
T486 = T196*exp(y(22))*2*exp(y(22))/2/2;
T493 = T429*(exp(y(22))*exp(y(22))*2*exp(y(22))/1.414213562373095-exp(y(22))*T200)/(exp(y(22))*exp(y(22)));
T500 = T436*(-(exp(y(22))*y(10)/1.414213562373095))/(exp(y(22))*exp(y(22)));
lhs =y(26);
rhs =400*y(2);
residual(1)= lhs-rhs;
lhs =y(27);
rhs =25*(4*y(3)+4*y(3)+4*y(40)+4*y(41));
residual(2)= lhs-rhs;
lhs =y(28);
rhs =400*y(3);
residual(3)= lhs-rhs;
lhs =y(29);
rhs =100*y(12);
residual(4)= lhs-rhs;
residual(5) = y(30);
lhs =y(26);
rhs =params(32)*x(6)+params(31)*y(39)+params(30)*y(38)+params(29)*y(37)+y(29)*params(28)+params(27)*y(44)+params(26)*y(43)+params(25)*y(42)+y(29)*params(24)+y(29)*params(23)+params(22)*y(36)+params(21)*y(35)+params(20)*y(34)+y(30)*params(19)+params(18)*y(47)+params(17)*y(46)+params(16)*y(45)+y(30)*params(15)+y(30)*params(14)+params(13)*y(33)+params(12)*y(32)+params(11)*y(31)+y(28)*params(10)+y(28)*params(6)+y(28)*params(5)+y(26)*params(1)+params(2)*y(48)+params(3)*y(49)+params(4)*y(50)+params(7)*y(51)+params(8)*y(52)+params(9)*y(53);
residual(6)= lhs-rhs;
lhs =y(24);
rhs =y(1)-params(34)*exp(y(11));
residual(7)= lhs-rhs;
lhs =y(25);
rhs =y(24)+y(25)*params(38);
residual(8)= lhs-rhs;
residual(9) = (-y(17))+exp(y(20))*exp(y(10))*y(9);
residual(10) = (-y(18))+1-y(8);
residual(11) = (-y(16))+y(4);
residual(12) = (-y(6))+T197*(1+T202)-exp(y(10))/2*(1-T208);
residual(13) = (-y(7))+T197*(1-T202);
residual(14) = (-y(9))+T229/exp(y(10));
residual(15) = (-y(8))+(1+T208)/2;
residual(16) = y(6)*(-exp(y(13)))+T247;
residual(17) = (-1)/exp(y(2))+params(38)*T254/T254/exp(y(3));
residual(18) = (-exp(y(13)))*(1-exp(y(20))*y(7)-y(6))+exp(y(2))*(1-exp(y(4)));
residual(19) = exp(y(4))*(-exp(y(11)))*exp(y(19))+exp(y(13))*exp(y(5));
residual(20) = exp(y(3))*(-exp(y(5)))*exp(y(16))+exp(y(5))*exp(y(13))*y(6)*(1-exp(y(21)));
residual(21) = (-exp(y(13)))+T254*exp(y(19))/params(34);
residual(22) = exp(y(1))+(1-exp(y(20))*y(7))*exp(y(11))*exp(y(19))*(-(1-params(48)));
residual(23) = (-exp(y(12)))+exp(y(11))*exp(y(19));
residual(24) = (-exp(y(13)))+(1-exp(y(4)))*exp(y(14))/exp(y(10));
residual(25) = (-exp(y(15)))+exp(y(14))/exp(y(2));
residual(26) = y(19)-y(19)*params(43)-x(1);
residual(27) = y(20)-(1-params(44))*log(params(36))-y(20)*params(44)-x(2);
residual(28) = y(21)-(1-params(45))*log(params(37))-y(21)*params(45)-x(3);
residual(29) = y(22)-(1-params(46))*log(params(42))-y(22)*params(46)-x(4);
residual(30) = y(23)-params(43)*y(23)-x(5);
lhs =y(31);
rhs =y(28);
residual(31)= lhs-rhs;
lhs =y(32);
rhs =y(31);
residual(32)= lhs-rhs;
lhs =y(33);
rhs =y(32);
residual(33)= lhs-rhs;
lhs =y(34);
rhs =y(30);
residual(34)= lhs-rhs;
lhs =y(35);
rhs =y(34);
residual(35)= lhs-rhs;
lhs =y(36);
rhs =y(35);
residual(36)= lhs-rhs;
lhs =y(37);
rhs =y(29);
residual(37)= lhs-rhs;
lhs =y(38);
rhs =y(37);
residual(38)= lhs-rhs;
lhs =y(39);
rhs =y(38);
residual(39)= lhs-rhs;
lhs =y(40);
rhs =y(3);
residual(40)= lhs-rhs;
lhs =y(41);
rhs =y(40);
residual(41)= lhs-rhs;
lhs =y(42);
rhs =y(29);
residual(42)= lhs-rhs;
lhs =y(43);
rhs =y(42);
residual(43)= lhs-rhs;
lhs =y(44);
rhs =y(43);
residual(44)= lhs-rhs;
lhs =y(45);
rhs =y(30);
residual(45)= lhs-rhs;
lhs =y(46);
rhs =y(45);
residual(46)= lhs-rhs;
lhs =y(47);
rhs =y(46);
residual(47)= lhs-rhs;
lhs =y(48);
rhs =y(26);
residual(48)= lhs-rhs;
lhs =y(49);
rhs =y(48);
residual(49)= lhs-rhs;
lhs =y(50);
rhs =y(49);
residual(50)= lhs-rhs;
lhs =y(51);
rhs =y(28);
residual(51)= lhs-rhs;
lhs =y(52);
rhs =y(51);
residual(52)= lhs-rhs;
lhs =y(53);
rhs =y(52);
residual(53)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(53, 53);

  %
  % Jacobian matrix
  %

  g1(1,2)=(-400);
  g1(1,26)=1;
  g1(2,3)=(-200);
  g1(2,27)=1;
  g1(2,40)=(-100);
  g1(2,41)=(-100);
  g1(3,3)=(-400);
  g1(3,28)=1;
  g1(4,12)=(-100);
  g1(4,29)=1;
  g1(5,30)=1;
  g1(6,26)=1-params(1);
  g1(6,28)=(-(params(10)+params(6)+params(5)));
  g1(6,29)=(-(params(28)+params(24)+params(23)));
  g1(6,30)=(-(params(19)+params(15)+params(14)));
  g1(6,31)=(-params(11));
  g1(6,32)=(-params(12));
  g1(6,33)=(-params(13));
  g1(6,34)=(-params(20));
  g1(6,35)=(-params(21));
  g1(6,36)=(-params(22));
  g1(6,37)=(-params(29));
  g1(6,38)=(-params(30));
  g1(6,39)=(-params(31));
  g1(6,42)=(-params(25));
  g1(6,43)=(-params(26));
  g1(6,44)=(-params(27));
  g1(6,45)=(-params(16));
  g1(6,46)=(-params(17));
  g1(6,47)=(-params(18));
  g1(6,48)=(-params(2));
  g1(6,49)=(-params(3));
  g1(6,50)=(-params(4));
  g1(6,51)=(-params(7));
  g1(6,52)=(-params(8));
  g1(6,53)=(-params(9));
  g1(7,1)=(-1);
  g1(7,11)=params(34)*exp(y(11));
  g1(7,24)=1;
  g1(8,24)=(-1);
  g1(8,25)=1-params(38);
  g1(9,9)=exp(y(20))*exp(y(10));
  g1(9,10)=exp(y(20))*exp(y(10))*y(9);
  g1(9,17)=(-1);
  g1(9,20)=exp(y(20))*exp(y(10))*y(9);
  g1(10,8)=(-1);
  g1(10,18)=(-1);
  g1(11,4)=1;
  g1(11,16)=(-1);
  g1(12,6)=(-1);
  g1(12,10)=T197*(-0.7071067811865476)/exp(y(22))*T429-(exp(y(10))/2*(1-T208)+exp(y(10))/2*(-(0.7071067811865476/exp(y(22))*T436)));
  g1(12,22)=(1+T202)*T486+T197*T493-exp(y(10))/2*(-T500);
  g1(13,7)=(-1);
  g1(13,10)=T197*(-((-0.7071067811865476)/exp(y(22))*T429));
  g1(13,22)=(1-T202)*T486+T197*(-T493);
  g1(14,9)=(-1);
  g1(14,10)=(exp(y(10))*T226*(-0.5)*1/exp(y(22))*2*y(10)/exp(y(22))/2.506628274794649/exp(y(22))-exp(y(10))*T229)/(exp(y(10))*exp(y(10)));
  g1(14,22)=(exp(y(22))*T226*(-0.5)*2*y(10)/exp(y(22))*(-(y(10)*exp(y(22))))/(exp(y(22))*exp(y(22)))/2.506628274794649-exp(y(22))*T226/2.506628274794649)/(exp(y(22))*exp(y(22)))/exp(y(10));
  g1(15,8)=(-1);
  g1(15,10)=0.7071067811865476/exp(y(22))*T436/2;
  g1(15,22)=T500/2;
  g1(16,2)=T247;
  g1(16,4)=T247;
  g1(16,6)=(-exp(y(13)));
  g1(16,13)=y(6)*(-exp(y(13)));
  g1(16,17)=(-(exp(y(2))*exp(y(4))*(-(1/y(18)))))/T466;
  g1(16,18)=(-(exp(y(2))*exp(y(4))*(-((-y(17))/(y(18)*y(18))))))/T466;
  g1(17,1)=(T254*params(38)*T389-params(38)*T254*T389)/(T254*T254)/exp(y(3));
  g1(17,2)=exp(y(2))/(exp(y(2))*exp(y(2)));
  g1(17,3)=(-(params(38)*T254/T254*exp(y(3))))/(exp(y(3))*exp(y(3)));
  g1(18,2)=exp(y(2))*(1-exp(y(4)));
  g1(18,4)=exp(y(2))*(-exp(y(4)));
  g1(18,6)=exp(y(13));
  g1(18,7)=(-exp(y(13)))*(-exp(y(20)));
  g1(18,13)=(-exp(y(13)))*(1-exp(y(20))*y(7)-y(6));
  g1(18,20)=(-exp(y(13)))*(-(exp(y(20))*y(7)));
  g1(19,4)=exp(y(4))*(-exp(y(11)))*exp(y(19));
  g1(19,5)=exp(y(13))*exp(y(5));
  g1(19,11)=exp(y(4))*(-exp(y(11)))*exp(y(19));
  g1(19,13)=exp(y(13))*exp(y(5));
  g1(19,19)=exp(y(4))*(-exp(y(11)))*exp(y(19));
  g1(20,3)=exp(y(3))*(-exp(y(5)))*exp(y(16));
  g1(20,5)=exp(y(3))*(-exp(y(5)))*exp(y(16))+exp(y(5))*exp(y(13))*y(6)*(1-exp(y(21)));
  g1(20,6)=exp(y(5))*exp(y(13))*(1-exp(y(21)));
  g1(20,13)=exp(y(5))*exp(y(13))*y(6)*(1-exp(y(21)));
  g1(20,16)=exp(y(3))*(-exp(y(5)))*exp(y(16));
  g1(20,21)=exp(y(5))*exp(y(13))*y(6)*(-exp(y(21)));
  g1(21,1)=exp(y(19))*T389/params(34);
  g1(21,13)=(-exp(y(13)));
  g1(21,19)=T254*exp(y(19))/params(34);
  g1(22,1)=exp(y(1));
  g1(22,7)=exp(y(11))*exp(y(19))*(-(1-params(48)))*(-exp(y(20)));
  g1(22,11)=(1-exp(y(20))*y(7))*exp(y(11))*exp(y(19))*(-(1-params(48)));
  g1(22,19)=(1-exp(y(20))*y(7))*exp(y(11))*exp(y(19))*(-(1-params(48)));
  g1(22,20)=exp(y(11))*exp(y(19))*(-(1-params(48)))*(-(exp(y(20))*y(7)));
  g1(23,11)=exp(y(11))*exp(y(19));
  g1(23,12)=(-exp(y(12)));
  g1(23,19)=exp(y(11))*exp(y(19));
  g1(24,4)=exp(y(14))*(-exp(y(4)))/exp(y(10));
  g1(24,10)=(-(exp(y(10))*(1-exp(y(4)))*exp(y(14))))/(exp(y(10))*exp(y(10)));
  g1(24,13)=(-exp(y(13)));
  g1(24,14)=(1-exp(y(4)))*exp(y(14))/exp(y(10));
  g1(25,2)=(-(exp(y(2))*exp(y(14))))/(exp(y(2))*exp(y(2)));
  g1(25,14)=exp(y(14))/exp(y(2));
  g1(25,15)=(-exp(y(15)));
  g1(26,19)=1-params(43);
  g1(27,20)=1-params(44);
  g1(28,21)=1-params(45);
  g1(29,22)=1-params(46);
  g1(30,23)=1-params(43);
  g1(31,28)=(-1);
  g1(31,31)=1;
  g1(32,31)=(-1);
  g1(32,32)=1;
  g1(33,32)=(-1);
  g1(33,33)=1;
  g1(34,30)=(-1);
  g1(34,34)=1;
  g1(35,34)=(-1);
  g1(35,35)=1;
  g1(36,35)=(-1);
  g1(36,36)=1;
  g1(37,29)=(-1);
  g1(37,37)=1;
  g1(38,37)=(-1);
  g1(38,38)=1;
  g1(39,38)=(-1);
  g1(39,39)=1;
  g1(40,3)=(-1);
  g1(40,40)=1;
  g1(41,40)=(-1);
  g1(41,41)=1;
  g1(42,29)=(-1);
  g1(42,42)=1;
  g1(43,42)=(-1);
  g1(43,43)=1;
  g1(44,43)=(-1);
  g1(44,44)=1;
  g1(45,30)=(-1);
  g1(45,45)=1;
  g1(46,45)=(-1);
  g1(46,46)=1;
  g1(47,46)=(-1);
  g1(47,47)=1;
  g1(48,26)=(-1);
  g1(48,48)=1;
  g1(49,48)=(-1);
  g1(49,49)=1;
  g1(50,49)=(-1);
  g1(50,50)=1;
  g1(51,28)=(-1);
  g1(51,51)=1;
  g1(52,51)=(-1);
  g1(52,52)=1;
  g1(53,52)=(-1);
  g1(53,53)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],53,2809);
end
end
