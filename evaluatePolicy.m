function env = evaluatePolicy(env, theta)
    delta = inf;
    while delta > theta
        delta = 0;
        for i=1:env.gridRow
            for j=1:env.gridCol
                v = env.Values(i,j);
                env.Values(i,j) = bellmanUpdate(env.Values, [i,j]);
                delta = max(delta, abs(v - env.Values(i,j)));
            end
        end
    end
end