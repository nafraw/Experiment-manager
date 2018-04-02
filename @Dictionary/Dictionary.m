classdef Dictionary < handle  % pass by object, otherwise, the data can be too heavy
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
        data                      % a column-vector cell
        nameOfData      % a column-vector cell, each element indicating the name of corresponding data        
        checkRoutine    % a boolean value, set as true for debugging mode. A check routine will be called every time a propertie is changed.
                                      % This can be done by listeners but it is neglected here. More Info:
                                      % https://ch.mathworks.com/help/matlab/matlab_oop/listening-for-changes-to-property-values.html                                      
    end
    
    methods (Access = public)
        %% Constructor
        function obj = Dictionary(varargin)
            if nargin < 2
                obj.checkRoutine = true;
            else
                obj.checkRoutine = varargin{2};
            end
            if nargin < 1
                nData = 0;
            else
                nData = varargin{1};
            end            
            obj.data = cell(nData, 1);
            obj.nameOfData = cell(nData, 1);            
        end
        
        %% check if data is normal
       %  function obj = checkData(obj)
                       
        %% set subjectID and date        
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
       % function obj = applyFunctionToDataByIndex(obj, indices, func)        
       % function obj = applyFunctionToDataByName(obj, names, func)        
       % function obj = applyFunctionToAllData(obj, func)        
       % function obj = applyDifferentFunctionsToDataByIndex(obj, indices, funcs)        
       % function obj = applyDifferentFunctionsToDataByName(obj, names, funcs)        
       % function obj = applyDifferentFunctionsToAllData(obj, funcs)        
    end
    
end

