# Logic Math Puzzle Solver

This repository contains a [Prolog](https://www.swi-prolog.org/) implementation for solving a specific matrix puzzle. The matrix must satisfy constraints on its diagonal, rows, and columns. The goal is to verify if a given matrix meets these criteria:

- **diagonal**: adjacent diagonal elements must be equal.
- **rows**: Each row must have distinct integers between 1 and 9, and the sum or product of these integers must be equal to the row header.
- **columns**: Each column must also follow the same rules as the rows.

## Usage

1. Clone this repository to the local machine.
2. Load the Prolog file in the Prolog environment.

```sh
swipl -l main.pl
```

3. Type the query to solve a puzzle:


```pl
X=[[0,14,35,11],[10,_,_,_],[12,_,_,_],[210,_,_,_]], puzzle_solution(X).
```

| 0 | 14 | 35 | 11 |
|---|---|---|---|
| 10 | ? | ? | ? |
| 12 | ? | ? | ? |
| 210 | ? | ? | ? |

Then, the Prolog environment will attempt to find values for the variables that satisfy the given constraints.


```pl
?- X = [[0,14,35,11],[10,_,_,_],[12,_,_,_],[210,_,_,_]], puzzle_solution(X).

X = [[0, 14, 35, 11], [10, 5, 1, 2], [12, 3, 5, 4], [210, 6, 7, 5]] ;
false.
```

| 0 | 14 | 35 | 11 |
|---|---|---|---|
| 10 | 5 | 1 | 2 |
| 12 | 3 | 5 | 4 |
| 210 | 6 | 7 | 5 |