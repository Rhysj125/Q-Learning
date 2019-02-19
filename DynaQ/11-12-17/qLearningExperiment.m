function trialStepCounts = qLearningExperiment()
    global trialsNumOf;
    global episodesPerTrial;
    global criticalEpisodes;
    
    global statesNumOf;
    global actionsNumOf;
    global goalState;
    
    global discountRate;
    global learningRate;
    global explorationRate; 
    
    global rewardModel;
    global transitionModel;

    transitionModel = zeros(11,4);
    rewardModel = zeros(11,4);
    
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
    dynaTrialStepCounts = [];
    for tidx = 1:trialsNumOf
        [stepCounts, dynaStepCount] = qLearningTrial();
        trialStepCounts = [trialStepCounts; stepCounts];
        dynaTrialStepCounts = [dynaTrialStepCounts; dynaStepCount];
        fprintf('Trial %d completed.\n',tidx);
    end
    qLearningPlot(trialStepCounts);
    qLearningDynaPlot(dynaTrialStepCounts);
    
    for c = 1:length(criticalEpisodes)
        [h(c),p(c),ci, stats] = ttest2(trialStepCounts(:,criticalEpisodes(c)),dynaTrialStepCounts(:,criticalEpisodes(c)));
    end
    
    disp(h);
    disp(p);
end