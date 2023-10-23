SUBDIRS := locale

all: locale install

locale: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

install:
	pip3 install -r "requirements.txt"

.PHONY: locale