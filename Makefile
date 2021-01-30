
STACK=cabal
BUILD_OPTS=--ghc-options -O0 



.PHONY: clean

test: init.txt
	$(STACK) v2-test $(BUILD_OPTS) --test-show-details=always

bin: init.txt
	$(STACK) v2-build $(BUILD_OPTS)

clean: 
	$(STACK) v2-clean

distclean: clean 
	rm -rf .stack-work 

ghci:
	$(STACK) v2-repl $(BUILD_OPTS)

init.txt:
	$(STACK) update > init.txt

turnin: 
	git commit -a -m "turnin"
	git push origin master

upstream:
	git remote add upstream https://github.com/ucsd-cse130/02-random-art.git

update:
	git pull upstream master
