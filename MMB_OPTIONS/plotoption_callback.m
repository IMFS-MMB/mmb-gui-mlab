function plotoption_callback(hObject, eventdata,index)
global option4 precision plotoptionhandles;
option4=1;
if index==1
    option4=1;
    set(plotoptionhandles.allvar,'value',0);
    set(plotoptionhandles.nonzerovar,'value',0);
    precision=20;
elseif index==2
    option4=0;precision=20;
    set(plotoptionhandles.selvar,'value',0);
    set(plotoptionhandles.nonzerovar,'value',0);
elseif index==3||index==4
    option4=0;
     set(plotoptionhandles.selvar,'value',0);
    set(plotoptionhandles.allvar,'value',0);
    p=str2double(get(plotoptionhandles.precision,'String'));
    if (~isempty(p)&&~isnan(p))
        precision=5*(p<=0)+p*(p>0);
    else precision=5;set(hObject,'string',precision);
    end
end