# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

# compile C with /home/mistery/opt/Ulx3sSmp/buildroot-build/per-package/eez-simulator/host/bin/riscv32-buildroot-linux-gnu-gcc
# compile CXX with /home/mistery/opt/Ulx3sSmp/buildroot-build/per-package/eez-simulator/host/bin/riscv32-buildroot-linux-gnu-g++
C_FLAGS = -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -DSYS_futex=SYS_futex_time64 -D__NR_futex=__NR_futex_time64  -DNDEBUG   -pthread

C_DEFINES = -DDATA_INSTALL_DIR=\"/usr/\" -DDEBUG -DEEZ_MCU_REVISION_R1B5=1 -DEEZ_PLATFORM_SIMULATOR -DEEZ_PLATFORM_SIMULATOR_UNIX -DFIRMWARE_VERSION_MAJOR=1 -DFIRMWARE_VERSION_MINOR=7.1 -DHAVE_STDBOOL -DHAVE_STRTOLL -DOPTION_AUX_TEMP_SENSOR=1 -DOPTION_DISPLAY=1 -DOPTION_ENCODER=1 -DOPTION_ETHERNET=1 -DOPTION_EXT_EEPROM=1 -DOPTION_EXT_RTC=1 -DOPTION_FAN=1 -DOPTION_GUI_THREAD=1 -DOPTION_SDRAM=1 -DOPTION_SD_CARD=1 -DSCPI_USER_CONFIG

C_INCLUDES = -I/home/mistery/opt/Ulx3sSmp/buildroot-build/per-package/flare-engine/host/riscv32-buildroot-linux-gnu/sysroot/usr/include/SDL2 -I/home/mistery/opt/Ulx3sSmp/buildroot-build/build/eez-simulator/src -I/home/mistery/opt/Ulx3sSmp/buildroot-build/build/eez-simulator/src/eez/libs/mqtt -I/home/mistery/opt/Ulx3sSmp/buildroot-build/build/eez-simulator/src/eez/platform/simulator -I/home/mistery/opt/Ulx3sSmp/buildroot-build/build/eez-simulator/src/eez/scpi -isystem /home/mistery/opt/Ulx3sSmp/buildroot-build/build/eez-simulator/src/third_party/libscpi/inc -isystem /home/mistery/opt/Ulx3sSmp/buildroot-build/build/eez-simulator/src/third_party/micropython -isystem /home/mistery/opt/Ulx3sSmp/buildroot-build/build/eez-simulator/src/third_party/micropython/ports/bb3 

CXX_FLAGS = -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -DSYS_futex=SYS_futex_time64 -D__NR_futex=__NR_futex_time64 -fpermissive -pedantic libSDL2.so libSDL2_image.so libz.so.1 libfreetype.so.6 libSDL2_ttf.so  -DNDEBUG   -pthread -std=gnu++14

CXX_DEFINES = -DDATA_INSTALL_DIR=\"/usr/\" -DDEBUG -DEEZ_MCU_REVISION_R1B5=1 -DEEZ_PLATFORM_SIMULATOR -DEEZ_PLATFORM_SIMULATOR_UNIX -DFIRMWARE_VERSION_MAJOR=1 -DFIRMWARE_VERSION_MINOR=7.1 -DHAVE_STDBOOL -DHAVE_STRTOLL -DOPTION_AUX_TEMP_SENSOR=1 -DOPTION_DISPLAY=1 -DOPTION_ENCODER=1 -DOPTION_ETHERNET=1 -DOPTION_EXT_EEPROM=1 -DOPTION_EXT_RTC=1 -DOPTION_FAN=1 -DOPTION_GUI_THREAD=1 -DOPTION_SDRAM=1 -DOPTION_SD_CARD=1 -DSCPI_USER_CONFIG

CXX_INCLUDES = -I/home/mistery/opt/Ulx3sSmp/buildroot-build/per-package/flare-engine/host/riscv32-buildroot-linux-gnu/sysroot/usr/include/SDL2 -I/home/mistery/opt/Ulx3sSmp/buildroot-build/build/eez-simulator/src -I/home/mistery/opt/Ulx3sSmp/buildroot-build/build/eez-simulator/src/eez/libs/mqtt -I/home/mistery/opt/Ulx3sSmp/buildroot-build/build/eez-simulator/src/eez/platform/simulator -I/home/mistery/opt/Ulx3sSmp/buildroot-build/build/eez-simulator/src/eez/scpi -isystem /home/mistery/opt/Ulx3sSmp/buildroot-build/build/eez-simulator/src/third_party/libscpi/inc -isystem /home/mistery/opt/Ulx3sSmp/buildroot-build/build/eez-simulator/src/third_party/micropython -isystem /home/mistery/opt/Ulx3sSmp/buildroot-build/build/eez-simulator/src/third_party/micropython/ports/bb3 

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/ports/bb3/main.c.o_FLAGS = -fpermissive

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/ports/bb3/gccollect.cpp.o_FLAGS = -fpermissive

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/ports/bb3/mphalport.cpp.o_FLAGS = -fpermissive

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/argcheck.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/asmarm.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/asmbase.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/asmthumb.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/asmx64.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/asmx86.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/asmxtensa.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/bc.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/binary.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/builtinevex.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/builtinhelp.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/builtinimport.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/compile.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/emitbc.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/emitcommon.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/emitglue.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/emitinlinethumb.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/emitinlinextensa.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/emitnarm.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/emitnative.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/emitnthumb.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/emitnx64.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/emitnx86.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/emitnxtensa.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/formatfloat.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/frozenmod.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/gc.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/lexer.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/malloc.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/map.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/modarray.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/modbuiltins.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/modcmath.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/modcollections.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/modgc.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/modio.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/modmath.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/modmicropython.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/modstruct.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/modsys.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/modthread.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/moduerrno.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/mpprint.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/mpstate.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/mpz.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/nativeglue.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/nlr.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/nlrsetjmp.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/nlrthumb.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/nlrx64.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/nlrx86.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/nlrxtensa.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objarray.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objattrtuple.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objbool.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objboundmeth.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/obj.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objcell.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objclosure.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objcomplex.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objdeque.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objdict.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objenumerate.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objexcept.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objfilter.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objfloat.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objfun.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objgenerator.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objgetitemiter.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objint.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objint_longlong.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objint_mpz.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objlist.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objmap.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objmodule.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objnamedtuple.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objnone.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objobject.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objpolyiter.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objproperty.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objrange.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objreversed.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objset.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objsingleton.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objslice.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objstr.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objstringio.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objstrunicode.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objtuple.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objtype.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/objzip.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/opmethods.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/parse.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/parsenumbase.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/parsenum.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/persistentcode.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/pystack.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/qstr.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/reader.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/repl.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/runtime.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/runtime_utils.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/scheduler.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/scope.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/sequence.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/showbc.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/smallint.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/stackctrl.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/stream.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/unicode.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/vm.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/vstr.c.o_FLAGS = -Wint-to-pointer-cast

# Custom flags: CMakeFiles/modular-psu-firmware.dir/src/third_party/micropython/py/warning.c.o_FLAGS = -Wint-to-pointer-cast
