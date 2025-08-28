CC=gcc
AR=ar

INDIR=/usr/include
LIBDIR=/usr/lib

PKGS = raylib


CFLAGS += -Wall
CFLAGS += -Wextra
CFLAGS += -pedantic
CFLAGS += -O2
CFLAGS += -Isrc/include
CFLAGS += $$(pkg-config --cflags $(PKGS))


LIBS += -lalloc
LIBS += -lm
LIBS += $$(pkg-config --libs $(PKGS))


OBJS += $(CACHE)/object.o


$(CACHE)/object.o: src/visio/object.c src/include/visio/object.h
	$(CC) $(CFLAGS) -c src/visio/object.c -o $@


$(RELEASE)/$(TARGET): $(OBJS)
	$(AR) rcs $@ $(OBJS)


######################### test project config ########################
TEST_TARGET = test
TEST_OBJS += $(CACHE)/test.o


$(CACHE)/test.o: test/test.c
	$(CC) $(CFLAGS) -c test/test.c -o $@


$(RELEASE)/$(TEST_TARGET): $(TEST_OBJS) $(OBJS)
	$(CC) $(TEST_OBJS) $(OBJS) $(LIBS) -o $@ 

 

