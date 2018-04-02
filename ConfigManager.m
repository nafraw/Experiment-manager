classdef ConfigManager < handle
    %UNTITLED25 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (SetAccess = private, GetAccess = public)
        ExpName
        configFiles
    end
    
    methods
        function obj = ConfigManager()
            obj.ExpName = [];
            obj.configFiles = [];
        end
        
        function [parameters, filenameFormat] = runConfigsByContainStr(obj, targetStr)
            index = find(contains(obj.configFiles, targetStr));
            [parameters, filenameFormat] = obj.runConfigsByIndex(index);
        end        
        
        function [parameters, filenameFormat] = runConfigsByIndex(obj, index)
            parameters = [];
            filenameFormat = [];
            for idx = index
                evalc(['[parameters, filenameFormat{end+1}] = ', obj.configFiles{idx}, '(parameters);']);
            end
            filenameFormat = strjoin(filenameFormat, '_');
        end
        
        function [parameters, filenameFormat] = runConfigs(obj)
            [parameters, filenameFormat] = obj.runConfigsByIndex(1:numel(obj.configFiles));            
        end
        
        function obj = setExpName(obj, expName)
            obj.ExpName = expName;
        end
        
        function obj = addConfig(obj, configFiles)
            assert(ischar(configFiles));
            obj.configFiles{end+1} = configFiles;
        end
    end
    
end

