% Standardize test features using training mean & std
XTest = data{testMask, featureCols};
XTest = (XTest - mu) ./ sigma;   % mu & sigma from training
yTrue = data.RUL(testMask);
yPred = predict(rfModel, XTest);  % if RF
% or for LSTM: yPred = predict(lstmModel, XTest);
rmse = sqrt(mean((yTrue - yPred).^2));
r2 = 1 - sum((yTrue - yPred).^2)/sum((yTrue - mean(yTrue)).^2);
fprintf('Test RMSE: %.2f\n', rmse);
fprintf('Test R^2: %.2f\n', r2);
figure('Color',[0.95 0.95 0.95],'Position',[100 100 1200 800])
ax = gca;
ax.Color = 'w';
ax.GridColor = [0.8 0.8 0.8];
ax.GridAlpha = 1;
ax.LineWidth = 1.5;
ax.FontSize = 16;

scatter(yTrue, yPred, 70, 'r', 'filled')
hold on
plot([0 max(yTrue)], [0 max(yTrue)], 'b','LineWidth',3)
xlabel('Actual RUL','FontSize',18,'FontWeight','bold')
ylabel('Predicted RUL','FontSize',18,'FontWeight','bold')
title('Predicted vs Actual RUL – Test Set','FontSize',20,'FontWeight','bold')
grid on
axis tight
legend('Predicted','Perfect','Location','best','FontSize',14)

% Annotation
text(max(yTrue)*0.6, max(yTrue)*0.1, sprintf('RMSE = %.2f\nR^2 = %.2f', rmse, r2), ...
    'FontSize',14,'FontWeight','bold','BackgroundColor','w')

% Save
exportgraphics(gcf,'Test_Pred_vs_Actual_RUL.pdf','ContentType','vector')
exportgraphics(gcf,'Test_Pred_vs_Actual_RUL.png','Resolution',300)
