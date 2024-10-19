# Logic Math Puzzle Solver

This repository contains a [Prolog](https://www.swi-prolog.org/) implementation designed to solve a specific matrix puzzle. The matrix must meet several constraints applied to its diagonal, rows, and columns. The goal is to validate whether a given matrix satisfies these conditions:

- **diagonal**: Adjacent diagonal elements must be equal.
- **rows**: Each row should contain distinct integers between 1 and 9. The sum or product of the row values must match the first value (header) in that row.
- **columns**: Similar to rows, columns must also contain distinct integers between 1 and 9, with the sum or product of the column values matching the first element (header) of the column.

## Usage

It is recommended to run the code for this project within a development container in VS Code.

1. Activate the VS Code dev container

```sh
git clone https://github.com/wille-wang/logic-math-puzzle.git
cd logic-math-puzzle
code .
devcontainer open .  # Install `ms-vscode-remote.remote-containers` in VS Code first
```

2. Run the command in the dev container to activate the Prolog program:

```sh
swipl -l main.pl
```

3. Test the puzzle solver by running the following query:

```pl
X=[[0,14,35,11],[10,_,_,_],[12,_,_,_],[210,_,_,_]], puzzle_solution(X).
```

which is equivalent to the following matrix:

| 0   | 14  | 35  | 11  |
| --- | --- | --- | --- |
| 10  | ?   | ?   | ?   |
| 12  | ?   | ?   | ?   |
| 210 | ?   | ?   | ?   |

The Prolog environment will attempt to find values for the variables that satisfy the given constraints. If successful, it will return a solution similar to this:

```pl
?- X = [[0,14,35,11],[10,_,_,_],[12,_,_,_],[210,_,_,_]], puzzle_solution(X).

X = [[0, 14, 35, 11], [10, 5, 1, 2], [12, 3, 5, 4], [210, 6, 7, 5]] ;
false.
```

This will fill in the matrix as follows:

| 0   | 14  | 35  | 11  |
| --- | --- | --- | --- |
| 10  | 5   | 1   | 2   |
| 12  | 3   | 5   | 4   |
| 210 | 6   | 7   | 5   |

## Background

This project is modified from Assignment 2 of [Declarative Programming](https://handbook.unimelb.edu.au/2024/subjects/comp90048) (COMP90048) at the University of Melbourne, Semester 1, 2024.
