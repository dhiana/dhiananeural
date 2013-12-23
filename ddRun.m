function nets = ddRun()

    %matlabpool('open', 2)

    % Configure training functions
    trainFcns = {'traingd', 'traingdm', 'traingda', 'trainlm', 'trainbfg'};

    % Setup network topology
    hiddenLayerSize = 10;

    % Container para as redes
    nets = {};

    %parfor n=1:length(trainFcns)
    for n=1:length(trainFcns)
        trainFcn = trainFcns{n}
        nets{n} = ddSetupNet(hiddenLayerSize, trainFcn);
        nets{n} = ddTrain(nets{n});
    end

    pause
    exit

end
