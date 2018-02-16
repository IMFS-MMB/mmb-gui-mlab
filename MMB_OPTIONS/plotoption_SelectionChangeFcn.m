function plotoption_SelectionChangeFcn(hObject,eventdata)
global option4;
option4=1;
switch get(eventdata.NewValue,'Tag') % Get Tag of selected object.
case 'selvar'
    option4=1;
case 'allvar'
     option4=0;
end
