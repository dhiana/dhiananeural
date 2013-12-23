function [net, tr] = getBest(nets, trs, train_session)

    perfs = [];

    for i=1:length(nets)
        this_best_perf = trs{i}.best_perf;
        perfs = [perfs this_best_perf];
    end

    [best_perf, i] = min(perfs);

    net = nets{i};
    tr = trs{i};

    % Plots nets performance histogram
    f1 = figure;
    hist(perfs);
    title('Training session performance histogram');
    filename = strcat(train_session, '/', 'nets_hist');
    print(f1, '-dpng', filename);

end
