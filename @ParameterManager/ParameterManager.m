classdef ParameterManager
    % Dependencies: ConfigManager
    properties (SetAccess = private, GetAccess = public)
        subjectID            % subject of the recording
        date                     % date of the recording
        configStrs          % strings in config files to search for comparison, must be a cell
        fileToLoad
    end
    
    methods (Access = public)
        function obj = ParameterManager(fileToLoad, targetStrings)
            assert(~isempty(fileToLoad));
            obj.configStrs = targetStrings;
            obj.fileToLoad = fileToLoad;
            obj.checkFile();
        end
        
        function checkFile(obj)
            if ~exist(obj.fileToLoad, 'file')
                subject = [];
                date = [];                
                configMan = []; % configManager
                parameters = [];
                save(obj.fileToLoad, 'subject', 'date', 'configMan', 'parameters');
            end
        end
        
        function [alreadyDone, sameExpDone, par, indexSameConfig, indexSameExp] = queryParameters(obj, subjectID, dateOfRecording, config_manager)
            %% initialize variable
            par = [];
            %% load for already explored data
            load(obj.fileToLoad, 'subject', 'date', 'configMan', 'parameters');
            %% check if already done before
            subjectMask = strcmp(subjectID, subject);
            dateMask = strcmp(dateOfRecording, date);
            sameExpMask = obj.compreExpName(config_manager, configMan);
            sameConfigMask = obj.compareConfig(config_manager, configMan);            
            indexSameExp = find(subjectMask & dateMask & sameExpMask);
            indexSameConfig = find(subjectMask & dateMask & sameConfigMask);
            assert(numel(indexSameExp) <= 1); % it must be unique
            alreadyDone = ~isempty(indexSameConfig);
            sameExpDone = ~isempty(indexSameExp);
            %% get parameters
            if sameExpDone
                par = parameters{indexSameExp};
            elseif alreadyDone                
                par = parameters{indexSameConfig(end)}; % always take the last one, in case there are multiple
            end
        end
        
        function sameExp = compreExpName(obj, configMan, storedConfigMans)
            sameExp = cellfun(@(x) strcmp(configMan, x), storedConfigMans);
        end
        
        function sameConfig = compareConfig(obj, configMan, storedConfigMans)
            sameConfigs = cellfun(@(x) obj.compareConfigFiles(configMan, x), storedConfigMans);
            sameConfig = sum(sameConfigs, 1) > 0;
        end
        
        function found = compareConfigFiles(obj, CM1, CM2)            
            found = true;
            for i = 1: numel(obj.configStrs)
                name1 = getConfigFile(CM1, obj.configStrs{i});
                name2 = getConfigFile(CM2, obj.configStrs{i});
                assert(~isempty(name1) && ~isempty(name2)); % catch an exception
                if ~isempty(name1) || ~isempty(name2)
                    found = false;
                    break;
                end
                if ~strcmp(name1, name2)
                    found = false;
                    break;
                end
            end
        end
        
        function name = getConfigFile(obj, CM, targetStr)
            index = CM.searchConfigContainTargetStr(targetStr);
            if ~isempty(index)
                name = CM.configFiles{index};
            else
                name = [];
                warning(['cannot find config file with the target str: ', targetStr]);
            end
        end
        
        function addParameter(obj, subjectID, dateOfRecording, config_manager, par)
            %% load old data
            load(obj.fileToLoad);            
            [alreadyDone, sameExpDone, ~, ~, index] = obj.queryParameters(subjectID, dateOfRecording, config_manager);
            %% append a new one or overwrite
            if alreadyDone && sameExpDone
                subject{index} = subjectID;
                date{index} = dateOfRecording;
                configMan{index} = config_manager;
                parameters{index} = par;                
            else % including already done
                subject{end+1} = subjectID;
                date{end+1} = dateOfRecording;
                configMan{end+1} = config_manager;
                parameters{end+1} = par;
            end            
            %% save all data
            save(obj.fileToLoad, 'subject', 'date', 'configMan', 'parameters');
        end
        
        function deleteParameter(obj, subjectID, dateOfRecording, config_manager)
            %% load old data
            load(obj.fileToLoad);            
            [alreadyDone, sameExpDone, ~, indexSameConfig, indexSameExp] = obj.queryParameters(subjectID, dateOfRecording, config_manager);
            %% remove if exists
            if sameExpDone
                subject(indexSameExp) = [];
                date(indexSameExp) = [];
                configMan(indexSameExp) = [];
                parameters(indexSameExp) = [];
            end            
            %% save all data
            save(obj.fileToLoad, 'subject', 'date', 'configMan', 'parameters');
        end
        
    end
end