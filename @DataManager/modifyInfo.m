function obj = modifyInfo(obj, index, newInfo)
warning(['overwriting old info: ', obj.additionalInfo(index), ', by: ', newInfo]);
obj.additionalInfo(index) = newInfo;
obj.saveAccessTime();
end