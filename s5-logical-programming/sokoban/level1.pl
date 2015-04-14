% sokoban\level1.pl: puzzle#1
%     ... learning Prolog with SWI-Prolog
% by Javier G. Sogo


%:-include(board).

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Define level#1
%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 3x3 Board
isBoard(1,1).
isBoard(1,2).
isBoard(1,3).
isBoard(2,1).
isBoard(2,2).
isBoard(2,3).
isBoard(3,1).
isBoard(3,2).
isBoard(3,3).

% 2 boxes
box(2,2).
box(3,2).

% solution
solution(2,1).
solution(3,1).

% sokoban
sokoban(1,1).
