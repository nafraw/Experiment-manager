function obj = checkData(obj)
nData = numel(obj.data);
nName = numel(obj.nameOfData);
assert(nData == nName);
end