
% sokoban\level1.pl: board layout for Sokoban puzzle
%     ... learning Prolog with SWI-Prolog
% Author: Javier G. Sogo

/***************************************************************************/
/* Sokoban board: level 2                                                  */
/***************************************************************************/
/* It is a 3x3 board with two boxes and two storage positions              */
/*                                                                         */
/*  +---+---+---+                                                          */
/*  | S | X | . |                                                          */
/*  +---+---+---+                                                          */
/*  |   | X |   |                                                          */
/*  +---+---+---+                                                          */
/*  |   | · |   |                                                          */
/*  +---+---+---+                                                          */
/*                                                                         */
/***************************************************************************/

/* Board definition: adjacent positions                                    */
top(x1y1,x1y2).
top(x1y2,x1y3).
top(x2y1,x2y2).
top(x2y2,x2y3).
top(x3y1,x3y2).
top(x3y2,x3y3).

right(x1y3, x2y3).
right(x2y3, x3y3).
right(x1y2, x2y2).
right(x2y2, x3y2).
right(x1y1, x2y1).
right(x2y1, x3y1).

/* Boxes initial positions                                                 */
box(x2y3).
box(x2y2).

/* Storage positions                                                       */
solution(x2y1).
solution(x3y3).

/* Sokoban initial position                                                */
sokoban(x1y1).

/* Initial state assertion                                                 */
initial_state(sokoban, state(x1y1, [x2y3, x2y2])).
