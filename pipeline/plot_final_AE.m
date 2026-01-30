figure('Color',[0.95 0.95 0.95],'Position',[100 100 1200 800])  % figure background light gray
ax = gca;
ax.Color = 'w';  % grid/axes background white
ax.GridColor = [0.8 0.8 0.8];  % light gray grid lines
ax.GridAlpha = 1;  % fully visible
ax.LineWidth = 1.5;
ax.FontSize = 16;

scatter(yTest, yPred, 70, 'r', 'filled')  % red points
hold on
plot([0 max(yTest)], [0 max(yTest)], 'b','LineWidth',3)  % blue perfect line
xlabel('Actual RUL', 'FontSize',18,'FontWeight','bold')
ylabel('Predicted RUL', 'FontSize',18,'FontWeight','bold')
title('Predicted vs Actual RUL', 'FontSize',20,'FontWeight','bold')
grid on
axis tight
legend('Predicted RUL','Perfect Prediction','Location','best','FontSize',14)

% Save high-res vector
exportgraphics(gcf,'Pred_vs_Actual_RUL.pdf','ContentType','vector')
exportgraphics(gcf,'Pred_vs_Actual_RUL.png','Resolution',300)
