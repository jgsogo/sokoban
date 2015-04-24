# Sokoban

Prolog solver of Sokoban puzzle using depth-first-search algorithm. Source files have their own comments.

## Usage

File `sokoban.pl` loads the data for the desired level. By default it is `level1`, modify it to play with any other example.
Afterwards, execute the following queries in Prolog:

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
Solution = [move(x2y2, up), move(x3y2, up)] ;
Solution = [move(x2y2, up), move(x3y2, up)] ;
Solution = [move(x2y2, up), move(x3y2, up)] ;
Solution = [move(x2y2, up), move(x3y2, up)] ;
Solution = [move(x2y2, up), move(x3y2, up)] ;
Solution = [move(x2y2, up), move(x3y2, up)] ;
Solution = [move(x3y2, up), move(x2y2, up)] ;
Solution = [move(x3y2, up), move(x2y2, up)] ;
```

where each line contains the movements needed to solve the puzzle. If there are more than one solution with the same list of movements it is because the Sokoban is following different paths to the same push position.