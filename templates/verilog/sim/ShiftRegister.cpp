#include "VShiftRegister.h"
#include <verilated.h>
#include <verilated_vcd_c.h>

#include <CppUTest/TestHarness.h>
#include <CppUTest/CommandLineTestRunner.h>
#include <memory>

int main(int ac, char** av)
{
    Verilated::commandArgs(ac, av);
    MemoryLeakWarningPlugin::turnOffNewDeleteOverloads();
    return CommandLineTestRunner::RunAllTests(ac, av);
}


TEST_GROUP(ShiftRegister) {
    std::unique_ptr<VerilatedContext> contextp;
    std::unique_ptr<VShiftRegister> top;
    auto setup() -> void {
        contextp = std::make_unique<VerilatedContext>();
        top = std::make_unique<VShiftRegister>(contextp.get());
        top->clk = 1;
        top->data = 0;
        top->reset = 0;
        top->serial_in = 0;
    }
    auto teardown() -> void { }
};

auto tick(uint64_t &timestamp, std::unique_ptr<VShiftRegister> &sr, std::unique_ptr<VerilatedVcdC> &vcd) {
    sr->clk = !sr->clk;
    sr->eval();
    vcd->dump(timestamp++);
};

auto shift_in(uint8_t data, std::unique_ptr<VShiftRegister> &sr, std::unique_ptr<VerilatedVcdC> &vcd, uint64_t &timestamp) -> void {
    for (int i = 0; i < 8; ++i) {
        sr->serial_in = (data >> i) & 0b1;
        sr->clk = 0;
        sr->eval();
        vcd->dump(timestamp++);
        sr->clk = 1;
        sr->eval();
        vcd->dump(timestamp++);
    }
}

TEST(ShiftRegister, load_and_shift) {
    Verilated::traceEverOn(true);
    auto vcd = std::make_unique<VerilatedVcdC>();
    top->trace(vcd.get(), 99);
    vcd->open("load_and_shift.vcd");
    uint64_t timestamp = 0;
    vcd->dump(timestamp++);
    for (int i = 0; i <= 0xff; ++i) {
        shift_in(i, top, vcd, timestamp);
        CHECK_EQUAL(i, top->data);
    }
};

/*TEST(ShiftRegister, reset) {
    shift_in(0b1010, top);

    top->reset = 1;
    top->clk = 0;
    top->eval();
    top->clk = 1;
    top->eval();

    CHECK_EQUAL(0, top->data);
}*/
