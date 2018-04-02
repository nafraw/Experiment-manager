function obj = removeDataByIndex(obj, indices)
obj.data(indices) = [];
obj.nameOfData(indices) = [];
obj.filenames(indices) = [];
if obj.checkRoutine
    obj.checkData
end
obj.saveAccessTime();
end