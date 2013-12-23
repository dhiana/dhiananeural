function nets = ddJob(train_session, net, inputs, targets)

    mkdir(train_session);

    [nets, trs] = ddTrainNets(net, inputs, targets);
    [best_net, best_tr] = ddGetBest(nets, trs);

    ddPlot(best_net, best_tr, inputs, targets, train_session);

end
