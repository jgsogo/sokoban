% sokoban\game.pl: game rules for the Sokoban puzzle
%     ... learning Prolog with SWI-Prolog
% by Javier G. Sogo


:-include(board).

/* Representación de un ESTADO */
/* state(WhereIsSokoban, [WhereAreTheBoxes]) */

/* Aserción del initial_state */
% initial_state(sokoban, state(x1y1, [x2y2, x3y3])) :-
%    sokoban(Sokoban),
%    Boxes=[]

/* Aserción del final_state */
%final_state(sokoban, state(_Sokoban, Boxes)) :-
%    all_boxes_in_solution(Boxes).


/* Representación de un MOVIMIENTO-PUSH */
/* movement(BoxPosition, Direction) */


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Game rules:
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Comprobar si todas las cajas están en su posición final
all_boxes_in_solution([]).
all_boxes_in_solution([Box|Boxes]) :-
    solution(Box),
    all_boxes_in_solution(Boxes).

% Comprobar si el Sokoban puede alcanzar arg[2] desde arg[1]
can_reach(P1, P1, _Boxes).
can_reach(P1, P2, Boxes) :-
    neib(P1, P3, _),
    \+ member(P3, Boxes),
    can_reach(P3, P2, Boxes).

% Posiciones a evitar (salvo que sean soluciones al puzzle)
stuck(X) :-
    \+ solution(X),
    corner(X).
stuck(X, Y) :-
    (right(X,Y); right(Y,X)),
    (\+ solution(X); \+ solution(Y)),
    (\+ top(X,_); \+ top(_,X)),
    (\+ top(Y,_); \+ top(_,Y)).

% Buenas posiciones objetivo
good_move(X, Boxes) :-
    \+ member(X, Boxes),
    \+ stuck(X),
    foreach(member(Box, Boxes), \+ stuck(X, Box)).


/* movement(State, Move) */
movement(state(Sokoban, Boxes), move(Box, Dir)) :-
    select(Box, Boxes, BoxesRemain),
    neib(Box, NextLoc, Dir), good_move(NextLoc, BoxesRemain),
    neib(PushPosition, Box, Dir), /*can_reach(Sokoban, PushPosition, Boxes),*/
    format('Box: ~w [> ~w >] ~w~n', [Box, Dir, NextLoc]).



/* update(State, Move, NewState) */
update(state(_Sokoban, Boxes), move(Box, Dir), state(NewSokoban, NewBoxes)) :-
    NewSokoban = Box,
    subtract(Boxes, Box, TempList),
    neib(Box, NewPosition, Dir),
    append(TempList, [NewPosition], NewBoxes).



%%%%%%%%%%%%%%%%%%%%%%
% Unit tests
%%%%%%%%%%%%%%%%%%%%%%
:- begin_tests(game).
:- end_tests(game).

%:- run_tests.