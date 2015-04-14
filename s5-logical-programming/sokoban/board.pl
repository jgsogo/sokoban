% sokoban1.pl: implementation of a solver for the Sokoban puzzle
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

%  - opposite directions
opposite_dir(up, down).
opposite_dir(down, up).
opposite_dir(left, right).
opposite_dir(right, left).

%  - relative positions for points
%    + those ending in underscore means that they are in that direction, but not necesary adjacent.
top_(point(X,Y), point(Z,W)) :- 
              Y>W, 
              vertical(segment(point(X,Y), point(Z,W))).
bottom_(X,Y) :- top_(Y,X).
right_(point(X,Y), point(Z,W)) :- 
              X>Z, 
              horizontal(segment(point(X,Y), point(Z,W))).
left_(X,Y) :- right_(Y,X).
%    + adjacent positions
top(point(X,Y), point(Z,W)) :-
              (Y-W)=:=1, 
              top_(point(X,Y), point(Z,W)).
bottom(X,Y) :- top(Y,X).
right(point(X,Y), point(Z,W)) :- 
              (X-Z)=:=1, 
              right_(point(X,Y), point(Z,W)).
left(X,Y) :- right(Y,X).


%  - segments and directions
segment(point(X,Y), point(Z,W)) :- X =\= Z; Y =\= W.
vertical(segment(point(X,Y), point(X,Z))) :- 
              segment(point(X,Y), point(X,Z)).
horizontal(segment(point(X,Y), point(Z,Y))) :-
              segment(point(X,Y), point(Z,Y)).


%%%%%%%%%%%%%%%%%%%%%%
% Unit tests
%%%%%%%%%%%%%%%%%%%%%%
:- begin_tests(board).
              % Point
              test(point) :-
                            point(3,0),
                            point(-1,2).
              test(point_undef, [fail]) :-
                            point(2,x);
                            point(2,1.3).
              test(point_float, [fail]) :-
                            point(2,1.3).
              
              % Segment
              test(segment) :-
                            segment(point(1,1), point(1,2)).
              test(segment_point, [fail]) :-
                            segment(X, X).
:- end_tests(board).
