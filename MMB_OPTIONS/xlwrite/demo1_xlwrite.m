%% Demo on how to use XLWRITE to save data to a xlsx file called `demo1_xlwrite.xlsx`
% It will create a new file if the file `demo1_xlwrite.xlsx` does not exist yet.
% It will overwrite the content of the cells if the file already exists.

%% Initialisation of POI Libs
% Adding required libraries for xlwrite to work correctly.
%
% IMPORTANT NOTE:
% xlwrite needs the below libraries to be loaded/executed once per session.
% Update the paths below if this script is not in the same folder as the `poi_library` folder.
javaaddpath('/Users/Maximilian/Dropbox/Matlab/xlwrite-master/poi_library/poi-3.8-20120326.jar');
javaaddpath('/Users/Maximilian/Dropbox/Matlab/xlwrite-master/poi_library/poi-ooxml-3.8-20120326.jar');
javaaddpath('/Users/Maximilian/Dropbox/Matlab/xlwrite-master/poi_library/poi-ooxml-schemas-3.8-20120326.jar');
javaaddpath('/Users/Maximilian/Dropbox/Matlab/xlwrite-master/poi_library/xmlbeans-2.3.0.jar');
javaaddpath('/Users/Maximilian/Dropbox/Matlab/xlwrite-master/poi_library/dom4j-1.6.1.jar');
javaaddpath('/Users/Maximilian/Dropbox/Matlab/xlwrite-master/poi_library/stax-api-1.0.1.jar');

%% Data Generation for XLSX
% Define an xls name
fileName = 'demo1_xlwrite.xlsx';
sheetName = 'this_is_sheetname';
startRange = 'B3';

% Generate some data
xlsData = {'A Number' 'Boolean Data' 'Empty Cells' 'Strings';...
    1 true [] 'String Text';...
    5 false [] 'Another very descriptive text';...
    -6.26 false 'This should have been an empty cell but I made an error' 'This is text';...
    1e8 true [] 'Last cell with text';...
    1e3 false NaN NaN;...
    1e2 true [] 'test'}

%% Generate XLSX file
xlwrite(fileName, xlsData, sheetName, startRange);