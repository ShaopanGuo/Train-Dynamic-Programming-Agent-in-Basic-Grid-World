function [env,policyStable,pi]= improvePolicy(env,pi,gamma)
policyStable = true;
for i=1:env.gridRow
    for j=1:env.gridCol
        old = pi{i,j};
        [env, pi] = greedifyPolicy(env,pi,[i,j],gamma);
        
        if ~isequal(pi{i,j}, old)
            policyStable = false;
        end
    end
end
end

