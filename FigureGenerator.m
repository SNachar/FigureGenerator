function out=FigureGenerator(Fig,id_fig)
%% InitFig : SmallScript to generate Faster Figures which could be updated
% Fig    : Structure which informations (Cf. Exemple_Generator.m)
%    Fig(id).type : Figure Fonction
%    Fig(id).name : Data Name
%    Fig(id).XDataSource,Fig(1).YDataSource,Fig(1).ZDataSource : X,Y,Z Data
%    Fig(id).Properties : Figure Properties
%    Fig(id).Updating   : Do you want to update further later your data?
%
% id_fig : Number of your figure in Fig structure

DataSource = {'XDataSource','YDataSource','ZDataSource'};

out=figure(id_fig);                % Generate Blank Figure
%movegui(out,[500*(id_fig-1),200]);
hold on
for id=1:size(Fig,2)               % For all data which will be projeted in the same figure
    if ~isempty(Fig(id).type)      % If the figure exist in the table
        test_DataSource=isfield(Fig(id),DataSource); % If X,Y,Z Data exists
        fctPlot = Fig(id).type;
        arg={};
        % Load Data from the caller workspace
        for id_DataSource=find(test_DataSource)      % If X,Y,Z Data exists
            arg{end+1} = evalin('caller',Fig(id).(DataSource{id_DataSource}));
        end
        % Load Properties
        Prop    = Fig(id).Properties;
        % Trace Data
        fig=feval(fctPlot,arg{:},Prop{:});
        % For Updating
        for id_DataSource=find(test_DataSource)
            fig.(DataSource{id_DataSource})=Fig(id).(DataSource{id_DataSource});
        end
    end
end
% Create Legend
legend(Fig(:).name,'Location','NorthWest')
hold off
end