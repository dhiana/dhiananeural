% Solve a Pattern Recognition Problem with a Neural Network
%
% This script assumes these variables are defined:
%

function nets = ddRun()

    % Configure training functions
    trainFcns = {'traingd', 'traingdm', 'traingda', 'trainlm', 'trainbfg'};
    %trainFcns = {'trainlm', 'trainbfg'};

    % Setup network topology
    hiddenLayerSize = 10;

    % Container para as redes
    nets = {};

    for n=1:length(trainFcns)
        trainFcn = trainFcns{n}
        nets{n} = ddSetupNet(hiddenLayerSize, trainFcn);
        ddTrain(nets{n});
    end

    pause
    exit

end

function net = ddSetupNet(hiddenLayerSize, trainFcn)

    % Create a Pattern Recognition Network
    net = patternnet(hiddenLayerSize);

    % Choose Input and Output Pre/Post-Processing Functions
    % For a list of all processing functions type: help nnprocess
    net.inputs{1}.processFcns = {'removeconstantrows','mapminmax'};
    net.outputs{2}.processFcns = {'removeconstantrows','mapminmax'};

    % Setup Division of Data for Training, Validation, Testing
    % For a list of all data division functions type: help nndivide
    net.divideFcn = 'dividerand';  % Divide data randomly
    net.divideMode = 'sample';  % Divide up every sample
    net.divideParam.trainRatio = 65/100;
    net.divideParam.valRatio = 20/100;
    net.divideParam.testRatio = 15/100;

    % For help on training function 'trainscg' type: help trainscg
    % For a list of all training functions type: help nntrain
    net.trainFcn = trainFcn;

    % Choose a Performance Function
    % For a list of all performance functions type: help nnperformance
    net.performFcn = 'mse';  % Mean squared error

    % Aumentando o número de epochs para gd e gdm convergirem
    %net.trainParam.epochs = 100000;

    % Choose Plot Functions
    % For a list of all plot functions type: help nnplot
    %net.plotFcns = {'plotperform','plottrainstate','ploterrhist', ...
    %  'plotregression', 'plotfit'};

end

function net = ddTrain(net)

    % Setup dataset
    load thyroid_dataset;
    inputs = thyroidInputs;
    targets = thyroidTargets;

    % Train the Network
    [net,tr] = train(net,inputs,targets);

    % Test the Network
    outputs = net(inputs);
    errors = gsubtract(targets,outputs);
    performance = perform(net,targets,outputs)

    % Recalculate Training, Validation and Test Performance
    trainTargets = targets .* tr.trainMask{1};
    valTargets = targets  .* tr.valMask{1};
    testTargets = targets  .* tr.testMask{1};
    trainPerformance = perform(net,trainTargets,outputs)
    valPerformance = perform(net,valTargets,outputs)
    testPerformance = perform(net,testTargets,outputs)

    % View the Network
    %view(net)

    % Plots
    figure, plotperform(tr)
    figure, plottrainstate(tr)
    figure, plotconfusion(targets,outputs)
    figure, plotroc(targets,outputs)
    %figure, ploterrhist(errors)

end
