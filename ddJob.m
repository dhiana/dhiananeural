function nets = ddJob(train_session, net, inputs, targets)

    mkdir(train_session);

    [nets, trs] = ddTrainNets(net, inputs, targets);

    [best_net, best_tr] = ddGetBest(nets, trs, train_session);

    ddPlot(best_net, best_tr, inputs, targets, train_session);

    filename = strcat('./',train_session,'/','traindata');
    save(filename,'nets','trs','best_net','best_tr');

end
