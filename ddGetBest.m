function [net, tr] = getBest(nets, trs)

    perfs = [];

    for i=1:length(nets)
        this_best_perf = trs{i}.best_perf;
        perfs = [perfs this_best_perf];
    end

    [best_perf, i] = min(perfs);

    net = nets{i};
    tr = trs{i};

end
