function varargout = USERRULE(varargin)
% USERRULE MATLAB code for USERRULE.fig
%      USERRULE, by itself, creates a new USERRULE or raises the existing
%      singleton*.
%
%      H = USERRULE returns the handle to a new USERRULE or the handle to
%      the existing singleton*.
%
%      USERRULE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in USERRULE.M with the given input arguments.
%
%      USERRULE('Property','Value',...) creates a new USERRULE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before USERRULE_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to USERRULE_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help USERRULE

% Last Modified by GUIDE v2.5 22-May-2017 17:12:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @USERRULE_OpeningFcn, ...
                   'gui_OutputFcn',  @USERRULE_OutputFcn, ...
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


% --- Executes just before USERRULE is made visible.
function USERRULE_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to USERRULE (see VARARGIN)

% Choose default command line output for USERRULE
handles.output = hObject;
global data;
set(handles.uitable1, 'Data', data)
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes USERRULE wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = USERRULE_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global exoptions;
% if find(exoptions>0)==1
% OPT1MENU
% else OPT2MENU
% end
uiresume
close(gcbf)



% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
global data;

data=get(hObject,'data');
uiwait
%disp('data');

% --- Executes when selected cell(s) is changed in uitable1.
function uitable1_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)


%%%%%% readme pdf file 
function read_Callback(hObject, eventdata, handles)
winopen('readme_USR.pdf')
% hObject    handle to read (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of read


% --- Executes during object creation, after setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in cancel.
function cancel_Callback(hObject, eventdata, handles)
% hObject    handle to cancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data;
data =[NaN 0 0 0;0 0 0 0;0 0 0 0;0 0 0 0;...
    0 0 0 0;NaN 0 0 0;NaN 0 0 0;NaN 0 0 0;NaN 0 0 0];
uiresume
close(gcbf)


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data;
 data =[NaN 0 0 0;0 0 0 0;NaN NaN NaN NaN;NaN NaN NaN NaN;...
    NaN NaN NaN NaN;NaN 0 0 0;NaN NaN NaN NaN;NaN NaN NaN NaN;NaN NaN NaN NaN];
set(handles.uitable1, 'Data', data)
uiwait
