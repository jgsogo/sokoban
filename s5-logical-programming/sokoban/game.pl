% sokoban\game.pl: game rules for the Sokoban puzzle
%     ... learning Prolog with SWI-Prolog
% by Javier G. Sogo


:-include(board).

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Game rules:
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Movimientos del Sokoban
push(pos1, dir, pos2) :-
              box(pos1),
              neib(pos1, pos2, dir).



%%%%%%%%%%%%%%%%%%%%%%
% Unit tests
%%%%%%%%%%%%%%%%%%%%%%
:- begin_tests(game).
:- end_tests(game).

%:- run_tests.