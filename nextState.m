function ns = nextState(state, action)
specialState = [2, 4];
specialJump = [4, 4];
ns = zeros(1, 2);

switch action
    case 1
        ns(1) = state(1) - 1;
        ns(2) = state(2);
    case 2
        if isequal(state, specialState)
            ns = specialJump;
        else
            ns(1) = state(1) + 1;
            ns(2) = state(2);
        end
    case 3 
        ns(1) = state(1);
        ns(2) = state(2) + 1;
    case 4
         ns(1) = state(1);
         ns(2) = state(2) - 1;
end
end