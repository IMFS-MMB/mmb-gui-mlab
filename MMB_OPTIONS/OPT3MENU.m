function varargout = OPT3MENU(varargin)
% Last Modified by GUIDE v2.5 11-Jun-2014 16:17:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @OPT3MENU_OpeningFcn, ...
    'gui_OutputFcn',  @OPT3MENU_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before OPT3MENU is made visible.
function OPT3MENU_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
load('Modelbase.mat')
global ruleslist;
global modelslist;
global exercise;
exercise=modelbase.exercise;
ruleslist=[handles.user,handles.ho,handles.taylor,handles.gero,handles.lewiwi,handles.smwous,...
              handles.cheiev,handles.orpwie08,handles.orpwie,handles.radiobutton11];
   % Since the model specific rule is available only in the second option we fill the never-used handle (handle.ho) in that position.  
         
modelslist=[handles.nkrw97, handles.nklww03, handles.nkcgg99,...
    handles.nkcgg02, handles.nkmcn99cr, handles.nkir04,...
    handles.nkbgg99, handles.nkgm05, handles.nkgk11,...
    handles.nkck08, handles.nkckl09, handles.nkrw06...
    handles.usfm95, handles.usow98, handles.usfrb03,...
    handles.usfrb08, handles.usfrb08mx, handles.ussw07,...
    handles.usacelm, handles.usacelt, handles.usacelswm,...
    handles.usacelswt, handles.usrs99, handles.usor03,...
    handles.uspm08, handles.uspm08fl, handles.usdg08,...
    handles.uscd08, handles.usiac05, handles.usmr07, ...
    handles.usra07, handles.uscctw10, handles.usir11, ...
    handles.eacw05ta, handles.eacw05fm, handles.eaawm05, ...
    handles.easw03, handles.easr07, handles.eaquest3,...
    handles.eackl09, handles.eage10, handles.g7tay93,  ...
    handles.g3cw03, handles.eaczgem03, handles.g2sigma08, ...
    handles.eausnawm08, handles.eaesra09, handles.clms07,  ...
    handles.brasamba08, handles.cals07, handles.hkfpp11,  ...
    handles.usin10, handles.uscmr10, handles.uscmr10fa ,...
    handles.usvmdno, handles.usvmdop, handles.eagnss10,...
    handles.nkmm10, handles.nkkrs12, handles.hkfp13,...
    handles.eausnawmctww,handles.nkcw09];
if exercise==2
    set(handles.loprse, 'Enable', 'off')
end
checkall(ruleslist,0);
checkall(modelslist,0);
clear Modelbase.mat
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = OPT3MENU_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%% GROUP OF RADIO BUTTON FOR COMMON MP RULES %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function uipanel1_SelectionChangeFcn(hObject, eventdata, handles)
global rule;
global ruleslist;
global data;
i=1:max(size(rule));
rule(i)=0;
if ~isempty(findobj(ruleslist,'Tag',get(eventdata.NewValue,'Tag')))
rule(find(ruleslist==findobj(ruleslist,'Tag',get(eventdata.NewValue,'Tag'))))=1;
if find(ruleslist==findobj(ruleslist,'Tag',get(eventdata.NewValue,'Tag')))==1
  USERRULE
  waitfor(USERRULE);
if isempty(find(data(~isnan(data))~=0))
 rule(find(ruleslist==findobj(ruleslist,'Tag',get(hObject,'Tag'))))=0;
 set(handles.user,'Value',0);
end
end
end 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%% CALLBACK OF CHECKBOXES FOR MODELS       %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function models_Callback(hObject, eventdata, handles)
global modelsvec;
global modelslist;
global NK_Models;
global Est_US_Models;
global Est_EA_Models;
global Est_Cal_Models;
global Est_SOE_Models;
if ~isempty(findobj(modelslist,'Tag',get(hObject,'Tag')))
modelsvec(find(modelslist==findobj(modelslist,'Tag',get(hObject,'Tag'))))=get(hObject,'Value');
end
switch get(hObject,'Tag')
    case 'nkmodels'  
        modelsvec(NK_Models) = get(hObject,'Value');
        set(modelslist(NK_Models), 'Value', get(hObject,'Value'));
    case 'usmodels'
        modelsvec(Est_US_Models) = get(hObject,'Value');
        set(modelslist(Est_US_Models), 'Value', get(hObject,'Value'));
    case 'eamodels'
        modelsvec(Est_EA_Models) = get(hObject,'Value');
        set(modelslist(Est_EA_Models), 'Value', get(hObject,'Value'));
    case 'ecmodels'
        modelsvec(Est_Cal_Models) = get(hObject,'Value');
        set(modelslist(Est_Cal_Models), 'Value', get(hObject,'Value'));
    case 'soemodels'
        modelsvec(Est_SOE_Models) = get(hObject,'Value');
        set(modelslist(Est_SOE_Models), 'Value', get(hObject,'Value'));
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% Choice of Shocks, Plot Options and Open pdf Files   %%%%%%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function options_Callback(hObject, eventdata, handles)
global option1;
global option2;
global option5;
global shocks;
switch get(hObject,'Tag')    % Plot IRFs
    case 'irfs'
        option2=get(hObject,'Value');
    case 'acfs'              % Plot ACFs
        option1=get(hObject,'Value');
    case 'unconvar'          % Show the unconditonal variance in the matlab console
            option5=get(hObject,'Value');
    case 'moposh'            % Monetary Policy Shock
          shocks(1)=get(hObject,'Value');
          option2=get(hObject,'Value');
          set(handles.irfs, 'Value', ~isempty(find(shocks>0)))
    case 'fiposh'            % Fiscal Policy Shock
        shocks(2)=get(hObject,'Value');
        option2=get(hObject,'Value');
        set(handles.irfs, 'Value',~isempty(find(shocks>0)))
end



%%%%%% Modify the Horizon
% The Following function is generated by Matlab and should not be modefied 
function ho_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%% Set the Horizon
function ho_Callback(hObject, eventdata, handles)
global  horizon;
h=str2double(get(hObject,'String'));
if (~isempty(h)&&~isnan(h)) 
    horizon=h*(h<101)+20*(h>100);
else horizon=20;set(hObject,'string',horizon);
end

%%%%%% pdf file for model description
function infomodels_Callback(hObject, eventdata, handles)

winopen('MMB_model_description.pdf')


%%%%%% pdf file for rule description
function inforules_Callback(hObject, eventdata, handles)

winopen('MMB_MPrule_description.pdf')



%%%%%% Specified the Output file 
% The Following function is generated by Matlab and should not be modefied 
function edit3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%%%%%% Specified the Name of the Output File 
function edit3_Callback(hObject, eventdata, handles)
global results;
results= [get(hObject,'String') '.xls'];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% Load Previous Settings, Continue and Back Buttons %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%% Load Previous Settings
function loprse_Callback(hObject, eventdata, handles)
load('Modelbase.mat')
global option1 option2 option3 option4 option5 option6 data shocks rule modelsvec exercise ruleslist modelslist horizon 
exercise = modelbase.exercise;
if exercise == 1
    option1 = modelbase.option(1); option2 = modelbase.option(2); option5 = modelbase.option(5);
    modelsvec(find(modelbase.modelsvec>0)) = 1;
    data = modelbase.data; horizon = modelbase.horizon;
 if option1
    set(handles.acfs,'Value',1)
else set(handles.acfs,'Value',0);
end

if option2
    set(handles.irfs,'Value',1)
    sizeinnos=size(modelbase.innos);
if sizeinnos(1)==2
    set(handles.moposh, 'Value',1);
    set(handles.fiposh, 'Value',1);
    shocks=[1,1];
elseif strcmp(modelbase.innos(1,:), 'interest_')
    set(handles.moposh, 'Value',1);
    shocks(1)=1;
elseif strcmp(modelbase.innos(1,:), 'fiscal_  ')
    set(handles.fiposh, 'Value',1);
    shocks(2)=1;
end
else set(handles.irfs,'Value',0);
end
if option5
    set(handles.unconvar, 'Value',1);
else set(handles.unconvar, 'Value',0);
end
rule(modelbase.rule)=1;
checkall(ruleslist(modelbase.rule),1)
prevmodels=modelslist(find(modelsvec>0));
checkall(prevmodels,1);
if rule(1)>0
     USERRULE
     waitfor(USERRULE);
if isempty(find(data(~isnan(data))~=0))
 set(handles.user,'Value',0);
end 
end
set(handles.ho, 'String', horizon)
else disp('No previous setting is available.')
end
clear Modelbase.mat
%%%%%%% This function gives all handles whose tags are in arraytag the value 'val' 
function checkall(models,val)
set(models, 'Value', val);

%%%%%% Callback for Continue Button .
function togglebutton1_Callback(hObject, eventdata, handles)
global modelsvec shocks rule option6 option1 option2 option5
if isempty(find(modelsvec>0)) 
   disp('Please choose models.') 
elseif isempty(find(rule>0))
    disp('Please choose a monetary policy rule.')
elseif (option2&&isempty(find(shocks>0)))
    disp('Please choose shocks.')
elseif (option1==0&&option2==0&&option5==0) 
     disp('Please choose options for an exercise.')  
else
    close(gcbf) % Close the GUI OPT2MENU  
    MMBOPT1     % Run the file MMBOPT2.m
end

%%%%%% Back to the main Menu
function back_Callback(hObject, eventdata, handles)
cd ..
MMB
close(gcbf)



% --- Executes during object creation, after setting all properties.
function uipanel2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --------------------------------------------------------------------
function uipanel2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
