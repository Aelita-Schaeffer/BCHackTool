PREFIX := ./
PO_FILES := $(wildcard $(PO_DIR)*/LC_MESSAGES/lang.po)

all: $(patsubst %.po, %.mo, $(PO_FILES))

%.mo: %.po
	msgfmt $< -o $@

clean:
	rm -f $(patsubst %.po, %.mo, $(PO_FILES))
