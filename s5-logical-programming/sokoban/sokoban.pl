% sokoban\sokoban.pl: Sokoban puzzle
%     ... learning Prolog with SWI-Prolog
% by Javier G. Sogo


:-include(level1).
:-include(game).

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Play Sokoban: 
%%%%%%%%%%%%%%%%%%%%%%%%%%%

% DFS solving framework

% The problem is solved if the state is equal to final_state.
solve_dfs(Problem, State, _History, []) :-
    final_state(Problem, State).

% If not, we have to explore new states
solve_dfs(Problem, State, History, [Move|Moves]) :-
    format('~n==== Iteration ==== ~n'),
    format(' == History: ~w~n', History),
    format(' == Move|Moves: ~w|~w~n', [Move, Moves]),
    movement(State, Move),
    format(' == Move: ~w~n', Move),
    update(State, Move, NewState),
    format(' == NewState: ~w~n', NewState),
    /*legal_state(NewState),          Puede ser duplicado */
    %\+ member(NewState, History),   /* No quiero ciclos en el grafo de búsqueda */
    solve_dfs(Problem, NewState, [NewState|History], Moves).

% Actually solve the problem
solve_problem(Problem, Solution) :-
    format('=============~n'),
    format('|| Problem: ~w~n', Problem),
    format('=============~n'),
    initial_state(Problem, Initial),
    format('Initial state: ~w~n', Initial),
    solve_dfs(Problem, Initial, [Initial], [Solution]),
    format('< solve_problem~n').


% Clear screen
clear_screen :-
    format('~c~s', [0x1b, "[2J"]).  /* Credit: http://stackoverflow.com/questions/16908764/clearing-screen-in-swipl-prolog-in-windows */


%%%%%%%%%%%%%%%%%%%%%%
% Unit tests
%%%%%%%%%%%%%%%%%%%%%%
:- begin_tests(sokoban).
:- end_tests(sokoban).

%:- run_tests.