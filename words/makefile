
all: words

list_of_index.txt:
	ls /*/*/*/index.[anv]* > $@

words: list_of_index.txt extract-wordnet.sh
	extract-wordnet.sh $(shell head -1 $< | xargs dirname) $@


.PHONY: clean
clean:
	-rm -rf list_of_index.txt
	-rm -rf words

