import sys 


if len(sys.argv) == 1:
    contents = sys.stdin.read()
else:
    contents = open(sys.argv[1]).read()

print(
        " ".join([str(ord(c)) for c in contents])
)
