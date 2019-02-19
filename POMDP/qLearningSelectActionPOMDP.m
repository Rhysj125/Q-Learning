function action = qLearningSelectActionPOMDP(qTable,observation)
    global actionsNumOf;
    global explorationRate;
    
    row = observationRow(observation);
    
    if rand() < explorationRate
        action = randi(actionsNumOf);
        %fprintf('Exploration action %d\n',action);
    else
        action = qTableMaxAction(qTable,row);
        %fprintf('Exploitation action %d\n',action);
    end
end