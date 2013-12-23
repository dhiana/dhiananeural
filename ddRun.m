function nets = ddRun()
    % Trabalho de Redes Neurais
    % Rodar 5 algoritmos de treinamento:
    % Escolhidos: traingd, traingdm, traingda, trainlm e trainbfg

    %matlabpool('open', 2)

    % Setup network topology
    hiddenLayerSize = 10;

    % Container para as redes
    nets = {};

    % traingd
    net = ddSetupNet(hiddenLayerSize, 'traingd');
    %simple_traingd_net.trainParam.epochs = 100000;
    %simple_traingd_net.trainParam.lr = 0.3;
    %simple_traingd_net.trainParam.max_fail = 50;

    [nets, trs] = ddTrainNets(net);


    %pause
    %exit

end
