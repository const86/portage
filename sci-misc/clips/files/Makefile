src := $(wildcard CLIPSSrc/*.c)
obj := $(src:.c=.o)

clips: $(obj)
	$(CC) -o $@ $^ -lm
