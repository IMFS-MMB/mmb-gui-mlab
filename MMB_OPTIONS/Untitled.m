figure_handle = openfig('FURTHER_MODELS.fig','new','invisible');
handles.sub=get(figure_handle,'children');
set(handles.sub,'Parent',handles.uipanel1);
delete(figure_handle);
guidata(hObject, handles); 