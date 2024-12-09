% Replace this comment with any example located in the instances folder

% Cell Range
cell(X,Y) :- X=0..n1, Y=0..n2.

% Moves North
{move(X,Y,X,Y+1)} :- cell(X,Y), Y < n2-1. % not p(X,Y).
% Moves East
{move(X,Y,X+1,Y)} :- cell(X,Y), X < n1-1. % not p(X,Y).
% Moves West
{move(X,Y,X-1,Y)} :- cell(X,Y), X > 0. % not p(X,Y).

% Define path as move
path(X1,Y1,X2,Y2) :- move(X1,Y1,X2,Y2).

% Define some connectivity
connected(startX, 0).
connected(X, Y) :- connected(X1, Y1), path(X1, Y1, X, Y).

% Outgoing path must have incoming path
:- path(X1,Y1,_,_), X1 != startX, not path(_,_,X1,Y1).

% Incoming path must have outgoing path
:- path(_,_,X2,Y2), Y2 != n2-1, not path(X2,Y2,_,_).

% Path can't double back
:- path(X1,Y1,X2,Y2), path(X3,Y3,X4,Y4), X1 == X4, Y1 == Y4, X2 == X3, Y2 == Y3.

% Start position
:- not path(startX,0,_,_).

% End position
:- not path(_,_,_,n2-1).

% Distance/Pythagorean theorem
safe_distance(X1,Y1,X2,Y2) :- cell(X1,Y1), cell(X2,Y2), (X1-X2)**2 + (Y1-Y2)**2 >= d**2.

% Ensure that each path must be connected
:- path(X1,Y1,X2,Y2), not connected(X1,Y1).
:- path(X1,Y1,X2,Y2), not connected(X2,Y2).

% Ensure that no paths are generated in the last row
:- path(X1,Y1,X2,Y2), Y1 = n2-1.

% Path is at a safe distance from each person
:- path(X1,Y1,X2,Y2), p(Px,Py), not safe_distance(X1,Y1,Px,Py).
:- path(X1,Y1,X2,Y2), p(Px,Py), not safe_distance(X2,Y2,Px,Py).

% A cell (X,Y) cant have two outgoing paths in different directions.
:- path(X,Y,X1,Y1), path(X,Y,X2,Y2), X1 != X2.
:- path(X,Y,X1,Y1), path(X,Y,X2,Y2), Y1 != Y2.

% Output
#show path/4.
