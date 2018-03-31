data = {1*ones(10, 10, 100), 2*ones(10, 10, 100), 3*ones(10, 10, 100)};
dataName = {'one', 'two', 'three'};
filenames = 'sid_date_testfile';

dm1 = DataManager(3, true);
dm1.addData(data, dataName, [1, 2, 3], filenames);
dm1.removeDataByIndex(2);
dm1.getDataByIndex(1:2);
dm1.addDataToLast(data, dataName);
dm1.setDateAndID(filenames);

dm2 = DataManager();
dm2.addDataToLast(data, dataName);
dm2.setDateAndID(filenames);