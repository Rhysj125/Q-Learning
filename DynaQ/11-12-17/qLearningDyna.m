function [stepsNumof, qTable] = qLearningDyna(qTable)
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
        transitionModel(s,a) = ns;
        rewardModel(s,a) = r;
        for i = 1: 50
            modelState = modelSelectState(transitionModel(:,:));
            modelAction = modelSelectAction(transitionModel(:,:), modelState);
            modelNewState = transitionModel(modelState,modelAction);
            modelReward = rewardModel(modelState,modelAction);
            qTable = qTableUpdate(qTable, modelState, modelAction, modelReward, modelNewState);
        end
        s = ns;
    end
end