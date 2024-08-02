:- ensure_loaded(library(clpfd)).

% main predicate to check if Matrix satisfies the puzzle constraints
puzzle_solution(Matrix) :- valid_matrix(Matrix).

% check if Matrix is valid by validating its diagonal, rows, and columns
valid_matrix(Matrix) :-
    valid_diagonal(Matrix),
    valid_rows(Matrix),
    valid_cols(Matrix).

% check if the diagonal of Matrix is valid by checking if all the diagonal 
%   values are equal
valid_diagonal(Matrix) :- equal_diagonal(Matrix, 0).
equal_diagonal([_], _).
equal_diagonal(Matrix, 0) :-
    Matrix = [_, Row_1|Rows],
    equal_diagonal([Row_1|Rows], 1).
equal_diagonal(Matrix, N_1) :-
    Matrix = [Row_1, Row_2|Rows],
    N_2 #= N_1 + 1,
    nth0(N_1, Row_1, Diagonal_val),
    nth0(N_2, Row_2, Diagonal_val),
    equal_diagonal([Row_2|Rows], N_2).

% validate all columns of the matrix by transposing it and checking the rows 
%   of the transposed matrix
valid_rows(Matrix) :-
    Matrix = [_|Rows],
    maplist(valid_row, Rows).

% check if a row is valid based on the constraints
valid_cols(Matrix) :-
    transpose(Matrix, Matrix_T),
    Matrix_T = [_|Rows],
    maplist(valid_row, Rows).

% check if the product of the row values equals the header
valid_row(Row) :-
    Row = [Header|Values],
    constrainted_integers(Values),
    (sum_list(Values, Header) ; product_list(Values, Header)).

% accumulate the product of the row values
product_list(Values, Header) :-
    product_list_acc(Values, 1, Header).
product_list_acc([], Acc, Acc).
product_list_acc([Value|Values], Acc, Header) :-
    Acc_1 #= Acc * Value,
    product_list_acc(Values, Acc_1, Header).

% ensure that the row values are integers between 1 and 9 and all distinct
constrainted_integers(Values) :-
    maplist(between(1, 9), Values),
    all_distinct(Values).