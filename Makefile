.PHONY: serve build clean

serve:
	mkdocs serve

build:
	mkdocs build --strict

clean:
	rm -rf site
