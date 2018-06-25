function obj = setDateAndID(obj, filename)
[subjectID, date] = obj.getDateAndID(filename);
obj.setID(subjectID);
obj.setDate(date);
end