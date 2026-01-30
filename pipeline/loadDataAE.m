function [trainSets, testSets, rulSets] = loadDataAE()

dataPath = "C:\Users\saif\OneDrive\Documents\Desktop\MIN_PROJECT\6. Turbofan Engine Degradation Simulation Data Set\CMAPSSData";

trainFiles = ["train_FD001.txt","train_FD002.txt","train_FD003.txt","train_FD004.txt"];
testFiles  = ["test_FD001.txt","test_FD002.txt","test_FD003.txt","test_FD004.txt"];
rulFiles   = ["RUL_FD001.txt","RUL_FD002.txt","RUL_FD003.txt","RUL_FD004.txt"];

cols = ["Unit","Cycle","OP1","OP2","OP3", ...
        "S1","S2","S3","S4","S5","S6","S7","S8","S9","S10", ...
        "S11","S12","S13","S14","S15","S16","S17","S18","S19","S20","S21"];

trainSets = cell(1,4);
testSets  = cell(1,4);
rulSets   = cell(1,4);

for i = 1:4
    train = readmatrix(fullfile(dataPath, trainFiles(i)));
    test  = readmatrix(fullfile(dataPath, testFiles(i)));
    rul   = readmatrix(fullfile(dataPath, rulFiles(i)));

   
    if size(train,2) > 26
        train(:,27:end) = [];
    end
    if size(test,2) > 26
        test(:,27:end) = [];
    end

    trainSets{i} = array2table(train,"VariableNames",cols);
    testSets{i}  = array2table(test,"VariableNames",cols);
    rulSets{i}   = rul(:);
end
end

