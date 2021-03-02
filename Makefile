
default: test.prg

%.o: %.s
	ca65 -t cx16 -o $@ -l $(patsubst %.o,%.lst,$@) $<
test.prg: test_lfsr.o prhex.o lfsr.o
	cl65 -t cx16 -o $@ $^

clean:
	rm -f *.a *.o *.prg

.PHONY: clean default
