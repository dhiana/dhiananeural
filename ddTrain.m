function [net, tr] = ddTrain(net)

    % Setup dataset
    load thyroid_dataset;
    inputs = thyroidInputs;
    targets = thyroidTargets;

    % Train the Network
    [net,tr] = train(net,inputs,targets);

end
