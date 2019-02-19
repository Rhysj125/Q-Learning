function action = qTableMaxAction(qTable,state)
    row = qTable(state,:);
    actions = find(row==max(row));
    action = actions(randi(size(actions,2)));
end