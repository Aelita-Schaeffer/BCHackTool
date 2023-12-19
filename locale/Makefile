PREFIX := ./
LOCALEDIR := $(wildcard */*.sh)

all: build

build:
	$(foreach file,$(LOCALEDIR), ./build.sh $(file);)

clean:
	rm -f $(wildcard */*.lang)

.PHONY: all build clean