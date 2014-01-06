function r = ddRunRelAnal(net, tr, i)

    load higgs_dataset;
    inputs = higgs_norm_input;
    targets = higgs_target;

    outputs = net(inputs);

    nDim = size(inputs, 1);

    val_len = length(tr.valInd);
    val_data = zeros(nDim,val_len);
    for i=1:val_len
        val_data(:,i) = inputs(:,tr.valInd(i));
    end

    mtrn = zeros(1,nDim);

    r = ddRelevance(net, val_data, mtrn);

    f1 = figure;
    bar(r');
    legend('for jet1', 'for jet 2','location', 'NorthEast');
    title('Relevance Analysis');
    label = {'j1rE', 'j1rEt', 'j1rPt', 'j1rEta', 'j1rPhi', 'j1rM', 'j1rMt', 'j1rSumPtTrk', 'j1rWidth', 'j2rE', 'j2rEt', 'j2rPt', 'j2rEta', 'j2rPhi', 'j2rM', 'j2rMt', 'j2rSumPtTrk', 'j2rWidth'};
    xticklabel_rotate([1:length(label)],90,label,'fontsize',15);
    print(f1, '-dpng', '-r72', strcat('relevance_plot_',num2str(i)));

end
