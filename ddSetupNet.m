% Solve a Pattern Recognition Problem with a Neural Network
%
% This script assumes these variables are defined:
%

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

    % Aumentando validation checks
    %net.trainParam.max_fail = 50;

    % Choose Plot Functions
    % For a list of all plot functions type: help nnplot
    %net.plotFcns = {'plotperform','plottrainstate','ploterrhist', ...
    %  'plotregression', 'plotfit'};
end
