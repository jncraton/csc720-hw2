all: hw2.html

hw2.html: hw2.pmd
	pweave --format=md2html hw2.pmd

clean:
	rm -f hw2.html
	rm -rf figures
	rm -rf __pycache__