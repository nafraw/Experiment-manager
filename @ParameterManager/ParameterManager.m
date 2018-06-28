classdef ParameterManager
    properties (SetAccess = private, GetAccess = public)
        subjectID            % subject of the recording
        date                      % date of the recording
        fileToLoad
    end
    
    methods (Access = public)
        function obj = ParameterManager(fileToLoad)
            assert(~isempty(fileToLoad));
            obj.fileToLoad = fileToLoad;
            obj.checkFile();
        end
        
        function checkFile(obj)
            if ~exist(obj.fileToLoad, 'file')
                subject = [];
                date = [];
                expName = [];
                parameters = [];
                save(obj.fileToLoad, 'subject', 'date', 'expName', 'parameters');
            end
        end
        
        function [alreadyDone, par, index] = queryParameters(obj, subjectID, dateOfRecording, ExpName)
            %% initialize variable
            par = [];
            %% load for already explored data
            load(obj.fileToLoad, 'subject', 'date', 'expName', 'parameters');
            %% check if already done before
            subjectMask = strcmp(subjectID, subject);
            dateMask = strcmp(dateOfRecording, date);
            expMask = strcmp(ExpName, expName);
            index = find(subjectMask & dateMask & expMask);
            assert(numel(index) <= 1); % it must be unique
            alreadyDone = ~isempty(index);
            %% get parameters
            if alreadyDone
                par = parameters{index};
            end
        end
        
        function addParameter(obj, subjectID, dateOfRecording, ExpName, par)
            %% load old data
            load(obj.fileToLoad);
            [alreadyDone, ~, index] = obj.queryParameters(subjectID, dateOfRecording, ExpName);
            %% append a new one or overwrite
            if alreadyDone
                subject{index} = subjectID;
                date{index} = dateOfRecording;
                expName{index} = ExpName;
                parameters{index} = par;
            else
                subject{end+1} = subjectID;
                date{end+1} = dateOfRecording;
                expName{end+1} = ExpName;
                parameters{end+1} = par;
            end            
            %% save all data
            save(obj.fileToLoad, 'subject', 'date', 'expName', 'parameters');
        end
        
        function deleteParameter(obj, subjectID, dateOfRecording, ExpName)
            %% load old data
            load(obj.fileToLoad);
            [alreadyDone, ~, index] = obj.queryParameters(subjectID, dateOfRecording, ExpName);
            %% append a new one or overwrite
            if alreadyDone
                subject{index} = [];
                date{index} = [];
                expName{index} = [];
                parameters{index} = [];
            end            
            %% save all data
            save(obj.fileToLoad, 'subject', 'date', 'expName', 'parameters');
        end
        
    end
end