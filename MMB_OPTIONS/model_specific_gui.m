function varargout = model_specific_gui(varargin)
global s;
global MODELGUI;
global shocks;
global vecshocks; vecshocks=[];
global allshocks option4 
global precision plotoptionhandles;
dimension=round(sqrt(s(1,1)))+2;
MODELGUI = figure('name','MODELSPECIFICMENU'); 
set(MODELGUI,'Visible','off','Position',[400,200,dimension*100,dimension*100],...    
    'color',[0.941,0.941,0.941]); 
p1=.9;
handles.panelshocks = uipanel('Parent',MODELGUI,'Title','Shocks','Units','normalized',...
             'BackgroundColor',[.9412 .9412 .9412],'Position',[.085  .3 .9  .675]);
for j=1:s(1,1)
    handles.shocks{j}=uicontrol('Parent',handles.panelshocks,'Style','checkbox','String',num2str(shocks(j,:)),...
        'Units','normalized','Position',[.05+.9*(mod(j,dimension)-(mod(j,dimension)~=0)+(dimension-1)*(mod(j,dimension)==0))/dimension p1 .9/dimension .1]...
        ,'Callback', {@mycb_callback,j});    
    p1=p1-.1*(mod(j,dimension)==0);    
    vecshocks=[vecshocks handles.shocks{j}];
end 

handles.allshocks = uicontrol('Parent',handles.panelshocks,'Style','checkbox','String','All shocks',...
        'Units','normalized','Position',[.05 .001 .3 .1],'Callback', {@mycb_callback,s(1,1)+1});
allshocks=handles.allshocks;   
handles.plotoption = uipanel('Parent',MODELGUI,'Title','Variables to be plotted','visible','on','Position',[.085  .08 .715 .2]);%,'SelectionChangeFcn',{@plotoption_SelectionChangeFcn});

plotoptionhandles.selvar=uicontrol(handles.plotoption,'Style','radiobutton','String','Selected variables (Output Gap, Inflation, Interest Rate, Output)',...
       'Units','normalized','Position',[.05 .70 .9 .2], 'Tag','selvar','Callback',{@plotoption_callback,1});

plotoptionhandles.allvar=   uicontrol(handles.plotoption,'Style','radiobutton','String','All model variables',...
       'Units','normalized','Position',[.05 .1 .9 .2], 'Tag','allvar','Callback',{@plotoption_callback,2});
plotoptionhandles.nonzerovar=   uicontrol(handles.plotoption,'Style','radiobutton','String','Only non zero IRFs, decimal for precision:',...
       'Units','normalized','Position',[.05 .35 .8 .2], 'Tag','nonzerovar','Callback',{@plotoption_callback,3});
plotoptionhandles.precision=uicontrol(handles.plotoption,'Style','edit','String',{  '5' },...
       'Units','normalized','Position',[.85 .35 .05 .2],'BackgroundColor',[1 1 1], 'Tag','precision','Callback',{@plotoption_callback,4});
option4=1;
set(plotoptionhandles.selvar,'value',1);
set(plotoptionhandles.allvar,'value',0);
set(plotoptionhandles.nonzerovar,'value',0);  
   
uicontrol('Parent',handles.panelshocks,'Style','checkbox','String','Combined responses of selected shocks',...
        'Units','normalized','Position',[.40 .001 .50 .1],'Callback',{@mycb_callback,s(1,1)+2});
uicontrol('Parent',MODELGUI,'Style','pushbutton','String','Continue>>',...
        'Units','normalized','Position',[.81 .08 .175 .08],'Callback', {@mycb_callback,s(1,1)+3});
movegui(MODELGUI,'center');
set(MODELGUI,'Visible','on');
end