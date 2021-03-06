function actions = possibleActions(state)
gridRows = 5;
gridCols = 5;
obstacle1 = [3,3];
obstacle2 = [3,4];
obstacle3 = [3,5];
obstacle4 = [4,3];
terminalState = [5, 5];
% specialState = [2, 4];


% terminalState_Flag = 0;
% obstacle1_Flag = 0;
% obstacle2_Flag = 0;
% obstacle3_Flag = 0;
% obstacle4_Flag = 0;
% 
% vertex1_Flag = 0;
% vertex2_Flag = 0;
% vertex3_Flag = 0;
% 
% edge1_Flag = 0;
% edge2_Flag = 0;
% edge3_Flag = 0;
% edge4_Flag = 0;
% 
% %%
% if state == terminalState
%     terminalState_Flag = 1;
% end
% 
% if state == obstacle1
%     obstacle1_Flag = 1;
% end
% 
% if state == obstacle2
%     obstacle2_Flag = 1;
% end
% 
% if state == obstacle3
%     obstacle3_Flag = 1;
% end
% 
% if state == obstacle4
%     obstacle4_Flag = 1;
% end
% 
% if state == [1, 1]
%     vertex1_Flag = 1;
% end
% 
% if state == [1, gridCols]
%     vertex2_Flag = 1;
% end
% 
% if state == [gidRows, 1]
%     vertex3_Flag = 1;
% end

actions = [];
%% 
if isequal(state,terminalState) ...
        || isequal(state,obstacle1) ...
        || isequal(state,obstacle2) ...
        || isequal(state,obstacle3) ...
        || isequal(state,obstacle4) 
    actions = [];
else
    for i=1:4
        ns = nextState(state, i);
        if isequal(ns,obstacle1) ...
                || isequal(ns,obstacle2) ...
                || isequal(ns,obstacle3) ...
                || isequal(ns,obstacle4) ...
                || ns(1) < 1 ...
                || ns(1) > 5 ...
                || ns(2) < 1 ...
                || ns(2) > 5
            actions = actions;
        else
            actions = [actions i];
        end
    end
end