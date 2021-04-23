function [env,pi] = policyIteration(env,gamma,theta)
% V = zeros(env.gridRow,env.gridCol);
pi = cell(env.gridRow,env.gridCol);
for i=1:env.gridRow
    for j=1:env.gridCol
        temp_pi = zeros(1,4);
        actions = env.Actions{i,j};
        num_actions = size(actions,2);
        for ii=1:num_actions
            action = actions(ii);
            temp_pi(1,action) = 1/num_actions;
        end
        pi(i,j) = {temp_pi};
    end
end
policyStable = false;

%%
while ~policyStable
    env = evaluatePolicy(env, theta);
    [env, policyStable, pi]= improvePolicy(env,pi,gamma);
end
end

