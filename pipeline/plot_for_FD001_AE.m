figure
plot(rulTrainSets{1}.RUL)
xlabel("Time")
ylabel("Remaining Useful Life")
title("RUL decay – FD001")
figure
hold on
for e = 1:5
    idx = rulTrainSets{1}.Unit == e;
    plot(trainSets{1}.Cycle(idx), rulTrainSets{1}.RUL(idx))
end
xlabel("Cycle")
ylabel("RUL")
title("RUL decay for multiple engines – FD001")
grid on
hold off
