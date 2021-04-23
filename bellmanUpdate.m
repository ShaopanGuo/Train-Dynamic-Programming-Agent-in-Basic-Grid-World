function gridValue = bellmanUpdate(env, state)

actions = env.Actions{state(1),state(2)};
reward = -1;
gamma = 1;

if isempty(actions)
    gridValue = env.Values(state(1),state(2));
else
    gridValue = 0;
    numActions = size(actions,2);
    prob = 1/numActions;            % All actions have the same probability
    for i=1:numActions
        action = actions(i);
        ns = nextState(state, action);
        gridValue = gridValue ...
            + prob*(reward + gamma*env.Values(ns(1),ns(2)));
    end
end