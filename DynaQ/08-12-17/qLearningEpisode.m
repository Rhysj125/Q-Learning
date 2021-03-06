function [stepsNumof, qTable] = qLearningEpisode(qTable)
    global goalState;
    global transitionModel;
    global rewardModel;
    

    % Loop until the goal state is reached
    s = rndStartState();
    stepsNumof = 1;
    while s ~= goalState
        a = qLearningSelectAction(qTable,s);
        r = rewardMcCallum(s,a);
        ns = transitionMcCallum(s,a);
        qTable = qTableUpdate(qTable,s,a,r,ns);
        stepsNumof = stepsNumof + 1;
        transitionModel(s,a,1) = ns;
        rewardModel(s,a,1) = r;
        for i = 1: 2
            modelState = rndStartState();
            modelAction = modelSelectAction(transitionModel(:,:,1), modelState);
            modelNewState = transitionModel(modelState,modelAction,1);
            modelReward = rewardModel(s,a);
            qTable = qTableUpdate(qTable, modelState, modelAction, modelReward, modelNewState);    
        end
        s = ns;
    end
end
