all: hw2.html hw2.md

hw2.html: hw2.pmd
	pweave --format=md2html hw2.pmd

hw2.md: hw2.pmd
	pweave --format=pandoc hw2.pmd

clean:
	rm -f hw2.html
	rm -rf figures
	rm -rf __pycache__
	rm -f q?/*.i
	rm -f q?/*.s
	rm -f q?/*.o
	rm -f q?/*.txt
	rm -f q?/*.tab.?
	rm -f q?/*.yy.c
	rm -f q?/calc
	rm -f q1/hello