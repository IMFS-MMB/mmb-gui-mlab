function varargout = OPT2MENU_MULTI(varargin)
% OPT2MENU_MULTI MATLAB code for OPT2MENU_MULTI.fig
%      OPT2MENU_MULTI, by itself, creates a new OPT2MENU_MULTI or raises the existing
%      singleton*.
%
%      H = OPT2MENU_MULTI returns the handle to a new OPT2MENU_MULTI or the handle to
%      the existing singleton*.
%
%      OPT2MENU_MULTI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OPT2MENU_MULTI.M with the given input arguments.
%
%      OPT2MENU_MULTI('Property','Value',...) creates a new OPT2MENU_MULTI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before OPT2MENU_MULTI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to OPT2MENU_MULTI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help OPT2MENU_MULTI

% Last Modified by GUIDE v2.5 25-Apr-2018 00:27:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @OPT2MENU_MULTI_OpeningFcn, ...
                   'gui_OutputFcn',  @OPT2MENU_MULTI_OutputFcn, ...
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


% --- Executes just before OPT2MENU_MULTI is made visible.
function OPT2MENU_MULTI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to OPT2MENU_MULTI (see VARARGIN)

% Choose default command line output for OPT2MENU_MULTI
handles.output = hObject;
global modelslist;
checkall(handles.g7tay93,0);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes OPT2MENU_MULTI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = OPT2MENU_MULTI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when selected object is changed in ecmodels.
function ecmodels1_SelectionChangeFcn(hObject, eventdata, handles)
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
    if ~isempty(find(model_with_rule==number))a
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

%%%%%%% This function gives all handles whose tags are in arraytag the value 'val'
function checkall(arraytag,val)
set(arraytag, 'Value', val);
