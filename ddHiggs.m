load higgs_dataset;

inputs = higgs_norm_input;
targets = higgs_target;

trainFcn = 'trainlm';

for i=10:20

    train_session = strcat(trainFcn,'_',num2str(i));
        hiddenLayerSize = 10;
        net = fitnet(hiddenLayerSize);
        net = ddSetupNet(hiddenLayerSize, trainFcn, 'regression');
        net.trainParam.max_fail = 50;
        nets = ddJob(train_session, net, inputs, targets);

end

exit;
