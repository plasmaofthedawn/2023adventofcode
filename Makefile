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

day3part1:
	fpc src/day3/part1.pas -obuild/day3part1
	@echo
	./build/day3part1

day3part2:
	fpc src/day3/part2.pas -obuild/day3part2
	@echo
	./build/day3part2

day4part1:
	fpc src/day4/part1.pas -obuild/day4part1
	@echo
	./build/day4part1

day4part2:
	fpc src/day4/part2.pas -obuild/day4part2
	@echo
	./build/day4part2

day5part1:
	fpc src/day5/part1.pas -obuild/day5part1
	@echo
	./build/day5part1

day5part2:
	fpc src/day5/part2.pas -obuild/day5part2
	@echo
	./build/day5part2

day6part1:
	fpc src/day6/part1.pas -obuild/day6part1
	@echo
	./build/day6part1

day6part2:
	fpc src/day6/part2.pas -obuild/day6part2
	@echo
	./build/day6part2


clean:
	rm build/*