function [data, nameOfData] = getDataByIndex(obj, indices)
data = obj.data(indices);
nameOfData = obj.nameOfData(indices);
if numel(data) == 1 % make output non-cell when possible
    data = data{1};
    nameOfData = nameOfData{1};
end
end