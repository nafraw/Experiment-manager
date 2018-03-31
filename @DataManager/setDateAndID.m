function obj = setDateAndID(obj, filename)
[obj.subjectID, obj.date] = obj.getDateAndID(filename);
end