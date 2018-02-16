function fig_id=set_figures(fig_id,n_subplots,type_plot,fig_title)
if type_plot==1
    positions=[0.131 0.495 0.335 0.341;
        0.570 0.495 0.335 0.341;
        0.131 0.066 0.335 0.341;
        0.570 0.066 0.335 0.341];
elseif type_plot==2
    positions=[0.131 0.638 0.213 0.202;
        0.411 0.638 0.213 0.202;
        0.692 0.638 0.213 0.202;
        0.131 0.338 0.213 0.202;
        0.411 0.338 0.213 0.202;
        0.692 0.338 0.213 0.202;
        0.131 0.038 0.213 0.202;
        0.411 0.038 0.213 0.202;
        0.692 0.038 0.213 0.202];
end
if size(positions,1)==4
    for h=1:n_subplots
        try
            set(subplot(2,2,h), 'Position',positions(h,:));
        catch
            set(subplot(2,2,h), 'visible','off')
        end
    end
    annotation('textbox', [0.0007 0.891 1 0.1], ...
        'String', fig_title, 'EdgeColor', 'none', 'FontUnits','normalized',...
        'HorizontalAlignment', 'center');
else
    for h=1:n_subplots
        set(subplot(3,3,h), 'Position',positions(h,:));
    end
    annotation('textbox', [0.0007 0.891 1 0.1], ...
        'String', fig_title, 'EdgeColor', 'none', 'FontUnits','normalized',...
        'HorizontalAlignment', 'center');
end

set(fig_id, 'visible', 'on');
end