% sokoban\board.pl: board for the Sokoban puzzle
%     ... learning Prolog with SWI-Prolog
% by Javier G. Sogo


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Board game predicates: 2D
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%  - the board is built using points in a two dimensional space
point(X, Y) :-
              integer(X),
              integer(Y).

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

%  - segments and directions
segment(point(X,Y), point(Z,W)) :- point(X,Y), point(Z,W), (X =\= Z; Y =\= W).
vertical(segment(point(X,Y1), point(X,Y2))) :- segment(point(X,Y1), point(X,Y2)).
horizontal(segment(point(X1,Y), point(X2,Y))) :- segment(point(X1,Y), point(X2,Y)).

%  - relative positions for points
%    + rules ending in underscore do not force adjacency.
top_(point(X,Y), point(X,W)) :- 
              Y>W, 
              vertical(segment(point(X,Y), point(X,W))).
bottom_(X,Y) :- top_(Y,X).
right_(point(X,Y), point(Z,Y)) :- 
              X>Z, 
              horizontal(segment(point(X,Y), point(Z,Y))).
left_(X,Y) :- right_(Y,X).
%    + adjacent positions
top(point(X,Y), point(X,W)) :-
              (Y-W)=:=1, 
              top_(point(X,Y), point(X,W)).
bottom(X,Y) :- top(Y,X).
right(point(X,Y), point(Z,Y)) :- 
              (X-Z)=:=1, 
              right_(point(X,Y), point(Z,Y)).
left(X,Y) :- right(Y,X).


% Neighbourhood
neib(P1, P2, up) :- top(P1, P2).
neib(P1, P2, down) :- bottom(P1, P2).
neib(P1, P2, right) :- right(P1, P2).
neib(P1, P2, left) :- left(P1, P2).


%%%%%%%%%%%%%%%%%%%%%%
% Unit tests
%%%%%%%%%%%%%%%%%%%%%%
:- begin_tests(board).
              % Point
              test(point) :- point(3,0).
              test(point) :- point(-1,2).
              test(point, [fail]) :- point(2,x).
              test(point, [fail]) :- point(_,0.1).
              test(point, [fail]) :- point(0.1,_).
              
              % Segment
              test(segment) :- segment(point(1,1), point(1,2)).
              test(segment, [fail]) :- segment(point(1,1), point(1,1)).
              test(segment, [fail]) :- segment(point(X,Y), point(X,Y)).
              
              test(vertical) :- vertical(segment(point(1,2), point(1,4))).
              test(vertical, [fail]) :- vertical(segment(point(1,2), point(2,4))).
              test(vertical, [fail]) :- vertical(segment(point(_,Y), point(_,Y))). % If Y coordinate is constant, it cannot be vertical.

              test(horizontal) :- horizontal(segment(point(2,1), point(4,1))).
              test(horizontal, [fail]) :- horizontal(segment(point(1,2), point(2,4))).
              test(horizontal, [fail]) :- horizontal(segment(point(X,_), point(X,_))). % If X coordinate is constant, it cannot be horizontal.
              
              % Directions
              test(opposite) :- opposite_dir(up, X), X==down, opposite_dir(X, up).
              test(opposite) :- opposite_dir(right, X), X==left, opposite_dir(X, right).
              test(opposite, [fail]) :- opposite_dir(up, X), direction(X), \+ X==down.
              test(opposite, [fail]) :- opposite_dir(down, X), direction(X), \+ X==up.
              test(opposite, [fail]) :- opposite_dir(left, X), direction(X), \+ X==right.
              test(opposite, [fail]) :- opposite_dir(right, X), direction(X), \+ X==left.
              
              % top: absolute and adjacency
              test(top_) :- top_(point(1,2), point(1,1)).
              test(top_) :- top_(point(1,3), point(1,1)).
              test(top_, [fail]) :- top_(point(1,3), point(1,4)).
              test(top_, [fail]) :- top_(point(1,3), point(1,5)).
              test(top_, [fail]) :- top_(point(1,3), point(0,1)).
              
              test(top) :- top(point(1,3), point(1,2)).
              test(top, [fail]) :- top(point(1,3), point(1,1)).
              test(top, [fail]) :- top(point(1,3), point(0,2)).
              
              % right: absolute and adjacency
              test(right_) :- right_(point(5,2), point(1,2)).
              test(right_) :- right_(point(5,2), point(4,2)).
              test(right_, [fail]) :- right_(point(5,2), point(6,2)).
              test(right_, [fail]) :- right_(point(5,2), point(7,2)).
              test(right_, [fail]) :- right_(point(5,2), point(4,1)).
              
              test(right) :- right(point(5,2), point(4,2)).
              test(right, [fail]) :- right(point(5,2), point(6,2)).
              test(right, [fail]) :- right(point(5,2), point(4,3)).
              
              % neighbourhood
              test(neib_up) :- neib(point(2,2), point(2,1), up).
              test(neib_up, [fail]) :- neib(point(2,2), point(2,1), X), \+ X==up.
              test(neib_down) :- neib(point(2,1), point(2,2), down).
              test(neib_down, [fail]) :- neib(point(2,1), point(2,2), X), \+ X==down.
              test(neib_right) :- neib(point(2,2), point(1,2), right).
              test(neib_right, [fail]) :- neib(point(2,2), point(1,2), X), \+ X==right.
              test(neib_left) :- neib(point(2,2), point(3,2), left).
              test(neib_left, [fail]) :- neib(point(2,2), point(3,2), X), \+ X==left.
:- end_tests(board).

%:- run_tests.
