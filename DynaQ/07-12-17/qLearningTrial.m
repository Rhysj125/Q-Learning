function [episodesSteps, qTable] = qLearningTrial()
% runs the given number of episodes and returns the episode lengths
    global episodesPerTrial;
    
    qTable = qTableInit();
    episodesSteps = [];
    for eidx = 1:episodesPerTrial
        [stepsNumOf, qTable] = qLearningEpisode(qTable);
        episodesSteps = [episodesSteps stepsNumOf];
    end
end
