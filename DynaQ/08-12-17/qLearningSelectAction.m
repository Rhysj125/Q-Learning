function action = qLearningSelectAction(qTable,state)
    global actionsNumOf;
    global explorationRate;
    
    if rand() < explorationRate
        action = randi(actionsNumOf);
        %fprintf('Exploration action %d\n',action);
    else
        action = qTableMaxAction(qTable,state);
        %fprintf('Exploitation action %d\n',action);
    end
end