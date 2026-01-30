numTrees = 200;

rfModel = TreeBagger(numTrees, XTrain, yTrain, ...
    'Method','regression', ...
    'OOBPrediction','on', ...
    'MinLeafSize',5);

% Optional: plot out-of-bag error
figure
plot(oobError(rfModel))
xlabel('Number of Trees')
ylabel('OOB RMSE')
title('Random Forest Out-of-Bag Error')
yPred = predict(rfModel, XTest);