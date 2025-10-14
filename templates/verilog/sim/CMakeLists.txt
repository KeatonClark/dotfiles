find_package(verilator REQUIRED)

add_executable(ShiftRegister 
	${CMAKE_CURRENT_SOURCE_DIR}/ShiftRegister.cpp
)

verilate(ShiftRegister 
	SOURCES 
		${CMAKE_SOURCE_DIR}/rtl/ShiftRegister.v
	TRACE_VCD
)

target_link_libraries(ShiftRegister 
	PRIVATE
		CppUTest
)

add_test(NAME ShiftRegister COMMAND ShiftRegister -v)
