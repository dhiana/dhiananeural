function ddPlot(net, tr, inputs, targets, train_session)

    % Test the Network
    outputs = net(inputs);
    errors = gsubtract(targets,outputs);
    performance = perform(net,targets,outputs);

    print_prefix = strcat(train_session, '/');

    % Plots
    f1 = figure;
    plotperform(tr);
    filename = strcat(print_prefix, 'perform');
    print(f1, '-dpng', '-r72', filename);

    f2 = figure;
    plottrainstate(tr);
    filename = strcat(print_prefix, 'trainstate');
    print(f2, '-dpng', '-r72', filename);

    f3 = figure;
    plotconfusion(targets,outputs);
    filename = strcat(print_prefix, 'confusion');
    print(f3, '-dpng', '-r72', filename);

    f4 = figure;
    plotroc(targets,outputs);
    filename = strcat(print_prefix, 'roc');
    print(f4, '-dpng', '-r72', filename);

    f5 = figure;
    plotregression(targets,outputs)
    filename = strcat(print_prefix, 'regression');
    print(f5, '-dpng', '-r72', filename);

end
