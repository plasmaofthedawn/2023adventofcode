day1part1:
	fpc src/day1/part1.p -obuild/day1part1
	@echo
	./build/day1part1

day1part2:
	fpc src/day1/part2.p -obuild/day1part2
	@echo
	./build/day1part2

clean:
	rm build/*