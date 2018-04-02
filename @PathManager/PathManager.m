classdef PathManager < handle
    %% Path manager
    % A class to manager data path (e.g. handle those processed files and
    % store information how to find them.
    %% Version Info
    % Author: Ping-Keng Jao
    % email: ping-keng.jao@epfl.ch
    % 31/03/2018: First version.
    properties (SetAccess = private, GetAccess = public)
        paths
        fileFormat
        purpose
        generatedBy
        delimiter
    end
    
    methods (Access = public)
        function obj = PathManager()
            obj.paths = {};
            obj.fileFormat = {};
            obj.purpose = {};
            obj.generatedBy = {};
            obj.delimiter = '_';
        end
        
        function obj = setDelimiter(obj, delimiter)
            obj.delimiter = delimiter;
        end
            
        function files = findTargetStrings(obj, files, targetStr)
            % can be used to capture the specified subjects for example
            if iscell(targetStr)
                hasTarget = cellfun(@(x) contains(files, x), targetStr, 'uniformoutput', false);
                hasTarget = cat(2, hasTarget{:});
                hasTarget = sum(hasTarget, 2);
                if sum(hasTarget > 1)
                    warning('At least a file has been selected twice');
                end
                hasTarget = hasTarget > 0;
                assert(numel(hasTarget) <= numel(files));
            else
                hasTarget = contains(files, targetStr);
            end
            files = files(hasTarget);
        end
        
        function files = searchFiles(obj, idx)
            files = obj.listfile_query_by_format(obj.paths{idx}, obj.fileFormat{idx}, false);
        end
        
        function files = getFilesByIndex(obj, indices, substring)
            nSearch = numel(indices);
            files = cell(nSearch, 1);
            for sIdx = 1: nSearch
                idx = indices(sIdx);
                files{sIdx} = obj.searchFiles(idx);
                files{sIdx} = obj.findTargetStrings(files{sIdx}, substring);
            end
            if nSearch == 1
                files = files{1}; % avoid nested cells when not necessary
            end               
        end
        
        function files = getFilesByPurpose(obj, purposes, substring)
            if nargin < 3
                substring = '';
            end
            index = obj.getIndexByPurpose(purposes);
            files = obj.getFilesByIndex(index, substring);
        end
        
        function files = getFilesByGeneration(obj, generatedBy, substring)
            if nargin < 3
                substring = '';
            end
            index = obj.getIndexByGeneration(generatedBy);
            files = obj.getFilesByIndex(index, substring);
        end
       
        function index = getIndexByPurpose(obj, names)
            index = obj.getIndexByNameFromProperty(names, 'purpose');
        end
        
        function index = getIndexByGeneration(obj, names)
            index = obj.getIndexByNameFromProperty(names, 'generatedBy');
        end
        
        function index = getIndexByNameFromProperty(obj, names, property)
            evalc(['attribute = obj.', property, ';']);
            index = ismember(attribute, names);
            if iscell(names)
                nName = numel(names);
            else
                nName = size(names, 1);
            end
            if sum(index) ~= nName
                index_missing = ~ismember(names, attribute(index));
                error(['missing data: ', strjoin(names{index_missing})]);
            end
            index = find(index);
        end
        
        function obj = addPath(obj, path, format, purpose, saveScriptName)
            obj.paths{end+1} = path;
            obj.fileFormat{end+1} = format;
            obj.purpose{end+1} = purpose;
            if saveScriptName
                callStack = dbstack;
                obj.generatedBy{end+1} = callStack(2).file;
            else
                obj.generatedBy{end+1} = '';
            end
        end
    end
    
end

