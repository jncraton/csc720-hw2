all: calc

calc.tab.c calc.tab.h:	calc.y
	bison -d calc.y

lex.yy.c: calc.lex calc.tab.h
	flex calc.lex

calc: lex.yy.c calc.tab.c calc.tab.h
	gcc -o calc calc.tab.c lex.yy.c -lfl

test: calc
	echo "1+1" | ./calc | grep 2
	echo "8/4" | ./calc | grep 2
	echo "7-2*3" | ./calc | grep 1

clean:
	rm calc calc.tab.c lex.yy.c calc.tab.h
