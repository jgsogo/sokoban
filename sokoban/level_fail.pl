
% sokoban\level1.pl: board layout for Sokoban puzzle
%     ... learning Prolog with SWI-Prolog
% Author: Javier G. Sogo

/***************************************************************************/
/* Sokoban board: level 4                                                  */
/***************************************************************************/
/* A board with two boxes and two storage positions                        */
/*                                                                         */
/*          +---+---+                                                      */
/*          |   |   |                                                      */
/*  +---+---+---+---+---+---+---+                                          */
/*  |   |   |   |   |   | X |   |                                          */
/*  +---+---+---+---+---+---+---+                                          */
/*  |   |||||   |   ||||| X |   |                                          */
/*  +---+---+---+---+---+---+---+                                          */
/*  |   | · |   | · ||||| S |   |                                          */
/*  +---+---+---+---+---+---+---+                                          */
/*                                                                         */
/***************************************************************************/

/* Board definition: adjacent positions                                    */
top(x1y1,x1y2).
top(x1y2,x1y3).
top(x3y1,x3y2).
top(x3y2,x3y3).
top(x3y3,x3y4).
top(x4y1,x4y2).
top(x4y2,x4y3).
top(x4y3,x4y4).
top(x6y1,x6y2).
top(x6y2,x6y3).
top(x7y1,x7y2).
top(x7y2,x7y3).

right(x1y1, x2y1).
right(x2y1, x3y1).
right(x3y1, x4y1).
right(x6y1, x7y1).
right(x3y2, x4y2).
right(x6y2, x7y2).
right(x1y3, x2y3).
right(x2y3, x3y3).
right(x3y3, x4y3).
right(x4y3, x5y3).
right(x5y3, x6y3).
right(x6y3, x7y3).
right(x3y4, x4y4).


/* Boxes initial positions                                                 */
box(x6y2).
box(x6y3).

/* Storage positions                                                       */
solution(x2y1).
solution(x4y1).

/* Sokoban initial position                                                */
sokoban(x6y1).

/* Initial state assertion                                                 */
initial_state(sokoban, state(x1y1, [x6y2, x6y3])).
