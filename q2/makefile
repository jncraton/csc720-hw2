all: calc

calc.yy.c: calc.lex
	flex calc.lex

calc: calc.yy.c
	gcc -o calc lex.yy.c