ITERATIONS=66666

arm-build:
	$(CC) $(CC_FLAGS) -DITERATIONS=$(ITERATIONS) timing_arm.c startup_stm32f407xx.S dhry_1-arm.c dhry_2.c -o dhry

arm-run:
	$(GDB) -x arm-gdb-cmd.txt dhry 2>&1 | tee result
	./extract_result.sh ARM GCC $(ITERATIONS) 16
