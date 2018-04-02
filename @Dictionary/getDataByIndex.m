function [data, nameOfData] = getDataByIndex(obj, indices)
data = obj.data(indices);
nameOfData = obj.nameOfData(indices);
end