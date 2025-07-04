// Copyright lowRISC contributors.
// Copyright 2018 Embedded Microprocessor Benchmark Consortium (EEMBC)
// Original Author: Shay Gal-on
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include "core_portme.h"

#include "coremark.h"

#include "simple_system_common.h"

#if VALIDATION_RUN
volatile ee_s32 seed1_volatile = 0x3415;
volatile ee_s32 seed2_volatile = 0x3415;
volatile ee_s32 seed3_volatile = 0x66;
#endif
#if PERFORMANCE_RUN
volatile ee_s32 seed1_volatile = 0x0;
volatile ee_s32 seed2_volatile = 0x0;
volatile ee_s32 seed3_volatile = 0x66;
#endif
#if PROFILE_RUN
volatile ee_s32 seed1_volatile = 0x8;
volatile ee_s32 seed2_volatile = 0x8;
volatile ee_s32 seed3_volatile = 0x8;
#endif
volatile ee_s32 seed4_volatile = ITERATIONS;
volatile ee_s32 seed5_volatile = 0;
/* Porting : Timing functions
        How to capture time and convert to seconds must be ported to whatever is
   supported by the platform. e.g. Read value from on board RTC, read value from
   cpu clock cycles performance counter etc. Sample implementation for standard
   time.h and windows.h definitions included.
*/
CORETIMETYPE barebones_clock() {
  ee_u32 result;

  PCOUNT_READ(mcycle, result);

  return result;
}

/* Define : TIMER_RES_DIVIDER
        Divider to trade off timer resolution and total time that can be
   measured.

        Use lower values to increase resolution, but make sure that overflow
   does not occur. If there are issues with the return value overflowing,
   increase this value.
        */
#define GETMYTIME(_t) (*_t = barebones_clock())
#define MYTIMEDIFF(fin, ini) ((fin) - (ini))
#define TIMER_RES_DIVIDER 1
#define SAMPLE_TIME_IMPLEMENTATION 1
#define CLOCKS_PER_SEC 500000
#define EE_TICKS_PER_SEC (CLOCKS_PER_SEC / TIMER_RES_DIVIDER)

void pcount_read(uint32_t pcount_out[]) {
  PCOUNT_READ(minstret, pcount_out[0]);
  PCOUNT_READ(mhpmcounter3, pcount_out[1]);
  PCOUNT_READ(mhpmcounter4, pcount_out[2]);
  PCOUNT_READ(mhpmcounter5, pcount_out[3]);
  PCOUNT_READ(mhpmcounter6, pcount_out[4]);
  PCOUNT_READ(mhpmcounter7, pcount_out[5]);
  PCOUNT_READ(mhpmcounter8, pcount_out[6]);
  PCOUNT_READ(mhpmcounter9, pcount_out[7]);
  PCOUNT_READ(mhpmcounter10, pcount_out[8]);
  PCOUNT_READ(mhpmcounter11, pcount_out[9]);
  PCOUNT_READ(mhpmcounter12, pcount_out[10]);
}

const char *pcount_names[] = {"Instructions Retired",
                              "LSU Busy",
                              "IFetch wait",
                              "Loads",
                              "Stores",
                              "Jumps",
                              "Branches",
                              "Taken Branches",
                              "Compressed Instructions",
                              "Multiply Wait",
                              "Divide Wait"};

const uint32_t pcount_num = sizeof(pcount_names) / sizeof(char *);

void dump_pcounts() {
  uint32_t pcounts[pcount_num];

  pcount_read(pcounts);
  ee_printf(
      "Performance Counters\n"
      "--------------------\n");
  for (uint32_t i = 0; i < pcount_num; ++i) {
    ee_printf("%s: %u\n", pcount_names[i], pcounts[i]);
  }
  ee_printf("\n");
}

/** Define Host specific (POSIX), or target specific global time variables. */
static CORETIMETYPE start_time_val, stop_time_val;

/* Function : start_time
        This function will be called right before starting the timed portion of
   the benchmark.

        Implementation may be capturing a system timer (as implemented in the
   example code) or zeroing some system parameters - e.g. setting the cpu clocks
   cycles to 0.
*/
void start_time(void) {
  pcount_enable(0);
  pcount_reset();
  pcount_enable(1);
  GETMYTIME(&start_time_val);
}

/* Function : stop_time
        This function will be called right after ending the timed portion of the
   benchmark.

        Implementation may be capturing a system timer (as implemented in the
   example code) or other system parameters - e.g. reading the current value of
   cpu cycles counter.
*/
void stop_time(void) {
  GETMYTIME(&stop_time_val);
  pcount_enable(0);
}

/* Function : get_time
        Return an abstract "ticks" number that signifies time on the system.

        Actual value returned may be cpu cycles, milliseconds or any other
   value, as long as it can be converted to seconds by <time_in_secs>. This
   methodology is taken to accommodate any hardware or simulated platform. The
   sample implementation returns millisecs by default, and the resolution is
   controlled by <TIMER_RES_DIVIDER>
*/
CORE_TICKS get_time(void) {
  CORE_TICKS elapsed = (CORE_TICKS)(MYTIMEDIFF(stop_time_val, start_time_val));
  return elapsed;
}
/* Function : time_in_secs
        Convert the value returned by get_time to seconds.

        The <secs_ret> type is used to accommodate systems with no support for
   floating point. Default implementation implemented by the EE_TICKS_PER_SEC
   macro above.
*/
secs_ret time_in_secs(CORE_TICKS ticks) {
  secs_ret retval = ((secs_ret)ticks) / (secs_ret)EE_TICKS_PER_SEC;
  return retval;
}

ee_u32 default_num_contexts = 1;

/* Function : portable_init
        Target specific initialization code
        Test for some common mistakes.
*/
void portable_init(core_portable *p, int *argc, char *argv[]) {
  ee_printf("Ibex CoreMark platform init...\n");
  if (sizeof(ee_ptr_int) != sizeof(ee_u8 *)) {
    ee_printf(
        "ERROR! Please define ee_ptr_int to a type that holds a pointer!\n");
  }
  if (sizeof(ee_u32) != 4) {
    ee_printf("ERROR! Please define ee_u32 to a 32b unsigned type!\n");
  }
  p->portable_id = 1;
  icache_enable(1);
}
/* Function : portable_fini
        Target specific final code
*/
void portable_fini(core_portable *p) {
#ifndef SUPPRESS_PCOUNT_DUMP
  dump_pcounts();
#endif

  CORE_TICKS elapsed = get_time();
  float coremark_mhz;

  coremark_mhz = (1000000.0f * (float)ITERATIONS) / elapsed;

  ee_printf("CoreMark / MHz: %f\n", coremark_mhz);

  p->portable_id = 0;
}
