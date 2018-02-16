modelbase.totaltime = cputime;
modelbase.homepath = cd;
addpath(modelbase.homepath);
modelbase.uphomepath =cd(cd('..'));
addpath(modelbase.uphomepath);
statusbar(0, 'Busy...');
%*******************************************************************************************************
%                    This File For The First Exercise (MMBOPT1)                                        %
%*******************************************************************************************************

%%
%*****************************************************************************
% The following part of code receives information collected from OPT1MENU    %
%                See MMB.m file for varaibles description                    %
%*****************************************************************************

global names;
global variabledim;
global modelsvec;
global mycolor;
global rulenames;
global rulenamesshort;
global common_rule;
global rule;
global data;
global horizon;
global results;
global option1;
global option2;
global shocks;
global option5;
global option6;
global AL_Models;
global OSenvironment;

modelbase.exercise=1;
modelbase.names =names;
modelbase.variabledim = variabledim;
modelbase.mycolor = mycolor;
modelbase.rulenames = rulenames;
modelbase.rulenamesshort = rulenamesshort;
modelbase.common_rule=common_rule;
modelbase.data = data;
modelbase.modelsvec = modelsvec;
modelbase.option(1) = option1;
modelbase.option(2) = option2;
modelbase.option(5) = option5;
modelbase.option(6) = option6;
modelbase.AL_Models = AL_Models;
modelbase.OSenvironment = OSenvironment;

if modelbase.OSenvironment == 0;
	modelbase.savepath = [modelbase.uphomepath num2str('\OUTPUT\') num2str('results.xls')];
else
	modelbase.savepath = [modelbase.uphomepath num2str('/OUTPUT/') num2str('results.xls')];
end
modelbase.rule = find(rule==1);
modelbase.horizon = horizon;
maxhorizon = 100;
modelbase.maxhorizon = maxhorizon;
modelbase.models = find(modelsvec~=0)';
solution_found = zeros(size(find(modelsvec~=0)')); % solution_found(number)= 1 if a solution is found and 0 else

xls_check_if_open(modelbase.savepath, 'close');
if strcmp(results, 'results.xls')
    delete(modelbase.savepath); % overwrite the output file 'results.xls' if no output file is specified by the user
else
	if modelbase.OSenvironment == 0;
    	modelbase.savepath = [modelbase.uphomepath num2str('\OUTPUT\') results]; % create a new output file
	else
	    modelbase.savepath = [modelbase.uphomepath num2str('/OUTPUT/') results]; % create a new output file
	end
end



% Create 'modelsbase.namesplot':
% (required for a proper print out of the model names in
% the graphical output)
for mo = 1:1:length(modelbase.names);
    namesplotaux = regexprep(modelbase.names(mo,:), '_', 'HERE_');
	if modelbase.OSenvironment == 0;
	    modelbase.namesplot(mo,:) = regexprep(namesplotaux, 'HERE', '\');
	else
		modelbase.namesplot(mo,:) = regexprep(namesplotaux, 'HERE','/');	
	end
end;


% Set Parameters for the Monetary Policy Rule

if modelbase.rule >2
    cofintintb1 = modelbase.common_rule(modelbase.rule,1); cofintintb2 = modelbase.common_rule(modelbase.rule,2); cofintintb3 = modelbase.common_rule(modelbase.rule,3);
    cofintintb4 = modelbase.common_rule(modelbase.rule,4); cofintinf0 = modelbase.common_rule(modelbase.rule,5); cofintinfb1 = modelbase.common_rule(modelbase.rule,6); cofintinfb2 = modelbase.common_rule(modelbase.rule,7);
    cofintinfb3 = modelbase.common_rule(modelbase.rule,8); cofintinfb4 = modelbase.common_rule(modelbase.rule,9); cofintinff1 = modelbase.common_rule(modelbase.rule,10); cofintinff2 = modelbase.common_rule(modelbase.rule,11);
    cofintinff3 = modelbase.common_rule(modelbase.rule,12); cofintinff4 = modelbase.common_rule(modelbase.rule,13); cofintout = modelbase.common_rule(modelbase.rule,14); cofintoutb1 = modelbase.common_rule(modelbase.rule,15);
    cofintoutb2 = modelbase.common_rule(modelbase.rule,16); cofintoutb3 = modelbase.common_rule(modelbase.rule,17); cofintoutb4 = modelbase.common_rule(modelbase.rule,18); cofintoutf1 = modelbase.common_rule(modelbase.rule,19);
    cofintoutf2 = modelbase.common_rule(modelbase.rule,20); cofintoutf3 = modelbase.common_rule(modelbase.rule,21); cofintoutf4 = modelbase.common_rule(modelbase.rule,22);
    cofintoutp = modelbase.common_rule(modelbase.rule,23); cofintoutpb1 = modelbase.common_rule(modelbase.rule,24); cofintoutpb2 = modelbase.common_rule(modelbase.rule,25); cofintoutpb3 = modelbase.common_rule(modelbase.rule,26);
    cofintoutpb4 = modelbase.common_rule(modelbase.rule,27); cofintoutpf1 = modelbase.common_rule(modelbase.rule,28); cofintoutpf2 = modelbase.common_rule(modelbase.rule,29); cofintoutpf3 = modelbase.common_rule(modelbase.rule,30);
    cofintoutpf4 = modelbase.common_rule(modelbase.rule,31);
    std_r_ = modelbase.common_rule(modelbase.rule,32);
    std_r_quart = modelbase.common_rule(modelbase.rule,33);
    
elseif modelbase.rule == 1
    % User specified policy rule
    cofintintb1 =  modelbase.data(2,1); cofintintb2 = modelbase.data(3,1); cofintintb3 = modelbase.data(4,1); cofintintb4 = modelbase.data(5,1);
    cofintinf0 = modelbase.data(1,2); cofintinfb1 = modelbase.data(2,2); cofintinfb2 = modelbase.data(3,2); cofintinfb3 = modelbase.data(4,2); cofintinfb4 = modelbase.data(5,2);
    cofintinff1 = modelbase.data(6,2); cofintinff2 = modelbase.data(7,2); cofintinff3 = modelbase.data(8,2); cofintinff4 = modelbase.data(9,2);
    cofintout = modelbase.data(1,3); cofintoutb1 = modelbase.data(2,3); cofintoutb2 = modelbase.data(3,3); cofintoutb3 = modelbase.data(4,3); cofintoutb4 = modelbase.data(5,3);
    cofintoutf1 = modelbase.data(6,3); cofintoutf2 = modelbase.data(7,3); cofintoutf3 = modelbase.data(8,3); cofintoutf4 = modelbase.data(9,3);
    cofintoutp = modelbase.data(1,4); cofintoutpb1 = modelbase.data(2,4); cofintoutpb2 = modelbase.data(3,4); cofintoutpb3 = modelbase.data(4,4); cofintoutpb4 = modelbase.data(5,4);
    cofintoutpf1 = modelbase.data(6,4); cofintoutpf2 = modelbase.data(7,4); cofintoutpf3 = modelbase.data(8,4); cofintoutpf4 = modelbase.data(9,4);
    std_r_ = 1;
    std_r_quart = 0.25;
end
%%

%**********************************************************************************************************************
%                                DON'T CHANGE ANYTHING AFTER THIS LINE                                                %
%**********************************************************************************************************************

cd('..');
cd MODELS
save policy_param.mat cofintintb1 cofintintb2 cofintintb3 cofintintb4...
    cofintinf0 cofintinfb1 cofintinfb2 cofintinfb3 cofintinfb4 cofintinff1 cofintinff2 cofintinff3 cofintinff4...
    cofintout cofintoutb1 cofintoutb2 cofintoutb3 cofintoutb4 cofintoutf1 cofintoutf2 cofintoutf3 cofintoutf4...
    cofintoutp cofintoutpb1 cofintoutpb2 cofintoutpb3 cofintoutpb4 cofintoutpf1 cofintoutpf2 cofintoutpf3 cofintoutpf4...
    std_r_ std_r_quart ;
cd('..');
cd MMB_OPTIONS

disp(' ')
disp('Selected Policy Rule:');
disp(deblank(modelbase.rulenames(modelbase.rule,:)));


disp(' ');
disp('Selected options:');
if modelbase.option(1) == 1
    disp('Autocorrelation functions will be plotted.');
else disp('Autocorrelation functions will not be plotted.');
end

if modelbase.option(2) == 1
    disp('Impulse response functions will be plotted.');
else disp('Impulse response functions will not be plotted.');
end

modelbase.namesshocks= char(['Mon. Pol. Shock      '
    'Fiscal Pol. Shock    ']);
modelbase.namesinnos= char(['interest_'
    'fiscal_  ']);


choices=[]; % initialize, otherwise we have an error when trying to save
modelbase.innos = [];
choices=find(shocks>0);
if modelbase.option(2)==1
    choice=1;
    disp(' ');
    disp('Selected shocks:');
    modelbase.innos=modelbase.namesinnos(choices,:);
    modelbase.namesshocks = modelbase.namesshocks(choices,:); % this is neccesary for plotting the right shock in the right figure otherwise the order might get confused
    %end
end;
%%
%**********************************************************************************************************************
%                    Solving the Model, Computing Statistics                                                          %
%**********************************************************************************************************************
save Modelbase modelbase                                % neccessary to save in between as dynare clears the workspace
for epsilon=1:size(modelbase.models,2)
    %tic
    modelbase.modeltime(modelbase.models(epsilon)) = cputime;
	if modelbase.OSenvironment == 0;
	    modelbase.setpath(modelbase.models(epsilon),:) = [modelbase.uphomepath num2str('\MODELS\') num2str(modelbase.names(modelbase.models(epsilon),:))]; % path for dynare file of specific model
	else
		 modelbase.setpath(modelbase.models(epsilon),:) = [modelbase.uphomepath num2str('/MODELS/')     strtrim(modelbase.names(modelbase.models(epsilon),:))]; % path for dynare file of specific model with removed spaces under MacOS
	end

    modelbase.epsilon = epsilon;
	if modelbase.OSenvironment == 0;
    	al=deblank(modelbase.names(modelbase.models(epsilon),:));
	else
		al=strtrim(modelbase.names(modelbase.models(epsilon),:));
	end
	modelbase.AL=strcmp(al(end-1:end),'AL');
    if modelbase.AL
        if ~ismember(modelbase.rule,[8 9 10])
            control=0;
            while control==0
                gain=str2num(selectgain(modelbase.names,modelbase.models,epsilon));
                if gain>=0 && gain<=0.05
                    control=1;
                end
            end
            modelbase.control=control;
            modelbase.gain=gain;
            modelbase.ModelGAIN(modelbase.models(epsilon))=modelbase.gain;
        else
            modelbase.gain=0;
            modelbase.ModelGAIN(modelbase.models(epsilon))=modelbase.gain;
            modelbase.control=[];
        end
    end
    
    save -append Modelbase modelbase
    cd(modelbase.setpath(modelbase.models(epsilon),:));      % go to directory of specific model
    disp(' ');
    disp(['Currently Solving: ', num2str(deblank(modelbase.names((modelbase.models(epsilon)),:)))]);
    eval(['dynare '  modelbase.names(modelbase.models(epsilon),:) ' noclearall']);% solve model "epsilon" in dynare by running the .mod file --> translates Dynare syntax into .m file, that is run
    cd('..');
    cd('..'); % insert one more cd('..');
    cd MMB_OPTIONS
    load Modelbase
    options_.ar=100;
    if modelbase.AL
        if ~ismember(modelbase.rule,[8 9 10])
            thepath=cd;
            cd(modelbase.setpath(modelbase.models(epsilon),:))
            load AL_Info
            cd(thepath);
            AL_.forwards = AL_Info.forwards;
            if ismember(modelbase.rule,[6 7])
                AL_.states = AL_Info.states_short;
            else
                AL_.states = AL_Info.states_long;
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
            modelbase.ModelStates(modelbase.models(epsilon))={modelbase.AL_.states};
        else
            modelbase.AL_=[];
            modelbase.ModelStates(modelbase.models(epsilon))={[]};
        end
    end
    save -append Modelbase modelbase
    warning('off','all')
    modelbase=stoch_simul_MMB(modelbase);                                     % solve model
    solution_found(epsilon)=modelbase.solution;
    cd(modelbase.homepath);                                                   % go back to main directory
    %toc
    modelbase.modeltime(modelbase.models(modelbase.epsilon))=cputime-modelbase.modeltime(modelbase.models(modelbase.epsilon));
    disp(['Elapsed cputime is ' ,num2str(modelbase.modeltime(modelbase.models(modelbase.epsilon))), ' seconds.']);
	if modelbase.OSenvironment == 1;
	    modelbase = rmfield(modelbase,'setpath') ; % path for dynare file of specific model
	end
end;

%**********************************************************************************************************************
%                    Display Variances on screen                                                                    %
%**********************************************************************************************************************
statusbar(0, 'Busy...');
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
statusbar(0, 'Busy...');
%**********************************************************************************************************************
%                    Set up figures, plot results                                                                     %
%**********************************************************************************************************************
time = (0:modelbase.horizon)';
if modelbase.option(2)==1
    for p=1:size(modelbase.innos,1)
        % plot impulse responses
        warning off
        if strcmp(modelbase.namesshocks(p,:),'Mon. Pol. Shock      ')
            figHandle{1}=figure;
            set(figHandle{1}, 'visible', 'off');
        elseif strcmp(modelbase.namesshocks(p,:),'Fiscal Pol. Shock    ')
            figHandle{2} = figure;
            set(figHandle{2}, 'visible', 'off');
        end;
        orient landscape
        modelplottedIRF=[];
        for j=1:size(modelbase.models,2)
            if modelbase.pos_shock(p,modelbase.models(j))~=0
                modelplottedIRF=[modelplottedIRF modelbase.models(j)]; % this is neccessary to plot a proper legend, that ignores the models,
                % which lack the specific shock
                subplot(2,2,1)
                plot(time,modelbase.IRF.(num2str(deblank(modelbase.names(modelbase.models(j),:))))(loc(modelbase.IRFendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'outputgap'),:,p),modelbase.mycolor(j,:),'LineWidth',2,'MarkerSize',5); hold on
                grid on
                title('Output Gap','FontUnits','normalized')
                legend(num2str(modelbase.namesplot(modelplottedIRF,:)));
                subplot(2,2,2)
                plot(time,modelbase.IRF.(num2str(deblank(modelbase.names(modelbase.models(j),:))))(loc(modelbase.IRFendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'inflation'),:,p),modelbase.mycolor(j,:),'LineWidth',2,'MarkerSize',5); hold on
                grid on
                title('Inflation','FontUnits','normalized')
                subplot(2,2,3)
                plot(time,modelbase.IRF.(num2str(deblank(modelbase.names(modelbase.models(j),:))))(loc(modelbase.IRFendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'interest'),:,p),modelbase.mycolor(j,:),'LineWidth',2,'MarkerSize',5); hold on
                grid on
                title('Interest Rate','FontUnits','normalized')
                if loc(modelbase.IRFendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'output')~=0
                    subplot(2,2,4)
                    plot(time,modelbase.IRF.(num2str(deblank(modelbase.names(modelbase.models(j),:))))(loc(modelbase.IRFendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'output'),:,p),modelbase.mycolor(j,:),'LineWidth',2,'MarkerSize',5); hold on
                    grid on
                    title('Output','FontUnits','normalized')
                end
            end;
        end;
    end;
end



if modelbase.option(1)==1
    % plot autocorrelation function
    time = (0:modelbase.horizon)';
    figHandle{3}=figure;
    set(figHandle{3}, 'visible', 'off');
    warning off
    orient landscape
    modelplottedAC=[];
    for j=1:size(modelbase.models,2)
        if modelbase.info(modelbase.models(j))==0
            modelplottedAC=[modelplottedAC modelbase.models(j)]; % this is neccessary to plot a proper legend, that ignores the models, which lack the specific shock
            subplot(2,2,1)
            plot(time,modelbase.AUTR.(num2str(deblank(modelbase.names(modelbase.models(j),:))))(loc(modelbase.AUTendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'outputgap'),:),modelbase.mycolor(j,:),'LineWidth',2,'MarkerSize',5); hold on
            grid on
            title('Output gap','FontUnits','normalized')
            legend(num2str(modelbase.namesplot(modelplottedAC,:)));
            
            subplot(2,2,2)
            plot(time,modelbase.AUTR.(num2str(deblank(modelbase.names(modelbase.models(j),:))))(loc(modelbase.AUTendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'inflation'),:),modelbase.mycolor(j,:),'LineWidth',2,'MarkerSize',5); hold on
            grid on
            title('Inflation','FontUnits','normalized')
            
            subplot(2,2,3)
            plot(time,modelbase.AUTR.(num2str(deblank(modelbase.names(modelbase.models(j),:))))(loc(modelbase.AUTendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'interest'),:),modelbase.mycolor(j,:),'LineWidth',2,'MarkerSize',5); hold on
            grid on
            title('Interest Rate','FontUnits','normalized')
            
            if loc(modelbase.AUTendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'output')~=0
                subplot(2,2,4)
                plot(time,modelbase.AUTR.(num2str(deblank(modelbase.names(modelbase.models(j),:))))(loc(modelbase.AUTendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'output'),:),modelbase.mycolor(j,:),'LineWidth',2,'MarkerSize',5); hold on
                grid on
                title('Output','FontUnits','normalized')
            end
        end
    end
end
if ~isempty(find(solution_found>0))
    if modelbase.option(2)==1
        for p=1:size(modelbase.innos,1)
            % Show impulse responses
            warning off
            orient landscape
            if  strcmp(modelbase.namesshocks(p,:),'Mon. Pol. Shock      ')
                figure(figHandle{1});
                set(subplot(2,2,1), 'Position',[0.131 0.495 0.335 0.341])
                set(subplot(2,2,2), 'Position',[0.570 0.495 0.335 0.341])
                set(subplot(2,2,3), 'Position',[0.131 0.066 0.335 0.341])
                isoutput=0;
                for j=1:size(modelbase.models,2)
                    if (modelbase.pos_shock(p,modelbase.models(j))~=0)
                        isoutput=isoutput+((loc(modelbase.IRFendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'output')~=0));
                    end
                end
                if isoutput>0
                    set(subplot(2,2,4), 'Position',[0.570 0.066 0.335 0.341])
                else set(subplot(2,2,4), 'visible','off')
                end
                annotation('textbox', [0.0007 0.891 1 0.1], ...
                    'String', ['IRF ',num2str(deblank(modelbase.namesshocks(p,:))) ': ' modelbase.rulenamesshort(modelbase.rule,:)], ...%[0.5 0.8 0.95 0.1]
                    'EdgeColor', 'none', 'FontUnits','normalized',...
                    'HorizontalAlignment', 'center');
                set(figHandle{1}, 'visible', 'on')
            elseif  strcmp(modelbase.namesshocks(p,:),'Fiscal Pol. Shock    ')
                isfiscal=0;
                isoutput=0;
                for j=1:size(modelbase.models,2)
                    isfiscal=isfiscal+(modelbase.pos_shock(p,modelbase.models(j))~=0);
                    if (modelbase.pos_shock(p,modelbase.models(j))~=0)
                        isoutput=isoutput+((loc(modelbase.IRFendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'output')~=0));
                    end
                end
                if isfiscal>0
                    figure(figHandle{2});
                    set(subplot(2,2,1), 'Position',[0.131 0.495 0.335 0.341])
                    set(subplot(2,2,2), 'Position',[0.570 0.495 0.335 0.341])
                    set(subplot(2,2,3), 'Position',[0.131 0.066 0.335 0.341])
                    if isoutput>0
                        set(subplot(2,2,4), 'Position',[0.570 0.066 0.335 0.341])
                    else set(subplot(2,2,4), 'visible','off')
                    end
                    annotation('textbox', [0.0007 0.891 1 0.1], ...
                        'String', ['IRF ',num2str(deblank(modelbase.namesshocks(p,:))) ': ' modelbase.rulenamesshort(modelbase.rule,:)], ...%[0.5 0.8 0.95 0.1]
                        'EdgeColor', 'none', 'FontUnits','normalized',...
                        'HorizontalAlignment', 'center');
                    set(figHandle{2}, 'visible', 'on')
                end
            end
        end
    end;
    if modelbase.option(1)==1
        figure(figHandle{3});
        set(subplot(2,2,1), 'Position',[0.131 0.495 0.335 0.341])
        set(subplot(2,2,2), 'Position',[0.570 0.495 0.335 0.341])
        set(subplot(2,2,3), 'Position',[0.131 0.066 0.335 0.341])
        isoutput=0;
        for j=1:size(modelbase.models,2)
            if modelbase.info(modelbase.models(j))==0
                isoutput=isoutput+((loc(modelbase.AUTendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),'output')~=0));
            end
        end
        if isoutput>0
            set(subplot(2,2,4), 'Position',[0.570 0.066 0.335 0.341])
        else set(subplot(2,2,4), 'visible','off')
        end
        
        annotation('textbox', [0.0007 0.891 1 0.1], ...
            'String', ['Autocorrelation Function: ' modelbase.rulenamesshort(modelbase.rule,:)], ...%[0.5 0.8 0.95 0.1]
            'EdgeColor', 'none', 'FontUnits','normalized',...
            'HorizontalAlignment', 'center');
        set(figHandle{3}, 'visible', 'on');
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
                            for i=1:modelbase.horizon+1
                                result.IRF.(num2str(deblank(modelbase.innos(p,:))))(rownr,i+1) = {modelbase.IRF.(num2str(deblank(modelbase.names(modelbase.models(j),:))))(loc(modelbase.IRFendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),keyvariables(k,:)),i,p)};
                            end
                        end
                    else
                        result.IRF.(num2str(deblank(modelbase.innos(p,:))))(rownr,2:modelbase.horizon+2) = {[]};
                    end
                else
                    result.IRF.(num2str(deblank(modelbase.innos(p,:))))(rownr,2:modelbase.horizon+2) = {[]};
                end
                try
                    ListStates=modelbase.ModelStates(modelbase.models(j));
                    result.AL{rownr} = [{num2str(deblank(modelbase.names(modelbase.models(j),:)))},...
                        {'Gain'},{num2str(modelbase.ModelGAIN(modelbase.models(j)))},...
                        {'States'}, ListStates{:}];
                catch
                end
                
            else
                result.IRF.(num2str(deblank(modelbase.innos(p,:))))(rownr,2:modelbase.horizon+2) = {[]};
            end
            try
                if p==1&&k==1
			if modelbase.OSenvironment == 0;
                    xlswrite(modelbase.savepath, result.AL{rownr}, 'AL Settings',['A' num2str(rownr)]);
			else 
					xlwrite(modelbase.savepath, result.AL{rownr}, 'AL Settings',['A' num2str(rownr)]); % Replacing xlswrite under MacOS, with XLWRITE
			end
                end
            catch
            end
            rownr = rownr+1;
        end
    end
	if modelbase.OSenvironment == 0;
    	xlswrite(modelbase.savepath, result.IRF.(num2str(deblank(modelbase.innos(p,:)))), ['IRF ' modelbase.namesshocks(p,:)]);
	else
		 xlwrite(modelbase.savepath, result.IRF.(num2str(strtrim(modelbase.innos(p,:)))), ['IRF ' modelbase.namesshocks(p,:)]); % Replacing xlswrite under MacOS, with XLWRITE
	end
end
if modelbase.option(1) ==1
    rownr  = 1;
    for k = 1:size(keyvariables,1);
        result.AC(rownr,1) = {keyvariables(k,:)}; rownr = rownr+1;
        for j=1:size(modelbase.models,2)
            result.AC(rownr,1) = {num2str(deblank(modelbase.names(modelbase.models(j),:)))};
            if modelbase.info(modelbase.models(j)) == 0
                if loc(modelbase.AUTendo_names.(num2str(deblank(modelbase.names(modelbase.models(j),:)))),keyvariables(k,:))~=0
                    for i=1:modelbase.horizon+1
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
	if modelbase.OSenvironment == 0;
    	xlswrite(modelbase.savepath, result.AC, 'ACF');
	else
		xlwrite(modelbase.savepath, result.AC, 'ACF');
	end
end

%Saving the IRFs of all variables in Excel, if one Model is chosen
if size(modelbase.models,2)==1
    if modelbase.info(modelbase.models(modelbase.epsilon))==0
        if isfield(modelbase,'IRFendo_names') == 1
            for p=1:size(modelbase.innos,1)
                for i=1:size(modelbase.IRFendo_names.(num2str(deblank(modelbase.names(modelbase.models(1),:)))),1)
                    result.allIRFs(i,1)={modelbase.IRFendo_names.(num2str(deblank(modelbase.names(modelbase.models(1),:))))(i,:)};
                end;
                if modelbase.pos_shock(p,modelbase.models(1))~=0
                    for j=1:size(modelbase.IRF.(num2str(deblank(modelbase.names(modelbase.models(1),:))))(:,:,p),1)
                        for k=1:size(modelbase.IRF.(num2str(deblank(modelbase.names(modelbase.models(1),:))))(:,:,p),2)
                            result.allIRFs(j,k+1)={modelbase.IRF.(num2str(deblank(modelbase.names(modelbase.models(1),:))))(j,k,p)};
                        end;
                    end;
					if modelbase.OSenvironment == 0;
                	    xlswrite(modelbase.savepath, result.allIRFs, ['all IRFs ' num2str(deblank(modelbase.namesshocks(p,:)))]);
					else
						xlwrite(modelbase.savepath, result.allIRFs, ['all IRFs ' num2str(deblank(modelbase.namesshocks(p,:)))]); 
					end
                end;
            end;
        end;
    end;
else
end;
statusbar(0, '');
try
    modelbase=rmfield(modelbase,'figHandle');
    modelbase=rmfield(modelbase,'figHandleRest');
catch
end
save Modelbase.mat modelbase % Save settings
rmpath(modelbase.homepath);
cd('..');
