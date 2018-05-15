function varargout = OPT1MENU_AL(varargin)
% OPT1MENU_AL MATLAB code for OPT1MENU_AL.fig
%      OPT1MENU_AL, by itself, creates a new OPT1MENU_AL or raises the existing
%      singleton*.
%
%      H = OPT1MENU_AL returns the handle to a new OPT1MENU_AL or the handle to
%      the existing singleton*.
%
%      OPT1MENU_AL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OPT1MENU_AL.M with the given input arguments.
%
%      OPT1MENU_AL('Property','Value',...) creates a new OPT1MENU_AL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before OPT1MENU_AL_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to OPT1MENU_AL_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help OPT1MENU_AL

% Last Modified by GUIDE v2.5 26-Apr-2018 14:51:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @OPT1MENU_AL_OpeningFcn, ...
                   'gui_OutputFcn',  @OPT1MENU_AL_OutputFcn, ...
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


% --- Executes just before OPT1MENU_AL is made visible.
function OPT1MENU_AL_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to OPT1MENU_AL (see VARARGIN)

% Choose default command line output for OPT1MENU_AL
handles.output = hObject;
global modelslist;
% Update handles structure
guidata(hObject, handles);
global modelsvec
try
    set(modelslist(find(modelsvec>0)),'Value',1);
    modelstag = {get(modelslist(find(modelsvec>0)),'Tag')};
    for i = 1:size(modelstag,1)
        eval(['arrayfun(@(x) set(x, ''Value'',1), handles.', modelstag{i,:} ');']);
    end
catch
    
end
    
% UIWAIT makes OPT1MENU_AL wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = OPT1MENU_AL_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

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


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1

uiresume
close(gcbf)


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: delete(hObject) closes the figure
global AL_Models;
global modelsvec;
if max(modelsvec(AL_Models)) 
else
    modelsvec(AL_Models) = 0;
    handles.almodels1 =  findobj(findobj(allchild(findobj(eventdata.Source.Parent.Children(1),'Tag','uipanel2'))),'Tag','almodelsopt1'); % Find the almodelsopt1 tag in the parent figure and set it to 0.
    set(handles.almodels1,'Value',0)
    
end

delete(hObject);
