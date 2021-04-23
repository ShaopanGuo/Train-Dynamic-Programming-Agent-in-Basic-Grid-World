%% Homework 9
% Calculate the value functions all states in Example 9.2 in the lecture 
% notes by assuming all actions with the same probability.

clear; clc; close all;
addpath('./libGrid')

%% Basic Properties

% The grid world is 5-by-5 and bounded by borders
gridRow = 5;
gridCol = 5;

% Four possible actions 
% North = 1, South = 2, East = 3, West = 4
% All actions have the same probability.
actions = [1, 2, 3, 4];

% initialState = [2, 1];       % The agent begins from cell [2,1].
terminalState = [5, 5];        % The terminal state at cell [5,5].

% The environment contains a special jump from cell [2,4] to cell [4,4]
% with a reward of +5.
specialState = [2, 4];
specialJump = [4, 4];
specialReward = 5;

% All other actions result in –1 reward.
reward = -1;

% The agent is blocked by obstacles (black cells).
obstacle1 = [3,3];
obstacle2 = [3,4];
obstacle3 = [3,5];
obstacle4 = [4,3];
obstacles = [obstacle1; obstacle2; obstacle3; obstacle4];

%% Step 1: Policy Evaluation

% Initialize rewards
Values = zeros(gridRow, gridCol);
Values(terminalState(1),terminalState(2)) = 10;
Values(obstacle1(1),obstacle1(2)) = -inf;
Values(obstacle2(1),obstacle2(2)) = -inf;
Values(obstacle3(1),obstacle3(2)) = -inf;
Values(obstacle4(1),obstacle4(2)) = -inf;

% gridWorld = gridWorld(gridRow,gridCol,actions,reward,...
%                 terminalState,specialState,specialJump,obstacles,Values);
gridWorld = gridWorld(gridRow,gridCol,reward,...
                terminalState,specialState,specialJump,obstacles,Values);


theta = 0.0001;
gridWorld = evaluatePolicy(gridWorld, theta);

%% Step 2: Policy Iteration

