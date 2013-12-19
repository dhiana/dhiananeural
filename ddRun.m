% Solve a Pattern Recognition Problem with a Neural Network
%
% This script assumes these variables are defined:
%

function nets = ddRun()

    %matlabpool('open', 2)

    % Configure training functions
    trainFcns = {'trainbfg', 'traingd', 'traingdm', 'traingda', 'trainlm'};
    %trainFcns = {'trainlm', 'trainbfg'};

    % Setup network topology
    hiddenLayerSize = 10;

    % Container para as redes
    nets = {};

    %parfor n=1:length(trainFcns)
    for n=1:length(trainFcns)
        trainFcn = trainFcns{n}
        nets{n} = ddSetupNet(hiddenLayerSize, trainFcn);
        ddTrain(nets{n});
    end

    pause
    exit

end
