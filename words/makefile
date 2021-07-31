
# Works on an ubuntu system
# Used to build the words file and save to repo via github action
all: words

words: $(shell ls /*/*/*/index.[anv]* | head -1) extract-wordnet.sh
	./extract-wordnet.sh $(shell dirname $<) $@

.PHONY: clean
clean:
	-rm -rf words

