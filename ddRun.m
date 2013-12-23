function nets = ddRun()
    % Trabalho de Redes Neurais
    % Rodar 5 algoritmos de treinamento:
    % Escolhidos: traingd, traingdm, traingda, trainlm e trainbfg

    %matlabpool('open', 2)

    % Setup network topology
    hiddenLayerSize = 10;

    % Container para as redes
    nets = {};

    % Número de tentativas para uma mesma configuração
    MAX_TRIES = 3;

    % traingd
    simple_traingd_net = ddSetupNet(hiddenLayerSize, 'traingd');
    %simple_traingd_net.trainParam.epochs = 100000;
    %simple_traingd_net.trainParam.lr = 0.3;
    %simple_traingd_net.trainParam.max_fail = 50;

    simple_traingd_nets = {};
    simple_traingd_trs = {};
    for n=1:MAX_TRIES
        [simple_traingd_nets{n}, simple_traingd_trs{n}] = ddTrain(simple_traingd_net);
    end

    nets{1,1} = [simple_traingd_nets];
    nets{1,2} = [simple_traingd_trs];

    %pause
    %exit

end
