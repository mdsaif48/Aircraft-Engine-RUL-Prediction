[trainSets, testSets, rulSets] = loadDataAE();

function rulTable = computeRUL(data)

units = unique(data.Unit);
rul = zeros(height(data),1);

for i = 1:length(units)
    idx = data.Unit == units(i);
    maxCycle = max(data.Cycle(idx));
    rul(idx) = maxCycle - data.Cycle(idx);
end

rulTable = table(data.Unit, rul, 'VariableNames', {'Unit','RUL'});
end
rulTrainSets = cell(1,4);
for i = 1:4
    rulTrainSets{i} = computeRUL(trainSets{i});
end

