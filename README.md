# Goal
This repository consists of several MATLAB classes that can be helpful to organize experiments in terms of data analysis. 
For example, trying different processing pipelines and hyperparameters. 
The repo was designed for data with subject ID (originally for EEG).

# DataManager
The DataManager collects all important variables as a single one. Similar to organize your variable as a structure. 
You only need to pass one variable to a function (including saving), so you do not need to pass many variables (which needs a lot of typing) anymore. 
This is handy when you are still developing, so input and output can be different from the initial plan.
Different from the structure, your variable name can be more flexible, e.g., with space, and also some handy functions to process the collected data.
One thing to be careful is that the class inherits from handle which means "pass-by-object" not "pass-by-reference"; the data is not protected when being processed in a function.

# ParameterManager
The ParameterManager is used to store and query parameters. For example, the setup and outcome of ICA. 
The class also stores meta-data such as the name of experiment. This can be used to avoid running the same ICA again if the setup is the same. 

# ConfigManager
The ConfigManager aims at the case that config file of data analysis can be decomposed into many different files for re-usage.
For example, Exp_A has a config for pre-processing and one config for classification. Exp_B is the same and has the same pre-processing config.
Exp_A and B can have a ConfigManager class to collect required config files. Also, one can return a config without executing all config files at once.

# PathManager
The PathManager is used to organize your paths of files. 
It stores information regarding where is the root path and how to query those files.
Therefore, when using it for your project, you can create a function that describes how you would like to organize those paths in a single file and returns this class.
Later on, you can call that function at the begin of each script that needs to access files.

# ExperimentManager
This class collects the ConfigManager and PathManager.
