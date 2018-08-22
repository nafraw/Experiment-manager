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
        
        function index = searchConfigContainTargetStr(obj, targetStr)
            index = find(contains(obj.configFiles, targetStr));
            if iscell(targetStr)
                if numel(index) ~= numel(targetStr)
                    miss_index = [];
                    for i = 1: numel(targetStr)
                        nContain = sum(contains(obj.configFiles, targetStr{i}));
                        assert(nContain <= 1);
                        if nContain == 0
                            miss_index = [miss_index, i];
                        end
                    end
                    warning(['cannot find a config with the target string: ', strjoin(targetStr(miss_index), ', ')]);
                end
            else
                if numel(index) ~= 1
                    warning(['cannot find a config with the target string: ', targetStr]);
                end
            end
        end
        
        function [parameters, filenameFormat] = runConfigsByContainStr(obj, targetStr)
            index = obj.searchConfigContainTargetStr(targetStr);
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

