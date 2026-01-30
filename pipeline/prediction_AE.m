yPred = predict(rfModel, XTest);
% RMSE
rmse = sqrt(mean((yPred - yTest).^2));
disp(['Test RMSE: ', num2str(rmse)])

% R^2 Score
r2 = 1 - sum((yPred - yTest).^2)/sum((yTest - mean(yTest)).^2);
disp(['R^2 Score: ', num2str(r2)])
