classdef ExperimentManager < handle
    %UNTITLED25 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (SetAccess = private, GetAccess = public)
        ConfigManager
        PathManager        
    end
    
    methods
        function obj = ExperimentManager(varargin)
            if nargin < 1
                cfgMgr = [];
                pMgr = [];
            elseif nargin < 2
                cfgMgr = varargin{1};
                pMgr = [];
            else
                cfgMgr = varargin{1};
                pMgr = varargin{2};
            end
            obj.setConfigManager(cfgMgr);
            obj.setPathManager(pMgr);
        end
       
        function obj = setConfigManager(obj, cfgMgr)
            obj.ConfigManager = cfgMgr;
        end
        function obj = setPathManager(obj, pMgr)
            obj.PathManager = pMgr;
        end
        
        function format = generateFileFormat(obj)
            obj.ConfigManager
        end
        
    end
    
end

