# Sokoban

Prolog solver of [Sokoban puzzle](http://en.wikipedia.org/wiki/Sokoban) using
depth-first-search (DFS) algorithm. Source files have their own comments:

 * `sokoban.pl`: define DFS algorithm and include rules from `game.pl`, `board.pl` and
   the desired level.
 * `game.pl`: define all the rules to play Sokoban.
 * `board.pl`: define rules related to board itself.
 * Info about levels is given in the next section.

## Levels

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
modify it in line `sokoban.pl:46` to play with any of the provided examples or create one on your own.
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


## TODO

There is a lot of work ahead, for example:

 * What about the [level that fails](./sokoban/level_fail.pl)?
 * Use `can_reach\4` without duplicating solutions.

Pull requests are more than welcome, of course ;D

