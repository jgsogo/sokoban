
% sokoban\sokoban.pl: depth-first search implementation (applied to Sokoban puzzle)
%     ... learning Prolog with SWI-Prolog
% Author: Javier G. Sogo

/***************************************************************************/
/* Depth-first search solving framework                                    */
/***************************************************************************/
/* Depth-first search (DFS) is an algorithm for traversing or searching    */
/* tree or graph data structures. This algorithm can be applied to         */
/* combinatorial problems and guarantees to find the optimal solution      */
/* as it traverses the entire graph. Nevertheless for large graphs time    */
/* and/or resources may be a limitation.                                   */
/*                                                                         */
/***************************************************************************/

/* The problem is solved if the state is equal to final_state.             */
solve_dfs(Problem, State, _History, []) :-
    final_state(Problem, State).

/* If not, we have to explore new states                                   */
solve_dfs(Problem, State, History, [Move|Moves]) :-
    movement(State, Move),
    update(State, Move, NewState),
    \+ member(NewState, History),   /* No quiero ciclos en el grafo de búsqueda */
    solve_dfs(Problem, NewState, [NewState|History], Moves).

/* Actually solve the problem                                              */
solve_problem(Problem, Solution) :-
    format('=============~n'),
    format('|| Problem: ~w~n', Problem),
    format('=============~n'),
    initial_state(Problem, Initial),
    format('Initial state: ~w~n', Initial),
    solve_dfs(Problem, Initial, [Initial], Solution).


/***************************************************************************/
/* Application to Sokoban: include game rules and board layout             */
/***************************************************************************/

/* Game rules                                                              */
:-include(game).

/* Modify level file include to play other boards                          */
:-include(level1).

/***************************************************************************/
/* Utility rules                                                           */
/***************************************************************************/
clear_screen :-
    format('~c~s', [0x1b, "[2J"]).  /* Credit: http://stackoverflow.com/questions/16908764/clearing-screen-in-swipl-prolog-in-windows */


%%%%%%%%%%%%%%%%%%%%%%
% Unit tests
%%%%%%%%%%%%%%%%%%%%%%
:- begin_tests(sokoban).
:- end_tests(sokoban).

%:- run_tests.