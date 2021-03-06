function [env,pi] = greedifyPolicy(env, pi,state,gamma)
max = -inf;
amax = [];

%%
actions = env.Actions{state(1),state(2)};
num_actions = size(actions,2);
for i=1:num_actions
    sum2 = 0;
    action = actions(i);
    ns = nextState(state, action);
    p = 1;        %p(ns|state,action)
    Vns = env.Values(ns(1),ns(2));
    sum2 = sum2 + p*(env.reward + gamma*Vns);
    if sum2>max
        amax = [];
        max = sum2;
        amax = [action];
    elseif sum2==max
        amax = [amax,action];
    end
end

%%
num_amax = size(amax,2);
temp_pi = zeros(1,4);
for ii=1:num_amax
    amax_action = amax(ii);
    temp_pi(1,amax_action) = 1/num_amax;
end
pi(state(1),state(2)) = {temp_pi};
env.Actions(state(1),state(2)) = {amax};
end

