classdef DataManager < handle  % pass by object, otherwise, the data can be too heavy
    %% Data manager
    % A class to manager multi-modal data, for instance, can be suitable for
    % physiological signals and behavioral measurement.
    % This is a dictionary-like class. Each data is associated to a name.
    % In addition, one can apply the same function to the specified data.
    % For example, you can do common-average subtraction to some of your
    % data. Without this class, you need to call the function twice, but
    % with this class, you can use applyFunctionToDataByIndex or
    % applyFunctionToDataByName.
    %% Version Info
    % Author: Ping-Keng Jao
    % email: ping-keng.jao@epfl.ch
    % 31/03/2018: First version
    
    properties (SetAccess = private, GetAccess = public)
        subjectID            % subject of the recording
        date                      % date of the recording
        data                      % a column-vector cell
        nameOfData      % a column-vector cell, each element indicating the name of corresponding data
        delimiter             % use delimiter to define how to retrieve subjectID and date from a file
        filenames           % filenames of data
        additionalInfo   % some text info for this class, e.g. how was the data processed
        timeAccess        % last time of access after adding, deleting, or applying some methods
        checkRoutine    % a boolean value, set as true for debugging mode. A check routine will be called every time a propertie is changed.
                                      % This can be done by listeners but it is neglected here. More Info:
                                      % https://ch.mathworks.com/help/matlab/matlab_oop/listening-for-changes-to-property-values.html                                      
    end
    
    methods (Access = public)
        %% Constructor
        function obj = DataManager(varargin)
            if nargin < 2
                checkRoutine = false;
            else
                checkRoutine = varargin{2};
            end
            if nargin < 1
                nData = 0;
            else
                nData = varargin{1};
            end
            obj.date = [];
            obj.subjectID = [];
            obj.data = cell(nData, 1);
            obj.nameOfData = cell(nData, 1);
            obj.delimiter = '_';
            obj.filenames = cell(nData, 1);
            obj.additionalInfo = [];
            obj.timeAccess = '';
            obj.checkRoutine = checkRoutine;
        end
        
        %% check if data is normal
       %  function obj = checkData(obj)
       
        %% set additionalInfo
        % function obj = addInfo(obj, newInfo)        
        % function obj = modifyInfo(obj, index, newInfo)            
        
        %% set subjectID and date
        % function obj = setDateAndID(obj, filename)
        % function obj = setDelimiter(obj, delim)        
        % function [id, date] = getDateAndID(obj, filename)            
        % function obj = saveAccessTime(obj)
        
        %% search methods
        % function index = searchDataByName(obj, names)
        
        %% data mangement methods
        % function [data, nameOfData, index] = getDataByName(obj, names)        
        % function [data, nameOfData] = getDataByIndex(obj, indices)        
        % function obj = removeDataByName(obj, names)        
        % function obj = removeDataByIndex(obj, indices)        
        % function obj = addDataToLast(obj, data, names, filenames)
        % function obj = addData(obj, data, names, indices, filenames)
        
        %% data processing methods
       % function obj = setDataByIndex(obj, data, index, name)
       % function obj = setDataByName(obj, data, name)
       % function obj = applyFunctionToDataByIndex(obj, indices, func)        
       % function obj = applyFunctionToDataByName(obj, names, func)        
       % function obj = applyFunctionToAllData(obj, func)        
       % function obj = applyDifferentFunctionsToDataByIndex(obj, indices, funcs)        
       % function obj = applyDifferentFunctionsToDataByName(obj, names, funcs)        
       % function obj = applyDifferentFunctionsToAllData(obj, funcs)        
    end
    
end

