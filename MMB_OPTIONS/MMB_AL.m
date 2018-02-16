%%
clear all; clc; modelbase.totaltime = cputime; close all;
%addpath('C:\dynare\4.2.5\matlab')
modelbase.homepath = cd;     
addpath(modelbase.homepath);

% save results to the following file (an excel sheet called results.xls is
% the default). If you want to change to another filename, change line 8. If
% you want to change to another path/filename, then activate line 9 and
% adjust it accordingly.
modelbase.savepath = [modelbase.homepath num2str('\') num2str('results.xls')];
%modelbase.savepath = 'C:\EigeneDateien\Lehrstuhlaufgaben\ModelBase\DynareModelBase080709\DynareModelBase\results.xls';
if exist(modelbase.savepath) ~= 0
    disp('The file you want to save your results in already exists.'); disp(' '); 
    disp('If you want to keep it, and save to a different file type: 0');
    disp('If you want to overwrite it, type: 1');
    choosepath = input('   ');
    if choosepath == 1
        delete(modelbase.savepath);
    else
        disp('Please go back to the mainfile and modify the path in line 5. Afterwards start again');
        return
    end
end



%**********************************************************************************************************************
%                    This is the main file of the Dynare Model Base.                                                  %
%**********************************************************************************************************************
%
% How to use the file:
% 1) Press the run button or the F5 button on your keyboard
% 2) Choose a monetary policy rule, models and statistics according to the menues
%
%
%
% How to add a model to this model base:
% 1) Create a file of the model in dynare.
%           - The file name should be short. For example "NK_RW97.mod" for the
%             Woodford, Rotemberg (1997) model.
%           - The file name must have the ending ".mod".
%           - The output gap variable must have the name "outputgap" and
%             must be expressed in percent.
%           - The inflation variable (annual inflation) must have the name
%             "inflation" and must be expressed in percent.
%           - The annualized quarterly inflation variable must have the
%             name "inflationq" and must be expressed in percent.
%           - The interest rate (policy instrument) must have the name
%             "interest" and must be expressed in percent.
%           - The monetary policy shock must have the name "interest_".
%           - If the original variables are expressed in percent/100 terms,
%             then the parameter "std_r_" must be set equal to 100.
%           - Suppress displaying any output from the dynare file. For example 
%             write comments in front of "steady" and "check" (//steady, //check) 
%             and make sure that the simulation command looks like this: 
%             stoch_simul(irf = 0, ar=100, noprint);
%             In no case the command "periods" is allowed to deviate from
%             0, i.e. don't use stoch_simul(irf = 0, ar=100, periods=20000, noprint);
%             The Modelbase would print the wrong autocorrelationfunctions!
%           - Make sure that you don't have two times the same parameter
%             name. Be aware that Dynare is not case sensitive, i.e. "BETA"
%             and "beta" are the same paramters.
% 
% 2) Create a subfolder to the folder "MMB" 
%           - The folder should have the same short name as the dynare file
%             created before (for example c:\MMB\NK_RW97)
%           - Save the dynare file created above in this subfolder
%             (for example c:\MMB\NK_RW97\NK_RW97.mod)
%
% 3) Add few lines of code in this file (\DynareModelBase\MMB_AL.m) as follows:
%           - Only add code in the cell immediately following these
%             instructions
%           - Add the short names of the model, followed by colon and then
%             full name of the model (for ex. 1.1 NK_RW97: Rotemberg, Woodford (1997) ) 
%             to the lines right below this text, into proper group. 
%           - Add the short name also to the vector "names" below. If the
%             name is not long enough you might have to add spaces to fill up
%             the row. 
%             Again you might have to add up with some spaces to fill the
%             row.
%           - If the original variables are expressed in percent, add "1"
%             at the respective row in the "modelbase.variabledim" vector, if
%             the original variables are expressed in percent/100, add "2".
%
% 4) Don't change anything else. Just press the run button or the F5 button.

%%
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp('Dynare Model Base');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
modelbase.names_full = {'1.  Small Calibrated Models';
                        '    1.1. NK_RW97: Rotemberg, Woodford (1997)';
                        '    1.2. NK_LWW03: Levin, Wieland, Williams (2003)';
                        '    1.3. NK_CGG99: Clarida, Gali, Gertler (1999) Hybrid';
                        '    1.4. NK_CGG02: Clarida, Gali, Gertler (2002) 2-Country';
                        '    1.5. NK_MCN99cr: McCallum, Nelson (1999) (cr: Calvo-Rotemberg model)';
                        '    1.6. NK_IR04: Ireland (2004)';
                        '    1.7. NK_BGG99: Bernanke, Gertler, Gilchrist (1999)';
                        '    1.8. NK_GM05: Galí, Monacelli (2005)';
                        '    1.9. NK_GK09: Gertler, Karadi (2009)';
                        '    1.10. NK_CK08: Christoffel, Kuester (2008)';
                        '    1.11. NK_CKL09: Christoffel, Kuester, Linzert (2009)';
                        '    1.12. NK_RW06: Ravenna, Walsh (2006)';
                        '';
                        '2. Estimated US Models';
                        '    2.1. US_FM95: Fuhrer, Moore (1995)';
                        '    2.2. US_OW98: Orphanides, Wieland (1998) equivalent to MSR model in Levin et al. (2003)';
                        '    2.3. US_FRB03: FRB-US model linearized by Levin, Wieland, Williams (2003)';
                        '    2.4. US_FRB08: FRB-US model 08 linearized by Laubach (2008)';
                        '    2.5. US_FRB08mx: FRB-US model 08 mixed expectations, linearized by Laubach (2008)';
                        '    2.6. US_SW07: Smets, Wouters (2007)';
                        '    2.7. US_ACEL: CEE/ACEL model by Altig, Christiano, Eichenbaum & Linde (2005)';
                        '         (m = monetary policy shock, t = technology shock, sw = SW assumptions,';
                        '         (i.e. no cost channel & no timing constraints';
                        '          '
                        '    2.9. US_RS99: Rudebusch, Svensson (1999)';
                        '    2.10. US_OR03: Orphanides (2003)';
                        '    2.11. US_PM08: IMF projection model US, Carabenciov et al. (2008)';
                        '    2.12. US_PM08fl: IMF projection model US (financial linkages), Carabenciov et al. (2008)';
                        '    2.13. US_DG08: De Graeve (2008)';
                        '    2.14. US_CD08: Christensen, Dib (2008)';
                        '    2.15. US_IAC05: Iacoviello (2005)';
                        '    2.16. US_MR07: Mankiw, Reis (2007)';
                        '    2.17. US_RA07: Rabanal (2007)';
                        '    2.18. US_CCTW10: Smets, Wouters (2007) model with rule-of-thumb consumers, estimated by Cogan et al. (2010)';
                        '    2.19. US_IR11: Ireland (2011)';
                        '    2.20. US_MI07: Milani (2007), RE version';
                        '    2.21. US_YR13: Rychalovska (2013), RE version';
                        '';
                        '3. Estimated Euro Area Models';
                        '    3.1. EA_CW05ta: Coenen, Wieland (2005) (ta: Taylor-staggered contracts)';
                        '    3.2. EA_CW05fm: Coenen, Wieland (2005) (fm: Fuhrer-Moore contracts)';
                        '    3.3. EA_AWM05:  Area Wide model linearized by Kuester, Wieland (2005)';
                        '    3.4. EA_SW03: Smets and Wouters (2003)';
                        '    3.5. EA_SR07: Euro Area Model of Sveriges Riksbank, Adolfson et al. (2007)';
                        '    3.6. EA_QUEST3: QUEST III Euro Area Model of the DG-ECFIN EU, Ratto et al. (2009)';
                        '    3.7. EA_CKL09: Christoffel, Kuester, Linzert (2009)';
                        '    3.8. EA_GE10: Gelain (2010)';
                        '';
                        '4.  Estimated/ calibrated Multi-Country Models';
                        '    4.1. G7_TAY93: Taylor (1993) G7 countries';
                        '    4.2. G3_CW03: Coenen, Wieland (2002, 2003) G3 countries';
                        '    4.3. EACZ_GEM03: IMF model of Euro Area and CZrep, Laxton, Pesenti (2003)';
                        '    4.4. G2_SIGMA08: FRB-SIGMA by Erceg, Guerrieri, Gust (2008)';
                        '    4.5. EAUS_NAWM08: Coenen, McAdam, Straub (2008) New Area Wide model of Euro Area and USA';
                        '    4.6. EAES_RA09: Rabanal (2009)';
                        '';
                        '5.  Estimated Models of other Countries';
                        '    5.1. CL_MS07: Medina, Soto (2007) model of the Chilean economy';
                        '    5.3. BRA_SAMBA08: Gouvea et al. (2008), model of the Brazilian economy';
                        '    5.4. CA_LS07: Lubik and Schorfheide (20087), small-scale open-economy model of the Canadian economy';
                        '    5.5. HK_FPP11: Funke, Paetz and Pytlarczyk (2011), open-economy model of the Hong Kong economy';
                        '';
                        '6.  Estimated Models with Adaptive Learning';
                        '    6.1. US_MI07AL: Milani (2007), Adaptive Learning version';
                        '    6.2. US_SW07AL: Slobodyan and Wouters (2012), Adaptive Learning version of US_SW07';
                        '    6.3. US_YR13AL: Rychalovska (2013) under Adaptive Learning';
						'    6.4. NK_RW97AL: Rotemberg, Woodford (1997) under Adaptive Learning';
                        '    6.5. NK_RW06AL: Ravena and Walch (Learning, 2006) under Adaptive Learning';
                        '    6.6. NK_IR04AL: Ireland (2004) under Adaptive Learning';
                        '    6.7. NK_LWW03AL: Levin, Wieland, Williams (2003) under Adaptive Learning';
                        '    6.8. US_FM95AL: Fuhrer, Moore (1995) under Adaptive Learning - not finished';
                        '    6.9. NK_BGG99AL: Bernanke, Gertler, Gilchrist (1999) under Adaptive Learning - not finished';
                        '    6.10. NK_CGG02AL: Clarida, Gali, Gertler (2002) 2-Country under Adaptive Learning';
                        '    6.11. NK_CGG99AL: Clarida, Gali, Gertler (1999) Hybrid under Adaptive Learning';
                        };
     
modelbase.type_bound=[];
for i=1:size(modelbase.names_full,1)
    temp=char(modelbase.names_full(i,1));
    disp(temp);
    if size(temp)>=1
        if temp(1,1)~= ' '
            modelbase.type_bound=[modelbase.type_bound,i];
        end
    end
end  
modelbase.type_bound=[modelbase.type_bound,size(modelbase.names_full,1)+2];
for i=1:(size(modelbase.type_bound,2)-1);
    modelbase.type_count(1,i)=modelbase.type_bound(1,i+1)-modelbase.type_bound(1,i)-2;
end
disp('Models not accessible from menu:');
disp('    2.8. US_NFED08: New Fed US Model based on Edge, Kiley, Laforte (2007), version used for estimation in Wieland, Wolters (2010)');
disp('    5.2. CA_ToTEM10: ToTEM model of Canada, based on Murchison, Rennison (2006), 2010 vintage');
                   

modelbase.names =char(['NK_RW97     '
                       'NK_LWW03    '
                       'NK_CGG99    '
                       'NK_CGG02    '
                       'NK_MCN99cr  '
                       'NK_IR04     '
                       'NK_BGG99    '
                       'NK_GM05     '
                       'NK_GK09     '
                       'NK_CK08     '
                       'NK_CKL09    '
                       'NK_RW06     '
                       'US_FM95     '
                       'US_OW98     '
                       'US_FRB03    '
                       'US_FRB08    '
                       'US_FRB08mx  '
                       'US_SW07     '
                       'US_ACELm    ' % IRFs to monetary policy shock with cost channel
                       'US_ACELt    ' % IRFs to technology shocks with cost channel                       
                       'US_ACELswm  ' % IRFs to monetary policy shock without cost channel, no timing constraint
                       'US_ACELswt  ' % IRFs to technology shocks without cost channel, no timing constraint
                      % 'US_NFED08   '
                       'US_RS99     '
                       'US_OR03     '
                       'US_PM08     '
                       'US_PM08fl   '
                       'US_DG08     '
                       'US_CD08     '
                       'US_IAC05    '
                       'US_MR07     '
                       'US_RA07     '
                       'US_CCTW10   '
                       'US_IR11     '
                       'US_MI07     '
                       'US_YR13     '
                       'EA_CW05ta   '
                       'EA_CW05fm   '
                       'EA_AWM05    '
                       'EA_SW03     '
                       'EA_SR07     '
                       'EA_QUEST3   '
                       'EA_CKL09    '
                       'EA_GE10     '
                       'G7_TAY93    '
                       'G3_CW03     '
                       'EACZ_GEM03  '
                       'G2_SIGMA08  '
                       'EAUS_NAWM08 '
                       'EAES_RA09   ' 
                       'CL_MS07     '
                      % 'CA_ToTEM10  ' 
                       'BRA_SAMBA08 '
                       'CA_LS07     '
                       'HK_FPP11    '
                       'US_MI07AL   '
                       'US_SW07AL   '
                       'US_YR13AL   '
                       'NK_RW97AL   '
                       'NK_RW06AL   '
                       'NK_IR04AL   '
                       'NK_LWW03AL  '
                       'US_FM95AL   '
                       'NK_BGG99AL  '
                       'NK_CGG02AL  '
                       'NK_CGG99AL  ']);
                   
%% NEW MENU FOR AL MODELS (section created 11/12/2013)
count_nonAL=sum(modelbase.type_count(1:end-1));
match_RE_AL=zeros(count_nonAL,2);
for ii=1:count_nonAL
    for jj=(count_nonAL+1):sum(modelbase.type_count(1:end))
        if modelbase.names(ii,1:7)==modelbase.names(jj,1:7)
           match_RE_AL(ii,1)=1;
           match_RE_AL(ii,2)=jj;
        end
    end
end
modelbase.type_count(end)=modelbase.type_count(end)-sum(match_RE_AL(:,1));
%we do not want to list anymore the matched models in the special AL
%cathegory
%%
                   
% Create 'modelsbase.namesplot':
% (required for a proper print out of the model names in
% the graphical output)               
for mo = 1:1:length(modelbase.names);
    namesplotaux = regexprep(modelbase.names(mo,:), '_', 'HERE_');
    modelbase.namesplot(mo,:) = regexprep(namesplotaux, 'HERE', '\');
end;

                        
% Dimension unit of original model shocks
% 1 -> shocks in percent
% 2 -> shocks in percent/100

modelbase.variabledim = [1   %NK_RW97      
                         1   %NK_LWW03     
                         1   %NK_CGG99         
                         1   %NK_CGG02
                         2   %NK_MCN99cr
                         1   %NK_IR04
                         1   %NK_BGG99
                         2   %NK_GM05
                         1   %NK_GK09   
                         1   %NK_CK08
                         1   %NK_CKL09
                         1   %NK_RW06
                         1   %US_FM95  (different from D3 version, see shock section in modfile)       
                         1   %US_OW98  (different from D3 version, see shock section in modfile)      
                         2   %US_FRB03 
                         2   %US_FRB08    
                         2   %US_FRB08mx 
                         1   %US_SW07       
                         1   %US_ACELm    
                         1   %US_ACELt                               
                         1   %US_ACELswm    
                         1   %US_ACELswt  
                        % 1   %US_NFED08
                         1   %US_RS99
                         1   %US_OR03
                         1   %US_PM08
                         1   %US_PM08fl
                         1   %US_DG08
                         2   %US_CD08
                         1   %US_IAC05
                         1   %US_MR07
                         1   %US_RA07
                         1   %US_CCTW10
                         1   %US_IR11
                         1   %US_MI07
                         1   %US_YR13
                         2   %EA_CW05ta       
                         2   %EA_CW05fm                                  
                         1   %EA_AWM05 (different from D3 version, see shock section in modfile)           
                         1   %EA_SW03          
                         1   %EA_SR07     
                         2   %EA_QUEST3
                         1   %EA_CKL09
                         1   %EA_GE10
                         2   %G7_TAY93        
                         2   %G3_CW03     
                         2   %EACZ_GEM03        
                         1   %G2_SIGMA08  
                         1   %EAUS_NAWM08
                         1   %EAES_RA09
                         1   %CL_MS07
                        % 1   %CA_ToTEM10
                         2   %BRA_SAMBA08
                         1   %CA_LS07
                         1   %HK_FPP11
                         1   %US_MI07AL
                         1   %US_SW0AL
                         1   %US_YR13AL 
                         1   %NK_RW97_AL
                         1   %NK_RW06AL
                         1   %NK_IR04AL
                         1   %NK_LWW03AL
                         1   %US_FM95AL
                         1   %NK_BGG99AL
                         1   %NK_CGG02
                         1];   %NK_CGG99
%%             
modelbase.horizon = 20; % Number of periods to be plotted             
             
modelbase.mycolor = char('r','g','b','c','m','y','k',':r',':g',':b',':c',':m',':y',':k',...
                       '--r','--g','--b','--c','--m','--y','--k',...
                       '-.r','-.g','-.b','-.c','-.m','-.y','-.k');             

% Set Parameters for the Monetary Policy Rule
% The Policy Rule is Described by the Following Equation:

% interest = const + cofintintb1*interest(-1) + cofintintb2*interest(-2) + cofintintb3*interest(-3) + cofintintb4*interest(-4)
%           + cofintinf0*inflationq + cofintinfb1*inflationq(-1) + cofintinfb2*inflationq(-2) + cofintinfb3*inflationq(-3) + cofintinfb4*inflationq(-4)
%           + cofintinff1*inflationq(+1) + cofintinff2*inflationq(+2) + cofintinff3*inflationq(+3) + cofintinff4*inflationq(+4)
%           + cofintout*outputgap + cofintoutb1*outputgap(-1) + cofintoutb2*outputgap(-2) + cofintoutb3*outputgap(-3) + cofintoutb4*outputgap(-4)
%           + cofintoutf1*outputgap(+1) + cofintoutf2*outputgap(+2) + cofintoutf3*outputgap(+3) + cofintoutf4*outputgap(+4)
%           + cofintpit*pitarget
%           + cofintrlb*rlbar
%           + {std_r_ * interest_            , if the model has an annual interest rate  
%           + {std_r_quart * interest_       , if the model has an quarterly interest rate 

% Description of Modelbase Variables:
% interest is the annualized quarterly nominal interest rate
% inflationq is the annualized quarterly inflation rate
% inflation is the year-on-year inflation rate
% outputgap 
% output  

modelbase.rulenames = char(['Taylor (1993)                       '
                            'Gerdesmeier and Roffia (2003)       '
                            'Levin, Wieland, Williams (2003)     '
                            'Smets and Wouters US (2007)         '
                            'Christiano, Eichenbaum, Evans (2005)'
                            'Milani (2007)                       ']);
                        
modelbase.rule = menu('Choose a Policy Rule', 'Taylor (1993)', 'Gerdesmeier and Roffia (2003)', 'Levin, Wieland, Williams (2003)', 'Smets and Wouters US (2007)', 'Christiano, Eichenbaum, Evans (2005)', 'Milani (2007)');    % ,'FRB/EDO (2007)');

if modelbase.rule == 1
    %
    % Taylor (1993) Rule
    %
    % Original formulation of the policy rule:
    % r = p + 0.5*y + 0.5*(p-2)+2
    % [Equation (1) in the paper]
    % Variables:
    % r is the federal funds rate
    % p is the rate of inflation over the previous four quarters
    % y is the percent deviation of real GDP from a target
    %
    % Description in terms of the Modelbase general rule specification:
    cofintintb1 =  0; cofintintb2 = 0; cofintintb3 = 0; cofintintb4 = 0;
    cofintinf0 = 1.5/4; cofintinfb1 = 1.5/4; cofintinfb2 = 1.5/4; cofintinfb3 = 1.5/4; cofintinfb4 = 0; cofintinff1 = 0; cofintinff2 = 0; cofintinff3 = 0; cofintinff4 = 0;
    cofintout = 0.5; cofintoutb1 = 0; cofintoutb2 = 0; cofintoutb3 = 0; cofintoutb4 = 0; cofintoutf1 = 0; cofintoutf2 = 0; cofintoutf3 = 0; cofintoutf4 = 0;
    std_r_ = 1;
    std_r_quart = 0.25;
    
elseif modelbase.rule == 2
    %
    % Policy Rule Gerdesmeier and Roffia (2003)
    %
    % Original formulation of the policy rule as in Kuester and Wieland
    % (2008), who adjusted GR's monthly estimates to quarterly frequency: 
    % r = 0.87^3*r(-1) + (1-0.87^3)*(1.93*pi + 0.28*y) 
    % [Equation (1) in the paper]
    % Variables:
    % r is the annualized quarterly nominal interest rate 
    % pi is the year-on-year inflation rate 
    % y is the output gap
    %
    % Description in terms of the Modelbase general rule specification:
    cofintintb1 =  0.87^3; cofintintb2 = 0; cofintintb3 = 0; cofintintb4 = 0;
    cofintinf0 = (1-0.87^3)*1.93/4; cofintinfb1 = (1-0.87^3)*1.93/4; cofintinfb2 = (1-0.87^3)*1.93/4; cofintinfb3 = (1-0.87^3)*1.93/4; cofintinfb4 = 0; cofintinff1 = 0; cofintinff2 = 0; cofintinff3 = 0; cofintinff4 = 0;
    cofintout = (1-0.87^3)*0.28; cofintoutb1 = 0; cofintoutb2 = 0; cofintoutb3 = 0; cofintoutb4 = 0; cofintoutf1 = 0; cofintoutf2 = 0; cofintoutf3 = 0; cofintoutf4 = 0;
    std_r_ = 1; %1.0124*1.0238; to replicate results from Kuester, Wieland 
    std_r_quart = 0.25; % use 0.0808*.25*4*3.1479 to replicate results from Kuester, Wieland 
    
elseif modelbase.rule ==3
    %
    % Policy Rule Levin, Wieland and Williams (2003)
    %
    % Original formulation of the policy rule:
    % i = -0.28 + 0.76*i(-1) + 0.60*pitilde + 0.21*y + 0.97*dy 
    %[Equation (4) in the paper] 
    % Variables:
    % i is the annualized short-term nominal interest rate
    % pitilde is the four-quarter average inflation rate (annualized)
    % y is the output gap
    % dy is the first difference of the output gap
    %
    % Description in terms of the Modelbase general rule specification:
    cofintintb1 =  0.755226; cofintintb2 = 0; cofintintb3 = 0; cofintintb4 = 0;
    cofintinf0 = 0.602691/4; cofintinfb1 = 0.602691/4; cofintinfb2 = 0.602691/4; cofintinfb3 = 0.602691/4; cofintinfb4 = 0; cofintinff1 = 0; cofintinff2 = 0; cofintinff3 = 0; cofintinff4 = 0;
    cofintout = 1.17616; cofintoutb1 = -0.972390; cofintoutb2 = 0; cofintoutb3 = 0; cofintoutb4 = 0; cofintoutf1 = 0; cofintoutf2 = 0; cofintoutf3 = 0; cofintoutf4 = 0;
    std_r_ = 1;
    std_r_quart = 0.25;
    
elseif modelbase.rule ==4
    %
    % Policy Rule Smets Wouters 2007 US
    %
    % Original formulation of the policy rule:
    % r =  crpi*(1-crr)*pinf + cry*(1-crr)*(y-yf) + crdy*(y - yf - y(-1) + yf(-1)) + crr*r(-1) + ms  
    % [Equation (14) in the paper]
    % Variables:
    % r is the quarterly interest rate, not annualized
    % pinf is quarterly inflation, not annualized
    % y is output
    % yf is potential output
    % ms is a monetary policy shock
    % Coefficients:
    % crpi=     2.0443; Taylor rule reaction to inflation
    % crr=      0.8103; Taylor rule interest rate smoothing
    % cry=      0.0882; Taylor rule long run reaction to output gap
    % crdy=     0.2247; Taylor rule short run reaction to output gap 
    %
    % Description in terms of the Modelbase general rule specification:
    cofintintb1 =  0.8103; cofintintb2 = 0; cofintintb3 = 0; cofintintb4 = 0;
    cofintinf0 = (1-0.8103)*2.0443; cofintinfb1 = 0; cofintinfb2 = 0; cofintinfb3 = 0; cofintinfb4 = 0; cofintinff1 = 0; cofintinff2 = 0; cofintinff3 = 0; cofintinff4 = 0;
    cofintout = ((1-0.8103)*0.0882+0.2247)*4; cofintoutb1 = -0.2247*4; cofintoutb2 = 0; cofintoutb3 = 0; cofintoutb4 = 0; cofintoutf1 = 0; cofintoutf2 = 0; cofintoutf3 = 0; cofintoutf4 = 0;
    std_r_ = 1;
    std_r_quart = 0.25;
    
elseif modelbase.rule ==5
    % 
    % Policy Rule Christiano, Eichenbaum and Evans (2005)
    %
    % Original formulation of the policy rule:
    % R = rho*R(-1) + (1-rho)*(alpha_pi*pi(+1) + alpha_y*y) + eps
    % [Equation on page 28 of the paper]
    % Variables:
    % R is the short-run nominal interest rate, annualized or not? 
    % pi is inflation, annualized or not? 
    % y is the output gap
    % Coefficients:
    % rho = 0.80; Taylor rule interest rate smoothing
    % alpha_pi = 1.5; Taylor rule reaction to expected inflation one period ahead
    % alpha_y = 0.1; Taylor rule reaction to output gap
    %
    % Description in terms of the Modelbase general rule specification:
    cofintintb1 =  0.8; cofintintb2 = 0; cofintintb3 = 0; cofintintb4 = 0;
    cofintinf0 = 0; cofintinfb1 = 0; cofintinfb2 = 0; cofintinfb3 = 0; cofintinfb4 = 0; cofintinff1 = (1-0.8)*1.5; cofintinff2 = 0; cofintinff3 = 0; cofintinff4 = 0;
    cofintout = (1-0.8)*0.1*4; cofintoutb1 = 0; cofintoutb2 = 0; cofintoutb3 = 0; cofintoutb4 = 0; cofintoutf1 = 0; cofintoutf2 = 0; cofintoutf3 = 0; cofintoutf4 = 0;
    std_r_ = 1;
    std_r_quart = 0.25;

 elseif modelbase.rule ==6
     % Policy Rule Milani (2007)
     % i=0.914*i(-1)+(1-0.914)*(1.484*pi+0.801*x)
    cofintintb1 =  0.914; cofintintb2 = 0; cofintintb3 = 0; cofintintb4 = 0;
    cofintinf0 = 0.127624; cofintinfb1 = 0; cofintinfb2 = 0; cofintinfb3 = 0; cofintinfb4 = 0; cofintinff1 = 0; cofintinff2 = 0; cofintinff3 = 0; cofintinff4 = 0;
    cofintout = 0.068886*4; cofintoutb1 = 0; cofintoutb2 = 0; cofintoutb3 = 0; cofintoutb4 = 0; cofintoutf1 = 0; cofintoutf2 = 0; cofintoutf3 = 0; cofintoutf4 = 0;
    std_r_ = 1;
    std_r_quart = 0.25;

end

save policy_param.mat cofintintb1 cofintintb2 cofintintb3 cofintintb4...
                      cofintinf0 cofintinfb1 cofintinfb2 cofintinfb3 cofintinfb4 cofintinff1 cofintinff2 cofintinff3 cofintinff4...
                      cofintout cofintoutb1 cofintoutb2 cofintoutb3 cofintoutb4 cofintoutf1 cofintoutf2 cofintoutf3 cofintoutf4...
                      std_r_ std_r_quart ;
disp(' ')
disp('Selected Policy Rule:');                 
disp(deblank(modelbase.rulenames(modelbase.rule,:)));

%**********************************************************************************************************************
%                                DON'T CHANGE ANYTHING AFTER THIS LINE                                                %                                                  
%**********************************************************************************************************************  
                  
modelbase.models=[];
model=1;
disp(' ')
disp('Selected Models:')
% modelmenu = num2str('menu(''Choose the models you would like to pick. Press the button "continue" when finished.'', ''All Models''');
%     for j=1:size(modelbase.names,1)
%         modelmenu = [modelmenu num2str(', ') num2str('''') modelbase.names(j,:) num2str('''')]; 
%     end
% modelmenu= [modelmenu ', ''Continue''' num2str(');')];
while model<(size(modelbase.names,1)+2) && size(modelbase.models,2)<size(modelbase.names,1);  % menu disappears if the button "continue" is pushed or once all available models have been chosen.
    
    model = str2num(newmenu(modelbase.names,modelbase.names_full,modelbase.type_bound,modelbase.type_count,match_RE_AL));
    if model == 1
        modelbase.models = [1:size(modelbase.names,1)];
        disp('All models');
    elseif model<(size(modelbase.names,1)+2) && isempty(find(modelbase.models==(model-1), 1)) % the first shows that the "continue" button has not been pushed, the second checks for double chosen models
        model = model-1;  % Neccessary as the "All models" button is set first. Therefore the button for model one produces "model=2". --> Substract 1
        modelbase.models=[modelbase.models, model];    % add another chosen model to the choice of models
        
        if modelbase.variabledim(model) == 1  % model variables in percent
        variabledimprint = ' (common variables and model shocks expressed in percent)';
        modelnameprint = deblank(modelbase.names(model,:));
        modelnamedimprint = [modelnameprint variabledimprint];
        disp(modelnamedimprint);
        else if modelbase.variabledim(model) == 2 % model variables (mostly) in percent/100
                variabledimprint = ' (common variables expressed in percent, model shocks expressed in percent/100)';
                modelnameprint = deblank(modelbase.names(model,:));
                modelnamedimprint = [modelnameprint variabledimprint];
                disp(modelnamedimprint);
            end
        end
                
    end;
end;
 

% Autocorrelation Functions
modelbase.option(1) = menu('Do you want to plot autocorrelation functions?', 'Yes','No');
disp(' ');
disp('Selected options:');
if modelbase.option(1) == 1
    disp('Autocorrelation functions will be plotted.');
else disp('Autocorrelation functions will not be plotted.');
end


% Impulse Response Functions
modelbase.option(2) = menu('Do you want to plot impulse response functions?', 'Yes','No');
%disp(' ');
if modelbase.option(2) == 1
    disp('Impulse response functions will be plotted.');
else disp('Impulse response functions will not be plotted.');
end

modelbase.namesshocks= char(['Mon. Pol. Shock      '
                             'Fiscal Pol. Shock    ']); 
                       
choices=[]; % initialize, otherwise we have an error when trying to save
modelbase.innos = [];
if modelbase.option(2)==1
    choice=1;
    if size(modelbase.models,2)==1  % only one model has been chosen --> make it possible to plot responses to all model specific shocks
        modelbase.option(3) = menu('Do you want to shock several innovations contemporaneously?', 'Yes','No'); % Several innovations can be shocked contemporaneously
        %disp(' ');
        if modelbase.option(3) == 1 
            disp('Selected innovations will be shocked contemporaneously.');
        else disp('Selected innovations will not be shocked contemporaneously.');
        end
        %disp(' ');
        %disp('Selected shocks:');
        inno='allshocks';
        modelbase.innos=inno;
        modelbase.namesshocks = modelbase.namesshocks(choices,:); % this is neccesary for plotting the right shock in the right figure otherwise the order might get confused; if all model specific shocks are chosen, we put [] here. The names are assigned in stoch_simul_modelbase
    
    else % more than one model has been chosen
        disp(' ');
        disp('Selected shocks:');
        while choice<3 && size(choices,2)<2
            choice = menu('Choose a Shock:', 'Monetary Policy Shock', 'Fiscal Policy Shock', 'Continue'); 
            switch choice
            case 1
                inno='interest_';
                disp('Monetary policy shock');
            case 2
                inno='fiscal_  ';
                disp('Fiscal policy shock');
            case 3
                inno='no       ';        
            end
            if choice<3 && isempty(find(choices==choice, 1)) % the first shows that the no more button has not been pushed, the second checks for double chosen shocks
                modelbase.innos=[modelbase.innos; inno];     % contains the chosen shocks as strings
                choices=[choices,choice];                    % contains the chosen shocks as a number
            end;
        end;
        modelbase.namesshocks = modelbase.namesshocks(choices,:); % this is neccesary for plotting the right shock in the right figure otherwise the order might get confused
    end
end;
%%
%**********************************************************************************************************************
%                    Solving the Model, Computing Statistics                                                          %
%**********************************************************************************************************************
save Modelbase modelbase                             % neccessary to save in between as dynare clears the workspace
for epsilon=1:size(modelbase.models,2)
    %tic
    gain=0;
    modelbase.modeltime(modelbase.models(epsilon)) = cputime;
    modelbase.setpath(modelbase.models(epsilon),:) = [modelbase.homepath num2str('\') num2str(modelbase.names(modelbase.models(epsilon),:))]; % path for dynare file of specific model
    modelbase.epsilon = epsilon;
    % Currently, there are just two AL models
    if ismember(modelbase.models(epsilon),sum(modelbase.type_count(1,1:5))+1:sum(modelbase.type_bound(1,1:6)))
        AL = 1;
        control=0;
        while control==0
        gain=str2num(selectgain(modelbase.names,modelbase.models,epsilon));
        if gain>=0 && gain<=0.05
            control=1;
        end
        end
    else
        AL = 0;
    end

    save -append Modelbase modelbase AL gain
    cd(modelbase.setpath(modelbase.models(epsilon),:));                                 % go to directory of specific model
    disp(' ');
    disp(['Currently Solving: ', num2str(deblank(modelbase.names((modelbase.models(epsilon)),:)))]);
    eval(['dynare '  modelbase.names(modelbase.models(epsilon),:)]);               % solve model "epsilon" in dynare by running the .mod file --> translates Dynare syntax into .m file, that is run
    cd('..'); 
    load Modelbase
    options_.ar=100;
    if AL
        modelbase.AL=AL;
        AL_.forwards = forwards;
        if ismember(modelbase.rule,[4 5 6])
            AL_.states = states_short;
        else
            AL_.states = states_long;            
        end
        %menu for selection of states for learning
        control_sel_states=0;
        while control_sel_states==0
        rb_temp=menu_AL_select_states;
        if sum(rb_temp)==1
            control_sel_states=1;
        end
        end
        if rb_temp(2)==1
            while control_sel_states==1
            rb2_temp=menu_AL_select_subset(AL_.states);
            if size(rb2_temp,2)~=0
                control_sel_states=2;
                AL_.states=rb2_temp;
            end
            end
        end

        modelbase.AL_=AL_;
    end
    modelbase=stoch_simul_MMB_AL_gain(modelbase,AL,gain);
    
%     modelbase=stoch_simul_MMB(modelbase);                                     % solve model
    cd(modelbase.homepath);                                                   % go back to main directory     
    %toc
    modelbase.modeltime(modelbase.models(modelbase.epsilon))=cputime-modelbase.modeltime(modelbase.models(modelbase.epsilon));
    disp(['Elapsed cputime is ' ,num2str(modelbase.modeltime(modelbase.models(modelbase.epsilon))), ' seconds.']);
end;

%**********************************************************************************************************************
%                    Display Variances on screen                                                                    %
%**********************************************************************************************************************

modelbase.option(5) = menu('Do you want to print out the unconditional variances of the variables?', 'Yes','No');

if modelbase.option(5) == 1

disp(' ')
disp('Variance of the model variables you have chosen:')
disp(' ')
for j=1:size(modelbase.models,2)
    if modelbase.info(modelbase.models(j))==0
        disp(' ') 
        disp(num2str(modelbase.names(modelbase.models(:,j),:)));
        disp(' ')  
        disp('Variables           Variance       ')
        %Plotting the variance of interest rate
        vname='Interest ';
        var = modelbase.VAR.(num2str(deblank(modelbase.names(modelbase.models(j),:))))(loc(modelbase.VARendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'interest'),loc(modelbase.VARendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'interest'));
        st = sprintf('%9s %19f',...
        vname,var);
        disp(st)
       %Plotting the variance of inflation
        vname='Inflation';
        var = modelbase.VAR.(num2str(deblank(modelbase.names(modelbase.models(j),:))))(loc(modelbase.VARendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'inflation'),loc(modelbase.VARendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'inflation'));
        st = sprintf('%9s %19f',...
        vname,var);
        disp(st)
        %Plotting the variance of outputgap   
        vname='outputgap';
        var = modelbase.VAR.(num2str(deblank(modelbase.names(modelbase.models(j),:))))(loc(modelbase.VARendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'outputgap'),loc(modelbase.VARendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'outputgap'));
        st = sprintf('%9s %19f',...
        vname,var);
        disp(st)
        if loc(modelbase.VARendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'output')~=0
            %Plotting the variance of output   
            vname='output   ';
            var = modelbase.VAR.(num2str(deblank(modelbase.names(modelbase.models(j),:))))(loc(modelbase.VARendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'output'),loc(modelbase.VARendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'output'));
            st = sprintf('%9s %19f',...
            vname,var);
            disp(st)  
        end;
    end;
end;
end;

%**********************************************************************************************************************
%                    Set up figures, plot results                                                                     %
%**********************************************************************************************************************
time = (0:modelbase.horizon)';

if modelbase.option(2)==1
    if modelbase.option(3)==1
        j = 1;
    % plot impulse responses if several innovations are shocked contemporaneously
        warning off
        orient landscape
        modelplottedIRF=[];
        modelplottedIRF=[modelplottedIRF modelbase.models(j)]; % this is neccessary to plot a proper legend, that ignores the models,
        modelbase.legend=num2str(deblank(modelbase.namesshocks(1,:)));
        for teta=2:size(modelbase.namesshocks,1)
            modelbase.legend=[num2str(modelbase.legend) ', ' num2str(deblank(modelbase.namesshocks(teta,:)))];
        end;
        % which lack the specific shock
        if modelbase.option(4)==1
            subplot(2,2,1)
            plot(time,modelbase.IRF.(num2str(deblank(modelbase.names(modelbase.models(j),:))))(loc(modelbase.IRFendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'outputgap'),:,1),modelbase.mycolor(j,:),'LineWidth',2,'MarkerSize',5); hold on
            grid on
            title(['IRF of Output Gap to ',num2str(deblank(modelbase.legend))],'FontSize',12)
            legend(num2str(modelbase.namesplot(modelplottedIRF,:))); 

            subplot(2,2,2)
            plot(time,modelbase.IRF.(num2str(deblank(modelbase.names(modelbase.models(j),:))))(loc(modelbase.IRFendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'inflation'),:,1),modelbase.mycolor(j,:),'LineWidth',2,'MarkerSize',5); hold on
            grid on
            title(['IRF of Inflation to ',num2str(deblank(modelbase.legend))],'FontSize',12)

            subplot(2,2,3)
            plot(time,modelbase.IRF.(num2str(deblank(modelbase.names(modelbase.models(j),:))))(loc(modelbase.IRFendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'interest'),:,1),modelbase.mycolor(j,:),'LineWidth',2,'MarkerSize',5); hold on
            grid on
            title(['IRF of Interest Rate to ',num2str(deblank(modelbase.legend))],'FontSize',12)


            if loc(modelbase.IRFendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'output')~=0
                subplot(2,2,4)
                plot(time,modelbase.IRF.(num2str(deblank(modelbase.names(modelbase.models(j),:))))(loc(modelbase.IRFendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'output'),:,1),modelbase.mycolor(j,:),'LineWidth',2,'MarkerSize',5); hold on
                grid on
                title(['IRF of Output to ',num2str(deblank(modelbase.legend))],'FontSize',12)
            end
        else
            number=size(modelbase.IRFendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),1);
            rest=number-floor(number/9)*9;
            if floor(number/9)>0
                for q=1:floor(number/9)
                    if q>1
                        figure;
                    end;
                    for r=1:9
                    subplot(3,3,r)
                    plot(time,modelbase.IRF.(num2str(deblank(modelbase.names(modelbase.models(j),:))))((q-1)*9+r,:,1),modelbase.mycolor(j,:),'LineWidth',2,'MarkerSize',5); hold on
                    grid on
                    title(['IRF of ',num2str(deblank(modelbase.IRFendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:))))((q-1)*9+r,:))), ' to ',num2str(deblank(modelbase.legend))],'FontSize',12)
                    end;
                end;
            end;
            if rest~=0
                if floor(number/9)>0
                    figure;
                end;
                for h=1:rest
                subplot(3,3,h)
                plot(time,modelbase.IRF.(num2str(deblank(modelbase.names(modelbase.models(j),:))))(q*9+h,:,1),modelbase.mycolor(j,:),'LineWidth',2,'MarkerSize',5); hold on
                grid on
                title(['IRF of ',num2str(deblank(modelbase.IRFendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:))))(q*9+h,:))), ' to ',num2str(deblank(modelbase.legend))],'FontSize',12)
                end;
            end;
        end;
    else
        for p=1:size(modelbase.innos,1)
            % plot impulse responses
            warning off
            orient landscape
            if p>1
                figure;
            end;
            modelplottedIRF=[];
            for j=1:size(modelbase.models,2)
                if modelbase.pos_shock(p,modelbase.models(j))~=0
                    modelplottedIRF=[modelplottedIRF modelbase.models(j)]; % this is neccessary to plot a proper legend, that ignores the models,
                    % which lack the specific shock
                    if modelbase.option(4)==1
                        subplot(2,2,1)
                        plot(time,modelbase.IRF.(num2str(deblank(modelbase.names(modelbase.models(j),:))))(loc(modelbase.IRFendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'outputgap'),:,p),modelbase.mycolor(j,:),'LineWidth',2,'MarkerSize',5); hold on
                        grid on
                        title(['IRF of Output Gap to ',num2str(deblank(modelbase.namesshocks(p,:)))],'FontSize',18)
                        legend(num2str(modelbase.namesplot(modelplottedIRF,:))); 

                        subplot(2,2,2)
                        plot(time,modelbase.IRF.(num2str(deblank(modelbase.names(modelbase.models(j),:))))(loc(modelbase.IRFendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'inflation'),:,p),modelbase.mycolor(j,:),'LineWidth',2,'MarkerSize',5); hold on
                        grid on
                        title(['IRF of Inflation to ',num2str(deblank(modelbase.namesshocks(p,:)))],'FontSize',18)

                        subplot(2,2,3)
                        plot(time,modelbase.IRF.(num2str(deblank(modelbase.names(modelbase.models(j),:))))(loc(modelbase.IRFendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'interest'),:,p),modelbase.mycolor(j,:),'LineWidth',2,'MarkerSize',5); hold on
                        grid on
                        title(['IRF of Interest Rate to ',num2str(deblank(modelbase.namesshocks(p,:)))],'FontSize',18)


                        if loc(modelbase.IRFendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'output')~=0
                            subplot(2,2,4)
                            plot(time,modelbase.IRF.(num2str(deblank(modelbase.names(modelbase.models(j),:))))(loc(modelbase.IRFendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'output'),:,p),modelbase.mycolor(j,:),'LineWidth',2,'MarkerSize',5); hold on
                            grid on
                            title(['IRF of Output to ',num2str(deblank(modelbase.namesshocks(p,:)))],'FontSize',18)
                        end
                    else
                        number=size(modelbase.IRFendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),1);
                        rest=number-floor(number/9)*9;
                        if floor(number/9)>0
                            for q=1:floor(number/9)
                                if q>1
                                    figure;
                                end;
                                for r=1:9
                                subplot(3,3,r)
                                plot(time,modelbase.IRF.(num2str(deblank(modelbase.names(modelbase.models(j),:))))((q-1)*9+r,:,p),modelbase.mycolor(j,:),'LineWidth',2,'MarkerSize',5); hold on
                                grid on
                                title(['IRF of ',num2str(deblank(modelbase.IRFendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:))))((q-1)*9+r,:))), ' to ',num2str(deblank(modelbase.namesshocks(p,:)))],'FontSize',14)
                                end;
                            end;
                        
                            if rest~=0
                                if floor(number/9)>0
                                    figure;
                                end;
                                for h=1:rest
                                subplot(3,3,h)
                                plot(time,modelbase.IRF.(num2str(deblank(modelbase.names(modelbase.models(j),:))))(q*9+h,:,p),modelbase.mycolor(j,:),'LineWidth',2,'MarkerSize',5); hold on
                                grid on
                                title(['IRF of ',num2str(deblank(modelbase.IRFendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:))))(q*9+h,:))), ' to ',num2str(deblank(modelbase.namesshocks(p,:)))],'FontSize',14)
                                end;
                            end; 
                        elseif rest~=0
                                for h=1:rest
                                subplot(3,3,h)
                                plot(time,modelbase.IRF.(num2str(deblank(modelbase.names(modelbase.models(j),:))))(h,:,p),modelbase.mycolor(j,:),'LineWidth',2,'MarkerSize',5); hold on
                                grid on
                                title(['IRF of ',num2str(deblank(modelbase.IRFendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:))))(h,:))), ' to ',num2str(deblank(modelbase.namesshocks(p,:)))],'FontSize',14)
                                end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end




if modelbase.option(1)==1
    % plot autocorrelation function
    time = (0:modelbase.horizon)';
    warning off
    orient landscape
    if modelbase.option(2)==1
        figure;
    end;
    modelplottedAC=[];
    for j=1:size(modelbase.models,2)
        if modelbase.info(modelbase.models(j))==0
            modelplottedAC=[modelplottedAC modelbase.models(j)]; % this is neccessary to plot a proper legend, that ignores the models, which lack the specific shock
            subplot(2,2,1)
            plot(time,modelbase.AUTR.(num2str(deblank(modelbase.names(modelbase.models(j),:))))(loc(modelbase.AUTendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'outputgap'),:),modelbase.mycolor(j,:),'LineWidth',2,'MarkerSize',5); hold on
            grid on
            title('Autocorrelation Function of the Output gap','FontSize',18)
            legend(num2str(modelbase.namesplot(modelplottedAC,:))); 

            subplot(2,2,2)
            plot(time,modelbase.AUTR.(num2str(deblank(modelbase.names(modelbase.models(j),:))))(loc(modelbase.AUTendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'inflation'),:),modelbase.mycolor(j,:),'LineWidth',2,'MarkerSize',5); hold on
            grid on
            title('Autocorrelation Function of Inflation','FontSize',18)

            subplot(2,2,3)
            plot(time,modelbase.AUTR.(num2str(deblank(modelbase.names(modelbase.models(j),:))))(loc(modelbase.AUTendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'interest'),:),modelbase.mycolor(j,:),'LineWidth',2,'MarkerSize',5); hold on
            grid on
            title('Autocorrelation Function of the Interest Rate','FontSize',18)

            if loc(modelbase.AUTendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'output')~=0
                subplot(2,2,4)
                plot(time,modelbase.AUTR.(num2str(deblank(modelbase.names(modelbase.models(j),:))))(loc(modelbase.AUTendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'output'),:),modelbase.mycolor(j,:),'LineWidth',2,'MarkerSize',5); hold on
                grid on
                title('Autocorrelation Function of Output','FontSize',18)
            end
        end
    end
end

modelbase.totaltime = cputime-modelbase.totaltime;
disp(' '); disp(' ');
disp(['Total elapsed cputime: ' ,num2str(modelbase.totaltime), ' seconds.']);

% save the results
keyvariables = ['outputgap';
                'inflation';
                'interest '; 
                'output   '];
for p=1:size(modelbase.innos,1)
     if modelbase.option(3)==1
         p=1;
     else
     end;
     rownr = 1;
     result.IRF.(num2str(deblank(modelbase.innos(p,:))))(rownr,:) = {num2str(deblank(modelbase.namesshocks(p,:)))}; rownr = rownr+1;
     for k = 1:size(keyvariables,1);
        result.IRF.(num2str(deblank(modelbase.innos(p,:))))(rownr,1) = {keyvariables(k,:)}; rownr = rownr+1;
        for j=1:size(modelbase.models,2)
            result.IRF.(num2str(deblank(modelbase.innos(p,:))))(rownr,1) = {num2str(deblank(modelbase.names(modelbase.models(j),:)))};
            if modelbase.info(modelbase.models(j)) == 0
                if isfield(modelbase,'IRFendo_names') == 1
                if isfield(modelbase.IRFendo_names,(num2str(deblank(modelbase.names(modelbase.models(j),:)))));
                    if loc(modelbase.IRFendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),keyvariables(k,:))~=0 && modelbase.pos_shock(p,modelbase.models(j))~=0
                        for i=1:modelbase.horizon
                            result.IRF.(num2str(deblank(modelbase.innos(p,:))))(rownr,i+1) = {modelbase.IRF.(num2str(deblank(modelbase.names(modelbase.models(j),:))))(loc(modelbase.IRFendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),keyvariables(k,:)),i,p)};
                        end
                    end
                else
                    result.IRF.(num2str(deblank(modelbase.innos(p,:))))(rownr,2:modelbase.horizon+2) = {[]};
                end
                else
                    result.IRF.(num2str(deblank(modelbase.innos(p,:))))(rownr,2:modelbase.horizon+2) = {[]};
                end
            else
                result.IRF.(num2str(deblank(modelbase.innos(p,:))))(rownr,2:modelbase.horizon+2) = {[]};
            end
            rownr = rownr+1;
        end
     end
     xlswrite(modelbase.savepath, result.IRF.(num2str(deblank(modelbase.innos(p,:)))), ['IRF ' modelbase.namesshocks(p,:)]);
end
if modelbase.option(1) ==1
    rownr  = 1;
    for k = 1:size(keyvariables,1);
        result.AC(rownr,1) = {keyvariables(k,:)}; rownr = rownr+1;
        for j=1:size(modelbase.models,2)    
            result.AC(rownr,1) = {num2str(deblank(modelbase.names(modelbase.models(j),:)))};
            if modelbase.info(modelbase.models(j)) == 0
                if loc(modelbase.AUTendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),keyvariables(k,:))~=0 
                    for i=1:modelbase.horizon
                        result.AC(rownr,i+1) = {modelbase.AUTR.(num2str(deblank(modelbase.names(modelbase.models(j),:))))(loc(modelbase.AUTendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),keyvariables(k,:)),i)};
                    end
                else
                    result.AC(rownr,2:modelbase.horizon+2) = {[]};
                end
            else
                result.AC(rownr,2:modelbase.horizon+2) = {[]};
            end
            rownr = rownr+1;
        end
    end
    xlswrite(modelbase.savepath, result.AC, 'ACF');
end

%Saving the IRFs of all variables in Excel, if one Model is chosen
if size(modelbase.models,2)==1
    if modelbase.info(modelbase.models(modelbase.epsilon))==0 
       if isfield(modelbase,'IRFendo_names') == 1 
       for p=1:size(modelbase.innos,1)
           if modelbase.option(3)==1
             for i=1:size(modelbase.IRFendo_names.(num2str(deblank(modelbase.names(modelbase.models(1),:)))),1)
                result.allIRFs(i,1)={modelbase.IRFendo_names.(num2str(deblank(modelbase.names(modelbase.models(1),:))))(i,:)};
              end;
              for j=1:size(modelbase.IRF.(num2str(deblank(modelbase.names(modelbase.models(1),:))))(:,:,1),1)
                 for k=1:size(modelbase.IRF.(num2str(deblank(modelbase.names(modelbase.models(1),:))))(:,:,1),2)
                   result.allIRFs(j,k+1)={modelbase.IRF.(num2str(deblank(modelbase.names(modelbase.models(1),:))))(j,k,1)};
                 end;
              end;
              xlswrite(modelbase.savepath, result.allIRFs, 'all IRFs '); 
           else
              for i=1:size(modelbase.IRFendo_names.(num2str(deblank(modelbase.names(modelbase.models(1),:)))),1)
                result.allIRFs(i,1)={modelbase.IRFendo_names.(num2str(deblank(modelbase.names(modelbase.models(1),:))))(i,:)};
              end;
              if modelbase.pos_shock(p,modelbase.models(1))~=0
              for j=1:size(modelbase.IRF.(num2str(deblank(modelbase.names(modelbase.models(1),:))))(:,:,p),1)
                 for k=1:size(modelbase.IRF.(num2str(deblank(modelbase.names(modelbase.models(1),:))))(:,:,p),2)
                   result.allIRFs(j,k+1)={modelbase.IRF.(num2str(deblank(modelbase.names(modelbase.models(1),:))))(j,k,p)};
                 end;
              end;
             xlswrite(modelbase.savepath, result.allIRFs, ['all IRFs ' num2str(deblank(modelbase.namesshocks(p,:)))]);
             end;
           end;
       end;
       end;
    end;
else
end;
rmpath(modelbase.homepath);

% command to display a specific impulse response:
% here ACEL as an example which can be replaced by any element (all models which have been solved) of modelbase.names 
%modelbase.IRF.ACEL1tech(loc(modelbase.IRFendo_names.ACEL1tech,'ytildef_t'),:)'