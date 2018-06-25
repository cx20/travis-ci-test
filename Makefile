CC = gcc
CFLAGS = -g
TARGET = hello

$(TARGET): src/hello.c
	$(CC) $(CFLAGS) $^ -o $(@)

test: $(TARGET)
	@./hello > output.txt
	@if diff output.txt test/answer.txt > /dev/null; then echo "test: OK"; else echo "test: NG"; exit 1; fi

clean:
	rm -f output.txt $(TARGET)
