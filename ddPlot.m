function ddPlot(net, tr, inputs, targets)

    % Test the Network
    outputs = net(inputs);
    errors = gsubtract(targets,outputs);
    performance = perform(net,targets,outputs)

    % Plots
    figure, plotperform(tr);
    figure, plottrainstate(tr);
    figure, plotconfusion(targets,outputs);
    figure, plotroc(targets,outputs);
    %figure, ploterrhist(errors)

end
