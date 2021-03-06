function [stepCountMeans,stepCountStds] = qLearningPlot(stepCounts)
    global episodesPerTrial;
    global criticalEpisodes;

    stepCountMeans = mean(stepCounts);
    criticalMeans = stepCountMeans(criticalEpisodes);
    disp(criticalMeans);
    stepCountStds = std(stepCounts);
    criticalStds = stepCountStds(criticalEpisodes);
    disp(criticalStds);
    figure('name','Q-Learning','NumberTitle','off');
    shadedErrorBar([1:episodesPerTrial],stepCountMeans,stepCountStds);
    xlabel('Episode number');
    ylabel('Number of steps');
    ylim([0,750]);
end