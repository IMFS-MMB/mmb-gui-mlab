function varargout = OPT2MENU_AL(varargin)
% OPT2MENU_AL MATLAB code for OPT2MENU_AL.fig
%      OPT2MENU_AL, by itself, creates a new OPT2MENU_AL or raises the existing
%      singleton*.
%
%      H = OPT2MENU_AL returns the handle to a new OPT2MENU_AL or the handle to
%      the existing singleton*.
%
%      OPT2MENU_AL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OPT2MENU_AL.M with the given input arguments.
%
%      OPT2MENU_AL('Property','Value',...) creates a new OPT2MENU_AL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before OPT2MENU_AL_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to OPT2MENU_AL_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help OPT2MENU_AL

% Last Modified by GUIDE v2.5 07-Jun-2017 16:17:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @OPT2MENU_AL_OpeningFcn, ...
                   'gui_OutputFcn',  @OPT2MENU_AL_OutputFcn, ...
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


% --- Executes just before OPT2MENU_AL is made visible.
function OPT2MENU_AL_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to OPT2MENU_AL (see VARARGIN)

% Choose default command line output for OPT2MENU_AL
handles.output = hObject;
global modelslist;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes OPT2MENU_AL wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = OPT2MENU_AL_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when selected object is changed in groupalmodels.
function groupalmodels_SelectionChangeFcn(hObject, eventdata, handles)
global modelsvec;
global modelslist;
global model_with_rule;
global rule;
 
i=1:max(size(modelsvec));
modelsvec(i)=0;
if ~isempty(findobj(modelslist,'Tag',get(eventdata.NewValue,'Tag')))
    number = find(modelslist==findobj(modelslist,'Tag',get(eventdata.NewValue,'Tag')));
    modelsvec(number)=1;
    try 
    if ~isempty(find(model_with_rule==number))
        set(handles.mospporu, 'Enable','on');
    else
        set(handles.mospporu, 'Enable','off');
        set(handles.mospporu, 'Value',0);
        rule(2)=0;
    end
    end

end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

uiresume
close(gcbf)
