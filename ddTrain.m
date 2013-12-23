function [net, tr] = ddTrain(net)

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
    %figure, plotperform(tr)
    %figure, plottrainstate(tr)
    %figure, plotconfusion(targets,outputs)
    %figure, plotroc(targets,outputs)
    %figure, ploterrhist(errors)

end
