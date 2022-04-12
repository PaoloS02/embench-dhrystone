arm-build:
	$(CC) $(CC_FLAGS) -DMSC_CLOCK startup_stm32f407xx.S dhry_1.c dhry_2.c -o dhry

arm-run:
	$(GDB) -x arm-gdb-cmd.txt
