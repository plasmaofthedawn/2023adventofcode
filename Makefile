day1part1:
	fpc src/day1/part1.pas -obuild/day1part1
	@echo
	./build/day1part1

day1part2:
	fpc src/day1/part2.pas -obuild/day1part2
	@echo
	./build/day1part2

day2part1:
	fpc src/day2/part1.pas -obuild/day2part1
	@echo
	./build/day2part1

day2part2:
	fpc src/day2/part2.pas -obuild/day2part2
	@echo
	./build/day2part2

clean:
	rm build/*