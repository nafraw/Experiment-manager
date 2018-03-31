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
        
        function files = searchFiles(obj, idx)
            files = obj.listfile_query_by_format(obj.paths{idx}, obj.fileFormat{idx}, false);
        end
        
        function files = getFilesByIndex(obj, indices)
            nSearch = numel(indices);
            files = cell(nSearch, 1);
            for sIdx = 1: nSearch
                idx = indices(sIdx);
                files{sIdx} = obj.searchFile(idx);
            end
        end
        
        function files = getFilesByPurpose(obj, purposes)
            index = obj.getIndexByPurpose(purposes);
            files = obj.getFilesByIndex(index);
        end
        
        function files = getFilesByGeneration(obj, generatedBy)
            index = obj.getIndexByGeneration(generatedBy);
            files = obj.getFilesByIndex(index);
        end
       
        function index = getIndexByPurpose(obj, names)
            index = obj.getIndexByNameFromProperty(names, 'purpose');
        end
        
        function index = getIndexByGeneration(obj, names)
            index = obj.getIndexByNameFromProperty(names, 'generatedBy');
        end
        
        function index = getIndexByNameFromProperty(obj, names, property)
            evalc('attribute = obj.', property, ';');
            index = ismember(attribute, names);
            if numel(index) ~= numel(names)
                index_missing = ~ismember(names, attribute(index));
                error(['missing data: ', strjoin(names{index_missing})]);
            end
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

