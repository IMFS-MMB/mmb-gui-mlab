 function varargout = MAINMENU(varargin)
% MAINMENU MATLAB code for MAINMENU.fig
%      MAINMENU, by itself, creates a new MAINMENU or raises the existing
%      singleton*.
%
%      H = MAINMENU returns the handle to a new MAINMENU or the handle to
%      the existing singleton*.
%
%      MAINMENU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAINMENU.M with the given input arguments.
%
%      MAINMENU('Property','Value',...) creates a new MAINMENU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI Tbefore MAINMENU_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MAINMENU_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MAINMENU

% Last Modified by GUIDE v2.5 09-Jan-2014 16:28:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MAINMENU_OpeningFcn, ...
                   'gui_OutputFcn',  @MAINMENU_OutputFcn, ...
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


% --- Executes just before MAINMENU is made visible.
function MAINMENU_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MAINMENU (see VARARGIN)

        checkall(handles.onerule,0);
        checkall(handles.onemodel,0);

% Choose default command line output for MAINMENU
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MAINMENU wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MAINMENU_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from h andles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global exoptions;
switch find(exoptions>0)
    case 1 
       OPT1MENU;       
       close(gcbf)
    case 2
        OPT2MENU;       
        close(gcbf)
    
end

uiresume
% --- Executes when selected object is changed in uipanel1.
function uipanel1_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel1 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'Selection Changed' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
global exoptions;
global text;
z=1:max(size(exoptions));
exoptions(z)=0;
switch get(eventdata.NewValue,'Tag')   % Get Tag of selected object
    case 'onerule'
        z=1:max(size(exoptions));
        exoptions(z)=0;
        exoptions(1)=1;
        text =  char(['Brief Description                                                                  '
                      '                                                                                   '
                      ' This exercise allows the user to conduct model comparison and analysis            '
                      'under a particular monetary policy rule (MP). Users can compare                    ' 
                      'impulse response functions of common MMB variables to common shocks                '
                      '(monetary policy shock and fiscal policy shock) and autocorrelation                ' 
                      'functions of common variables in response to all shocks.                           '
                      '                                                                                   '
                      'Currently, nine MP rules are pre-programmed. These include rules from              '  
                      'Taylor (1993), Levin et al. (2003), Smets and Wouters (2007),                      '       
                      'Orphanides and Wieland (2013) and others. Additionally, users have the             '
                      'option to specify their own policy rule.                                           ']);
                      %'A detailed description of this exercise is provided in the following document:     ']);                            
        set(handles.text1, 'String', text);  
        set(handles.pushbutton1, 'Enable', 'on'); 
    case 'onemodel'
        z=1:max(size(exoptions));
        exoptions(z)=0;
        exoptions(2)=1;
        text =  char(['Brief Description                                                                  '
                      '                                                                                   '
                      'This exercise allows the user to explore the properties of a particular            '
                      'model in greater detail, under alternative monetary policy (MP) rules.             '
                      'More specifically, users can compute impulse response functions of model           '
                      'variables to all model-specific shocks. The autocorrelation analysis shows         '
                      'how the persistence of endogenous variables varies according to the policy         '
                      'rules used.                                                                        '
                      '                                                                                   '
                      ' For this exercise, nine monetary policy rules are pre-programmed.                 '                
                      'They include rules from Taylor (1993), Levin et al. (2003), Smets and Wouters      '
                      '(2007), Orphanides and Wieland (2013) among others.                                '           
                      'Users can also specify their own policy rule. In addition, the user can            '
                      'conduct analysis under the original model-specific rule. Thereby it is easily      ' 
                      'possible to replicate results from the original publications by model developers   '
                      '(option available for 42 models).                                                  ']);
                     % '                                                                                   '
                     % The autocorrelation analysis can reveal how much       '
                     % 'the persistence of endogenous variables varies according to the MP rules used.     ''A detailed description of this exercise is provided in the following document:     ']);                              
        set(handles.text1, 'String', text); 
        set(handles.pushbutton1, 'Enable', 'on'); 
    end
uiwait


% --- Executes during object creation, after setting all properties.
function text1_CreateFcn(hObject, eventdata, handles)
%global text;
%disp(text)
%set(handles.text1, 'String', text) 
% hObject    handle to text1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

%%%%%%% This function gives all handles whose tags are in arraytag the value 'val'
function checkall(arraytag,val)
set(arraytag, 'Value', val);


% --- Executes on button press in homepage.
function homepage_Callback(hObject, eventdata, handles)
web('www.macromodelbase.com')
% hObject    handle to homepage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of homepage
