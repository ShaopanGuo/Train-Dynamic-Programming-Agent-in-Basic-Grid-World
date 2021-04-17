%% Homework 9
% Calculate the value functions all states in Example 9.2 in the lecture 
% notes by assuming all actions with the same probability.

clear; clc; close all;

%% Basic Properties

% The grid world is 5-by-5 and bounded by borders
gridRows = 5;
gridCols = 5;

% % Five possible actions 
% % North = 1, South = 2, East = 3, West = 4, Special Jump = 5
% % All actions have the same probability.
% actions = [1, 2, 3, 4, 5];

% Four possible actions 
% North = 1, South = 2, East = 3, West = 4
% All actions have the same probability.
actions = [1, 2, 3, 4];

% initialState = [2, 1];       % The agent begins from cell [2,1].
terminalState = [5, 5];        % The terminal state at cell [5,5].

% The environment contains a special jump from cell [2,4] to cell [4,4]
% with a reward of +5.
specialState = [2, 4];
speciaJump = [4, 4];
specialReward = 5;

% The agent is blocked by obstacles (black cells).
obstacle1 = [3,3];
obstacle2 = [3,4];
obstacle3 = [3,5];
obstacle4 = [4,3];

% All other actions result in –1 reward.
reward = -1;

%%
% Initialize rewards
gridValues = zeros(gridRows, gridCols);
gridValues(terminalState(1),terminalState(2)) = 10;
gridValues(obstacle1(1),obstacle1(2)) = -inf;
gridValues(obstacle2(1),obstacle2(2)) = -inf;
gridValues(obstacle3(1),obstacle3(2)) = -inf;
gridValues(obstacle4(1),obstacle4(2)) = -inf;

%%
theta = 0.0001;    % The paprameter determing the accuracy of extimation
delta = theta + 1;

% two-array version
tic
while delta > theta || delta == theta
    delta = 0;
    gridValues_old = gridValues;
    for i=1:gridRows
        for j=1:gridCols
            state = [i,j];
            v = gridValues(state(1),state(2));
            gridValues(state(1),state(2)) = value(gridValues_old,state);
            error = abs(v-gridValues(state(1),state(2)));
            delta = max(delta, error);
            gridValues
        end
    end
end
toc

% % in-place version
% tic
% while delta > theta || delta == theta
%     delta = 0;
% %     gridValues_old = gridValues;
%     for i=1:gridRows
%         for j=1:gridCols
%             state = [i,j];
%             v = gridValues(state(1),state(2));
%             gridValues(state(1),state(2)) = value(gridValues,state);
%             error = abs(v-gridValues(state(1),state(2)));
%             delta = max(delta, error);
%             gridValues
%         end
%     end
% end
% toc







