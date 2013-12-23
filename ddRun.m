function nets = ddRun()
    % Trabalho de Redes Neurais
    % Rodar 5 algoritmos de treinamento:
    % Escolhidos: traingd, traingdm, traingda, trainlm e trainbfg

    % Setup dataset
    load thyroid_dataset;
    inputs = thyroidInputs;
    targets = thyroidTargets;

    % Setup network topology
    hiddenLayerSize = 10;

    % Container para as redes
    nets = {};

    % Construct train session
    train_session = 'simple_traingd';
    mkdir(train_session);

    % Go!
    trainFcn = 'traingd';
    net = ddSetupNet(hiddenLayerSize, trainFcn);
    net.trainParam.epochs = 100;
    %net.trainParam.lr = 0.3;
    %net.trainParam.max_fail = 50;

    [nets, trs] = ddTrainNets(net, inputs, targets);

    [best_net, best_tr] = ddGetBest(nets, trs);

    prefix = strcat(trainFcn, '_');
    ddPlot(best_net, best_tr, inputs, targets, prefix, train_session);

    nets = {best_net, best_tr};

    %pause
    %exit

end
