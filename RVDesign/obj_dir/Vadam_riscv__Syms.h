// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header

#ifndef _Vadam_riscv__Syms_H_
#define _Vadam_riscv__Syms_H_

#include "verilated_heavy.h"

// INCLUDE MODULE CLASSES
#include "Vadam_riscv.h"

// SYMS CLASS
class Vadam_riscv__Syms : public VerilatedSyms {
  public:
    
    // LOCAL STATE
    const char* __Vm_namep;
    bool __Vm_activity;  ///< Used by trace routines to determine change occurred
    bool __Vm_didInit;
    
    // SUBCELL STATE
    Vadam_riscv*                   TOPp;
    
    // COVERAGE
    uint32_t __Vcoverage[2252];
    
    // CREATORS
    Vadam_riscv__Syms(Vadam_riscv* topp, const char* namep);
    ~Vadam_riscv__Syms() {}
    
    // METHODS
    inline const char* name() { return __Vm_namep; }
    inline bool getClearActivity() { bool r=__Vm_activity; __Vm_activity=false; return r; }
    
} VL_ATTR_ALIGNED(64);

#endif // guard
