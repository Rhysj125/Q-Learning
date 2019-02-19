function [episodesSteps, episodesStepsPOMDP] = qLearningTrial()
% runs the given number of episodes and returns the episode lengths
    global episodesPerTrial;
    
    %qTablePOMDP = observationQTable();
    qTablePOMDP = qTablePOMDPMemory();
    qTable = qTableInit();
    episodesSteps = [];
    episodesStepsPOMDP = [];
    for eidx = 1:episodesPerTrial
        [stepsNumOf, qTable] = qLearningEpisode(qTable);
        [stepsNumOfPOMDP, qTablePOMDP] = qLearningEpisodePOMDPMemory(qTablePOMDP);
        episodesSteps = [episodesSteps stepsNumOf];
        episodesStepsPOMDP = [episodesStepsPOMDP stepsNumOfPOMDP];
    end
end
