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

day7part1:
	fpc src/day7/part1.pas -obuild/day7part1
	@echo
	./build/day7part1

day7part2:
	fpc src/day7/part2.pas -obuild/day7part2
	@echo
	./build/day7part2

day8part1:
	fpc src/day8/part1.pas -obuild/day8part1
	@echo
	./build/day8part1

day8part2:
	fpc src/day8/part2.pas -obuild/day8part2
	@echo
	./build/day8part2

day9part1:
	fpc src/day9/part1.pas -obuild/day9part1 -g
	@echo
	./build/day9part1

day9part2:
	fpc src/day9/part2.pas -obuild/day9part2
	@echo
	./build/day9part2

day10part1:
	fpc src/day10/part1.pas -obuild/day10part1
	@echo
	./build/day10part1

day10part2:
	fpc src/day10/part2.pas -obuild/day10part2
	@echo
	./build/day10part2


clean:
	rm build/*