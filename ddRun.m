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
    train_session = 'simple_trainbfg';

        % Setup net
        trainFcn = 'trainbfg';
        net = ddSetupNet(hiddenLayerSize, trainFcn);
        net.trainParam.max_fail = 50;
        nets = ddJob(train_session, net, inputs, targets);

    % Construct train session
    train_session = 'simple_traingd';

        % Setup net
        trainFcn = 'traingd';
        net = ddSetupNet(hiddenLayerSize, trainFcn);
        net.trainParam.epochs = 10000;
        nets = ddJob(train_session, net, inputs, targets);

    % Construct train session
    train_session = 'better_traingd';

        % Setup net
        trainFcn = 'traingd';
        net = ddSetupNet(hiddenLayerSize, trainFcn);
        net.trainParam.lr = 0.3;
        net.trainParam.max_fail = 50;
        net.trainParam.epochs = 10000;
        nets = ddJob(train_session, net, inputs, targets);

    % Construct train session
    train_session = 'simple_traingda';

        % Setup net
        trainFcn = 'traingda';
        net = ddSetupNet(hiddenLayerSize, trainFcn);
        net.trainParam.epochs = 10000;
        nets = ddJob(train_session, net, inputs, targets);

    % Construct train session
    train_session = 'better_traingda';

        % Setup net
        trainFcn = 'traingda';
        net = ddSetupNet(hiddenLayerSize, trainFcn);
        net.trainParam.max_fail = 50;
        net.trainParam.epochs = 10000;
        nets = ddJob(train_session, net, inputs, targets);

    % Construct train session
    train_session = 'simple_traingdm';

        % Setup net
        trainFcn = 'traingdm';
        net = ddSetupNet(hiddenLayerSize, trainFcn);
        net.trainParam.epochs = 10000;
        nets = ddJob(train_session, net, inputs, targets);

    % Construct train session
    train_session = 'better_traingdm';

        % Setup net
        trainFcn = 'traingdm';
        net = ddSetupNet(hiddenLayerSize, trainFcn);
        net.trainParam.max_fail = 50;
        net.trainParam.epochs = 10000;
        nets = ddJob(train_session, net, inputs, targets);

    % Construct train session
    train_session = 'simple_trainlm';

        % Setup net
        trainFcn = 'trainlm';
        net = ddSetupNet(hiddenLayerSize, trainFcn);
        net.trainParam.max_fail = 50;
        nets = ddJob(train_session, net, inputs, targets);

    %pause
    %exit

end
