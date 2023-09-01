.POSIX:
CROSS   =
CC      = $(CROSS)gcc -std=c99
CFLAGS  = -DNDEBUG -ffast-math -Os
LDFLAGS = -s
LDLIBS  = -lwinmm -lgdi32 -lopengl32 -ldsound
WINDRES = $(CROSS)windres

Asteroids.exe: Asteroids.c icon.o
	$(CC) $(CFLAGS) -mwindows $(LDFLAGS) -o $@ Asteroids.c icon.o $(LDLIBS)

all: Asteroids.exe

icon.o: Asteroids.ico
	echo '1 ICON "Asteroids.ico"' | $(WINDRES) -o $@

clean:
	rm Asteroids.exe *.o