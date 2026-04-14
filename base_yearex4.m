function base_yearex4(years,EUDeflator,GreeceDeflator)
[~, index] = min(abs(EUDeflator - 100));
base_yearEU= years(index);
fprintf('Το έτος βάσης για την Ευρώπη είναι: %d\n', base_yearEU);
[~, indexGreece] = min(abs(GreeceDeflator - 100));
base_yearGreece = years(indexGreece);
fprintf('Το έτος βάσης για την Ελλάδα είναι: %d\n', base_yearGreece);

end