function mycb_callback(hObject, eventdata,index)
global s;
global chosenshocks;
global option3;
global vecshocks;
global allshocks;
for j=1:s(1,1)
    if index==j
      chosenshocks(j)=get(hObject,'Value');
      if ~get(hObject,'Value')
      set(allshocks, 'Value',0)
      end
    end
end
if index==s(1,1)+1
     chosenshocks=1:s(1,1);
     chosenshocks=chosenshocks';
     set(vecshocks, 'Value', get(hObject,'Value'))
elseif index==s(1,1)+2
    option3=get(hObject,'Value');
      if option3 == 1
            disp('Selected innovations will be shocked contemporaneously.');
      elseif option3 == 0
          disp('Selected innovations will not be shocked contemporaneously.');
      end
elseif index==s(1,1)+3   
    close(gcbf)   
end

