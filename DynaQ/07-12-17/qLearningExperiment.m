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

    transitionModel = zeros(11,4,2);
    rewardModel = zeros(11,4);
    
    transitionModel(:,:,:) = 0.0001;
    
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
    for tidx = 1:trialsNumOf
        stepCounts = qLearningTrial();
        trialStepCounts = [trialStepCounts; stepCounts];
        fprintf('Trial %d completed.\n',tidx);
    end
    qLearningPlot(trialStepCounts);
end

