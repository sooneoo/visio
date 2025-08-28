PLATFORM ?= linux_x86_64


CACHE=.cache
RELEASE=$(CACHE)/release
TARGET=libvisio.a


all: env build


-include config/$(PLATFORM).mk


build: $(RELEASE)/$(TARGET)


.PHONY: env clean exec all



exec: env $(RELEASE)/$(TEST_TARGET)
	$(RELEASE)/$(TEST_TARGET)


install: 
	cp -rfv src/include/visio $(INDIR)
	cp -vf $(RELEASE)/$(TARGET) $(LIBDIR)


env:
	mkdir -pv $(CACHE)
	mkdir -pv $(RELEASE)


clean:
	rm -rvf $(CACHE)





