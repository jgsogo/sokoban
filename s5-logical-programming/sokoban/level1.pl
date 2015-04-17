% sokoban\level1.pl: puzzle#1
%     ... learning Prolog with SWI-Prolog
% by Javier G. Sogo


%:-include(board).

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Define level 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 3x3 Board
top(x1y3,x1y2).
top(x1y2,x1y1).
top(x2y3,x2y2).
top(x2y2,x2y1).
top(x3y3,x3y2).
top(x3y2,x3y1).

right(x1y3, x2y3).
right(x2y3, x3y3).
right(x1y2, x2y2).
right(x2y2, x3y2).
right(x1y1, x2y1).
right(x2y1, x3y1).

% 2 boxes
box(x2y2).
box(x3y2).

% solution
solution(x2y1).
solution(x3y1).

% sokoban
sokoban(x1y1).


% Initial state assertion
initial_state(sokoban, state(x1y1, [x2y2, x3y3])). 

% Final state
final_state(sokoban, state(_Sokoban, [x2y1, x3y1])).
