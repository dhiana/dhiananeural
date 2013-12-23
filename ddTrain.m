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

    % Plots
    %figure, plotperform(tr)
    %figure, plottrainstate(tr)
    %figure, plotconfusion(targets,outputs)
    %figure, plotroc(targets,outputs)
    %figure, ploterrhist(errors)

end
