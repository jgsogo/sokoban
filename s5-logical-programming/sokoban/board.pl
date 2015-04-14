% sokoban\board.pl: board for the Sokoban puzzle
%     ... learning Prolog with SWI-Prolog
% by Javier G. Sogo


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Board game predicates: 2D
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%  - directions: up, down, left, right
direction(up).
direction(down).
direction(left).
direction(right).
direction(cenit).

%  - opposite directions
opposite_dir(up, down).
opposite_dir(down, up).
opposite_dir(left, right).
opposite_dir(right, left).

% Neighbourhood
neib(P1, P2, up) :- top(P1, P2).
neib(P1, P2, down) :- top(P2, P1).
neib(P1, P2, right) :- right(P1, P2).
neib(P1, P2, left) :- right(P2, P1).

%bottom(P1, P2) :- top(P2, P1).
%left(P1, P2) :- right(P2, P1).

% Corners
corner(X) :- \+ noncorner(X).
noncorner(X) :- top(_,X),top(X,_).
noncorner(X) :- right(_,X),right(X,_).


%%%%%%%%%%%%%%%%%%%%%%
% Unit tests
%%%%%%%%%%%%%%%%%%%%%%
:- begin_tests(board).                         
              %test(bottom) :- top(x1y3, x1y2), bottom(x1y2, x1y3).
:- end_tests(board).

%:- run_tests.
