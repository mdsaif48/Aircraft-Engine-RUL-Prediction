data = trainSets{1};  % your table

% Use exact column names from your table
units = unique(data.Unit);   % capital U
rul = zeros(height(data),1);

for i = 1:length(units)
    idx = data.Unit == units(i);           % engine mask
    rul(idx) = max(data.Cycle(idx)) - data.Cycle(idx); 
end

% Cap RUL
RUL_cap = 125;
rul = min(rul, RUL_cap);

% Add to table
data.RUL = rul;

% Quick sanity check
head(data)
tail(data)

