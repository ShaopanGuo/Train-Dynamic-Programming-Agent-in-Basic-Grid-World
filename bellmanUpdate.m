function gridValue = bellmanUpdate(gridValues_old, state)

actions = possibleActions(state);
reward = -1;
gamma = 1;

if isempty(actions)
    gridValue = gridValues_old(state(1),state(2));
else
    gridValue = 0;
    numActions = size(actions,2);
    prob = 1/numActions;            % All actions have the same probability
    for i=1:numActions
        action = actions(i);
        ns = nextState(state, action);
        gridValue = gridValue ...
            + prob*(reward + gamma*gridValues_old(ns(1),ns(2)));
    end
end