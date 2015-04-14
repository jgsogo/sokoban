% sokoban\game.pl: game rules for the Sokoban puzzle
%     ... learning Prolog with SWI-Prolog
% by Javier G. Sogo


%:-include(board).

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Game rules:
%%%%%%%%%%%%%%%%%%%%%%%%%%%

% All items should be placed over the board.
validPos(X, Y) :- isBoard(X, Y).

% Movimientos del Sokoban
move(




%%%%%%%%%%%%%%%%%%%%%%
% Unit tests
%%%%%%%%%%%%%%%%%%%%%%
:- begin_tests(game).
:- end_tests(game).

%:- run_tests.