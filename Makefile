PREFIX := /usr
BCHDIR := $(PREFIX)/share/bchacktool
BINDIR := $(PREFIX)/bin

LOCALE := locale
SDB := tools/sdb

all: sdb locale

sdb:
	$(MAKE) -C $(SDB)

locale:
	ln -vf $(SDB)/src/sdb $(LOCALE)
	$(MAKE) -C $(LOCALE)

clean:
	$(MAKE) -C $(SDB) clean
	$(MAKE) -C $(LOCALE) clean
	

.PHONY: sdb locale clean
