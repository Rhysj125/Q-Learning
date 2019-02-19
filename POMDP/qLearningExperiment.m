function trialStepCounts = qLearningExperiment()
    clc;
    clear all;
    close all;
    global trialsNumOf;
    global episodesPerTrial;
    global criticalEpisodes;
    
    global statesNumOf;
    global actionsNumOf;
    global goalState;
    
    global discountRate;
    global learningRate;
    global explorationRate; 
    
    global observationNumOf;
    global observationPairsNumOf;
    
    observationNumOf = 6;
    observationPairsNumOf = 36;
    trialsNumOf = 50;
    episodesPerTrial = 200;
    criticalEpisodes = [1 2 5 10 15 20 30 50 75 100 150 200];
    
    statesNumOf = 11;
    actionsNumOf = 4;
    goalState = 2;
    
    discountRate = 0.9; % gamma
    learningRate = 0.2; % alpha
    explorationRate = 0.1; % epsilon
        
    trialStepCounts = [];
    trialStepCountsPOMDP = [];
    for tidx = 1:trialsNumOf
        [stepCounts stepCountsPOMDP] = qLearningTrial();
        trialStepCounts = [trialStepCounts; stepCounts];
        trialStepCountsPOMDP = [trialStepCountsPOMDP; stepCountsPOMDP];
        fprintf('Trial %d completed.\n',tidx);
    end
    qLearningPlot(trialStepCounts);
    qLearningPlotPOMDP(trialStepCountsPOMDP);
    
    h = [];
    p = [];
    stats = [];
    
    for c = 1:length(criticalEpisodes)
        [h(c),p(c),ci, stats] = ttest2(trialStepCounts(:, criticalEpisodes(c)),trialStepCountsPOMDP(:, criticalEpisodes(c)));
    end
end

