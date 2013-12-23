function ddPlot(net, tr, inputs, targets, prefix)

    % Test the Network
    outputs = net(inputs);
    errors = gsubtract(targets,outputs);
    performance = perform(net,targets,outputs);

    % Plots
    f1 = figure;
    plotperform(tr);
    filename = strcat(prefix, 'perform');
    print(f1, '-dpng', filename);
    
    f2 = figure;
    plottrainstate(tr);
    filename = strcat(prefix, 'trainstate');
    print(f2, '-dpng', filename);
    
    f3 = figure;
    plotconfusion(targets,outputs);
    filename = strcat(prefix, 'confusion');
    print(f3, '-dpng', filename);
    
    f4 = figure;
    plotroc(targets,outputs);
    filename = strcat(prefix, 'roc');
    print(f4, '-dpng', filename);

    %figure, ploterrhist(errors)

end
