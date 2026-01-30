% Features and target
featureCols = {'OP1','OP2','OP3','S2','S3','S4','S7','S11','S12','S15'};
X = data{:, featureCols};
y = data.RUL;

units = unique(data.Unit);
nTrain = round(0.8*length(units));

trainUnits = units(1:nTrain);
testUnits  = units(nTrain+1:end);

trainMask = ismember(data.Unit, trainUnits);
testMask  = ismember(data.Unit, testUnits);

XTrain = X(trainMask,:);
yTrain = y(trainMask);

XTest  = X(testMask,:);
yTest  = y(testMask);

[XTrain, mu, sigma] = zscore(XTrain);  %normalization
XTest = (XTest - mu) ./ sigma;
