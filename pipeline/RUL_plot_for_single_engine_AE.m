figure('Color',[0.95 0.95 0.95],'Position',[120 120 1200 600])  
ax = gca;
ax.Color = 'w';  % white axes/grid background
ax.GridColor = [0.8 0.8 0.8];  % light gray grid
ax.GridAlpha = 1;
ax.LineWidth = 1.5;
ax.FontSize = 16;

plot(yTrue_unit,'-o','Color',[0 0 1],'LineWidth',3,'MarkerSize',6,'MarkerFaceColor',[0 0 1])
hold on
plot(yPred_unit,'--s','Color',[1 0 0],'LineWidth',3,'MarkerSize',6,'MarkerFaceColor',[1 0 0]) 
xlabel('Cycle', 'FontSize',18,'FontWeight','bold')
ylabel('RUL', 'FontSize',18,'FontWeight','bold')
title(['RUL Prediction – Engine ', num2str(exampleUnit)], 'FontSize',20,'FontWeight','bold')
grid on
legend('Actual RUL','Predicted RUL','Location','best','FontSize',14)

% Annotate RMSE & R^2
text(max(yTrue_unit)*0.6, max(yTrue_unit)*0.1, ...
    sprintf('RMSE = %.2f\nR^2 = %.2f', rmse, r2), ...
    'FontSize',14,'FontWeight','bold','BackgroundColor','w')

% Save high-res vector
exportgraphics(gcf,'RUL_Decay_Engine1.pdf','ContentType','vector')
exportgraphics(gcf,'RUL_Decay_Engine1.png','Resolution',300)

