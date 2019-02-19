function [episodesSteps, dynaEpisodeSteps] = qLearningTrial()
% runs the given number of episodes and returns the episode lengths
    global episodesPerTrial;
    global transitionModel;
    global rewardModel;
    
    qTable = qTableInit();
    qTableDyna = qTableInit();
    transitionModel = zeros(11,4);
    rewardModel = zeros(11,4);
    
    episodesSteps = [];
    dynaEpisodeSteps = [];
    for eidx = 1:episodesPerTrial
        [stepsNumOf, qTable] = qLearningEpisode(qTable);
        [dynaSteps, qTableDyna] = qLearningDyna(qTableDyna);
        episodesSteps = [episodesSteps stepsNumOf];
        dynaEpisodeSteps = [dynaEpisodeSteps dynaSteps];
    end
end