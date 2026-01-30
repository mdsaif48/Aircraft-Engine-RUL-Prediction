
dataPath = 'C:\Users\saif\OneDrive\Documents\Desktop\MIN_PROJECT\6. Turbofan Engine Degradation Simulation Data Set\CMAPSSData';
testFile = 'test_FD001.txt';
rulFile  = 'RUL_FD001.txt';

cols = {'UnitNumber','Cycle','OP1','OP2','OP3','S1','S2','S3','S4','S5','S6','S7','S8','S9','S10','S11','S12','S13','S14','S15','S16','S17','S18','S19','S20','S21'};
data = readmatrix(fullfile(dataPath,testFile));
data = array2table(data,'VariableNames',cols);

yTrue = readmatrix(fullfile(dataPath,rulFile));  % actual RUL

% Feature columns
featureCols = 3:25;        % OP1..S21

% Ensure mu & sigma are numeric row vectors of size 1x23
muNum    = muTrain{1};     % from training, numeric array
sigmaNum = sigmaTrain{1};

% Extract test features
XTest = data{:, featureCols};    % Nx23 numeric array

% Standardize
XTest = (XTest - muNum) ./ sigmaNum;  % Nx23 - 1x23

yPredAll = predict(rfModel, XTest);  % TreeBagger output is cell of strings
yPredAll = str2double(yPredAll);

% Aggregate per engine
engines = unique(data.UnitNumber);
yPred = zeros(length(engines),1);
for j = 1:length(engines)
    idx = data.UnitNumber == engines(j);
    yPred(j) = mean(yPredAll(idx));
end


rmse = sqrt(mean((yTrue - yPred).^2));
r2   = 1 - sum((yTrue - yPred).^2)/sum((yTrue - mean(yTrue)).^2);
fprintf('Test RMSE: %.2f\n', rmse);
fprintf('Test R^2: %.2f\n', r2);

figure('Color','w','Position',[100 100 1200 800])
ax = gca;
ax.Color = 'w';
ax.GridColor = [0.8 0.8 0.8];
ax.GridAlpha = 1;
ax.LineWidth = 1.5;
ax.FontSize = 16;

scatter(yTrue, yPred, 70, 'r', 'filled'); hold on
plot([0 max(yTrue)], [0 max(yTrue)], 'b','LineWidth',3)
xlabel('Actual RUL','FontSize',18,'FontWeight','bold')
ylabel('Predicted RUL','FontSize',18,'FontWeight','bold')
title('Predicted vs Actual RUL – Test Set','FontSize',20,'FontWeight','bold')
grid on; axis tight
legend('Predicted','Perfect','Location','best','FontSize',14)

% Annotation
text(max(yTrue)*0.6, max(yTrue)*0.1, sprintf('RMSE = %.2f\nR^2 = %.2f', rmse, r2), ...
    'FontSize',14,'FontWeight','bold','BackgroundColor','w')

% Save High-Resolution Figures
exportgraphics(gcf,'Test_Pred_vs_Actual_RUL.pdf','ContentType','vector')
exportgraphics(gcf,'Test_Pred_vs_Actual_RUL.png','Resolution',300)

