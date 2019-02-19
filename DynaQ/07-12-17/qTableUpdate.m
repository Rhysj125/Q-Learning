function qTable = qTableUpdate(qTable,state,action,reward,nextState)
    global discountRate;
    global learningRate
    
    nextActionMax = qTableMaxAction(qTable,nextState);
    qValDiff = reward+discountRate*qTable(nextState,nextActionMax)-qTable(state,action);
    qTable(state,action) = qTable(state,action)+learningRate*qValDiff;
end