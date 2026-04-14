function basetime(time,EUDef,GrDef)
[~, index] = min(abs(EUDef - 100));
basetimeEU= time(index);
fprintf('Η εποχή βάσης για την Ευρώπη είναι: %d\n', basetimeEU);
[~, indexGreece] = min(abs(GrDef - 100));
basetimeGreece = time(indexGreece);
fprintf('Η εποχή βάσης για την Ελλάδα είναι: %d\n', basetimeGreece);