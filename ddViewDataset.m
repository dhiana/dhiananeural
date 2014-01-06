load higgs_dataset;

inputs = higgs_norm_input;
targets = higgs_target;

f1 = figure;
hist(higgs_target',30);
title('Target histogram');
print(f1, '-dpng', '-r72', 'output_hist');

exit;
