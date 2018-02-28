all: calc

lex.yy.c: calc.lex
	flex calc.lex

calc: lex.yy.c
	gcc -o calc lex.yy.c

test: calc
	./calc test.calc