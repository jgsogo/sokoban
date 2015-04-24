# Sokoban

Prolog solver of Sokoban puzzle using depth-first-search algorithm. Source files have
their own comments.


## Example level

Levels are defined in separated files (see example in `level1.pl`), these files define
the available squares in the board, where the boxes are at the beginning and where
the solution/storage positions are.

For example, `level1.pl` defines the following board:

```
+---+---+---+
|   |   |   |
+---+---+---+
|   | X | X |
+---+---+---+
| S | · | · |
+---+---+---+
```

where:

 * `S`: is where the Sokoban is at the beginning.
 * `X`: position occupied by a box.
 * `·`: storage positions.


## Example usage

File `sokoban.pl` loads the data for the desired level. By default it is `level1`,
modify it line `sokoban.pl:46` to play with any of the provided examples or create one on your own.
Afterwards, execute the following queries in Prolog (SWI-Prolog):

```
?- [sokoban].
?-  solve_problem(sokoban, Solution).
```

The expected output will be something like this:

```
=============
|| Problem: sokoban
=============
Initial state: state(x1y1,[x2y2,x3y2])
Solution = [move(x2y2, down), move(x3y2, down)] ;
Solution = [move(x3y2, down), move(x2y2, down)] ;
```

Each line contains a sequence of movements to solve the puzzle.


## Sokoban path

An additional restriction can be enabled in the resolution of the puzzle. The Sokoban has to
be able to reach the push location from his actual position. This constraint can be enabled
removing the comment at line `game.pl:117` so the rule `can_reach\4` is actually called.

Enabling this rule results in the following output:

```
=============
|| Problem: sokoban
=============
Initial state: state(x1y1,[x2y2,x3y2])
Solution = [move(x2y2, up), move(x3y2, up)] ;
Solution = [move(x2y2, up), move(x3y2, up)] ;
Solution = [move(x2y2, up), move(x3y2, up)] ;
Solution = [move(x2y2, up), move(x3y2, up)] ;
Solution = [move(x2y2, up), move(x3y2, up)] ;
Solution = [move(x2y2, up), move(x3y2, up)] ;
Solution = [move(x3y2, up), move(x2y2, up)] ;
Solution = [move(x3y2, up), move(x2y2, up)] ;
```

The same combination of movements is repeated because the Sokoban can use different paths
to reach each push location.

