function obj = checkData(obj)
nData = numel(obj.data);
nFileName = numel(obj.filenames);
nName = numel(obj.nameOfData);
assert(nData == nFileName);
assert(nFileName == nName);
end