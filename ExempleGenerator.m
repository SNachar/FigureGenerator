clear all; delete('Figure.mat');

Fig{1}=struct;
Fig{2}=struct;

%% Figure 1
 Fig{1}(1).type='scatter3';
 Fig{1}(1).name='Data BF';
 Fig{1}(1).XDataSource='Data.S(~Data.type,1)';
 Fig{1}(1).YDataSource='Data.S(~Data.type,2)';
 Fig{1}(1).ZDataSource='Data.Y(~Data.type)';
 Fig{1}(1).Properties={'MarkerEdgeColor','g'};
 Fig{1}(1).Updating=true;

Fig{1}(2).type='scatter3';
Fig{1}(2).name='Data HF';
Fig{1}(2).XDataSource='Data.S(Data.type,1)';
Fig{1}(2).YDataSource='Data.S(Data.type,2)';
Fig{1}(2).ZDataSource='Data.Y(Data.type)';
Fig{1}(2).Properties={'MarkerEdgeColor','b'};
Fig{1}(2).Updating=true;

Fig{1}(3).type='mesh';
Fig{1}(3).name='Meta';
Fig{1}(3).XDataSource='Data.GridX{1}';
Fig{1}(3).YDataSource='Data.GridX{2}';
Fig{1}(3).ZDataSource='Meta.Y';
Fig{1}(3).Properties={};
Fig{1}(3).Updating=true;

%% Figure 2
Fig{2}(1).type='mesh';
Fig{2}(1).name='MSE';
Fig{2}(1).XDataSource='Data.GridX{1}';
Fig{2}(1).YDataSource='Data.GridX{2}';
Fig{2}(1).ZDataSource='Meta.MSE';
Fig{2}(1).Properties={};
Fig{2}(1).Updating=true;

save('ExempleGenerator.mat','Fig');