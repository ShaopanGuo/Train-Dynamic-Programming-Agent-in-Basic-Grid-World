classdef gridWorld
    % This class is defined for Example 9.2 of EE7560
    properties
        gridRow
        gridCol
        
        reward
        
        terminalState
        
        specialState
        specialJump
        
%         obstacles
        obstacle1
        obstacle2
        obstacle3
        obstacle4
        
        Values
        
        Actions
    end
    
    methods
        function obj = gridWorld(gridRow,gridCol,reward,...
                terminalState,specialState,specialJump,obstacles,Values)
            obj.gridRow = int8(gridRow);
            obj.gridCol = int8(gridCol);
            obj.reward = double(reward);
            obj.terminalState = terminalState;
            obj.specialState = specialState;
            obj.specialJump = specialJump;
            obj.obstacle1 = obstacles(1,:);
            obj.obstacle2 = obstacles(2,:);
            obj.obstacle3 = obstacles(3,:);
            obj.obstacle4 = obstacles(4,:);
            obj.Values = Values;
            obj.Actions = cell(gridRow,gridCol);
            for i=1:gridRow
                for j=1:gridCol
                    obj.Actions(i,j) = {initActions([i,j])};
                end
            end
        end
        
        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
    end
end

