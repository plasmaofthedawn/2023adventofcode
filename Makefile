day1part1:
	fpc src/day1/part1.pas -obuild/day1part1
	@echo
	./build/day1part1

dcday1part1:
	python3 dcsrc/preprocess.py resources/day1.txt | dc dcsrc/day1/part1.dc

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

day11part1:
	fpc src/day11/part1.pas -obuild/day11part1
	@echo
	./build/day11part1

day11part2:
	fpc src/day11/part2.pas -obuild/day11part2
	@echo
	./build/day11part2

day12part1:
	fpc src/day12/part1.pas -obuild/day12part1
	@echo
	./build/day12part1

day12part2:
	fpc src/day12/part2.pas -obuild/day12part2
	@echo
	./build/day12part2

day13part1:
	fpc src/day13/part1.pas -obuild/day13part1
	@echo
	./build/day13part1

day13part2:
	fpc src/day13/part2.pas -obuild/day13part2
	@echo
	./build/day13part2

day13part1z80:
	zasm z80src/day13/part1.z80 -o build/day13part1.bin
	cat z80src/preamble build/day13part1.bin > build/day13part1.bin0
	@echo
	./z80sim -xbuild/day13part1.bin0

day14part1:
	fpc src/day14/part1.pas -obuild/day14part1
	@echo
	./build/day14part1

day14part2:
	fpc src/day14/part2.pas -obuild/day14part2
	@echo
	./build/day14part2

day15part1:
	fpc src/day15/part1.pas -obuild/day15part1
	@echo
	./build/day15part1

day15part2:
	fpc src/day15/part2.pas -obuild/day15part2
	@echo
	./build/day15part2

day16part1:
	fpc src/day16/part1.pas -obuild/day16part1
	@echo
	./build/day16part1

day16part2:
	fpc src/day16/part2.pas -obuild/day16part2
	@echo
	./build/day16part2


day17part1:
	fpc src/day17/part1.pas -obuild/day17part1
	@echo
	./build/day17part1

day17part2:
	fpc src/day17/part2.pas -obuild/day17part2
	@echo
	./build/day17part2


clean:
	rm build/*
