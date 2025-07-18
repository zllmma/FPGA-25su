/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_900(char*, char *);
extern void execute_77(char*, char *);
extern void execute_80(char*, char *);
extern void execute_898(char*, char *);
extern void execute_899(char*, char *);
extern void execute_896(char*, char *);
extern void execute_94(char*, char *);
extern void execute_95(char*, char *);
extern void execute_96(char*, char *);
extern void execute_97(char*, char *);
extern void execute_98(char*, char *);
extern void execute_890(char*, char *);
extern void execute_885(char*, char *);
extern void execute_119(char*, char *);
extern void execute_140(char*, char *);
extern void execute_156(char*, char *);
extern void execute_172(char*, char *);
extern void execute_188(char*, char *);
extern void execute_204(char*, char *);
extern void execute_220(char*, char *);
extern void execute_236(char*, char *);
extern void execute_252(char*, char *);
extern void execute_269(char*, char *);
extern void execute_280(char*, char *);
extern void execute_297(char*, char *);
extern void execute_313(char*, char *);
extern void execute_329(char*, char *);
extern void execute_345(char*, char *);
extern void execute_361(char*, char *);
extern void execute_377(char*, char *);
extern void execute_393(char*, char *);
extern void execute_409(char*, char *);
extern void execute_426(char*, char *);
extern void execute_437(char*, char *);
extern void execute_454(char*, char *);
extern void execute_470(char*, char *);
extern void execute_486(char*, char *);
extern void execute_502(char*, char *);
extern void execute_518(char*, char *);
extern void execute_534(char*, char *);
extern void execute_550(char*, char *);
extern void execute_566(char*, char *);
extern void execute_583(char*, char *);
extern void execute_594(char*, char *);
extern void execute_611(char*, char *);
extern void execute_627(char*, char *);
extern void execute_643(char*, char *);
extern void execute_659(char*, char *);
extern void execute_675(char*, char *);
extern void execute_691(char*, char *);
extern void execute_707(char*, char *);
extern void execute_723(char*, char *);
extern void execute_740(char*, char *);
extern void execute_779(char*, char *);
extern void execute_748(char*, char *);
extern void execute_750(char*, char *);
extern void execute_752(char*, char *);
extern void execute_754(char*, char *);
extern void execute_757(char*, char *);
extern void execute_759(char*, char *);
extern void execute_761(char*, char *);
extern void execute_763(char*, char *);
extern void execute_765(char*, char *);
extern void execute_767(char*, char *);
extern void execute_769(char*, char *);
extern void execute_771(char*, char *);
extern void execute_773(char*, char *);
extern void execute_775(char*, char *);
extern void execute_777(char*, char *);
extern void execute_786(char*, char *);
extern void execute_794(char*, char *);
extern void execute_800(char*, char *);
extern void execute_808(char*, char *);
extern void execute_815(char*, char *);
extern void execute_821(char*, char *);
extern void execute_832(char*, char *);
extern void execute_840(char*, char *);
extern void execute_848(char*, char *);
extern void execute_855(char*, char *);
extern void execute_863(char*, char *);
extern void execute_868(char*, char *);
extern void execute_875(char*, char *);
extern void execute_882(char*, char *);
extern void execute_889(char*, char *);
extern void execute_126(char*, char *);
extern void execute_128(char*, char *);
extern void execute_130(char*, char *);
extern void execute_108(char*, char *);
extern void execute_109(char*, char *);
extern void execute_104(char*, char *);
extern void execute_107(char*, char *);
extern void execute_902(char*, char *);
extern void execute_903(char*, char *);
extern void execute_904(char*, char *);
extern void execute_905(char*, char *);
extern void execute_906(char*, char *);
extern void execute_907(char*, char *);
extern void execute_908(char*, char *);
extern void execute_909(char*, char *);
extern void transaction_2(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_0(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[104] = {(funcp)execute_900, (funcp)execute_77, (funcp)execute_80, (funcp)execute_898, (funcp)execute_899, (funcp)execute_896, (funcp)execute_94, (funcp)execute_95, (funcp)execute_96, (funcp)execute_97, (funcp)execute_98, (funcp)execute_890, (funcp)execute_885, (funcp)execute_119, (funcp)execute_140, (funcp)execute_156, (funcp)execute_172, (funcp)execute_188, (funcp)execute_204, (funcp)execute_220, (funcp)execute_236, (funcp)execute_252, (funcp)execute_269, (funcp)execute_280, (funcp)execute_297, (funcp)execute_313, (funcp)execute_329, (funcp)execute_345, (funcp)execute_361, (funcp)execute_377, (funcp)execute_393, (funcp)execute_409, (funcp)execute_426, (funcp)execute_437, (funcp)execute_454, (funcp)execute_470, (funcp)execute_486, (funcp)execute_502, (funcp)execute_518, (funcp)execute_534, (funcp)execute_550, (funcp)execute_566, (funcp)execute_583, (funcp)execute_594, (funcp)execute_611, (funcp)execute_627, (funcp)execute_643, (funcp)execute_659, (funcp)execute_675, (funcp)execute_691, (funcp)execute_707, (funcp)execute_723, (funcp)execute_740, (funcp)execute_779, (funcp)execute_748, (funcp)execute_750, (funcp)execute_752, (funcp)execute_754, (funcp)execute_757, (funcp)execute_759, (funcp)execute_761, (funcp)execute_763, (funcp)execute_765, (funcp)execute_767, (funcp)execute_769, (funcp)execute_771, (funcp)execute_773, (funcp)execute_775, (funcp)execute_777, (funcp)execute_786, (funcp)execute_794, (funcp)execute_800, (funcp)execute_808, (funcp)execute_815, (funcp)execute_821, (funcp)execute_832, (funcp)execute_840, (funcp)execute_848, (funcp)execute_855, (funcp)execute_863, (funcp)execute_868, (funcp)execute_875, (funcp)execute_882, (funcp)execute_889, (funcp)execute_126, (funcp)execute_128, (funcp)execute_130, (funcp)execute_108, (funcp)execute_109, (funcp)execute_104, (funcp)execute_107, (funcp)execute_902, (funcp)execute_903, (funcp)execute_904, (funcp)execute_905, (funcp)execute_906, (funcp)execute_907, (funcp)execute_908, (funcp)execute_909, (funcp)transaction_2, (funcp)vhdl_transfunc_eventcallback, (funcp)vlog_transfunc_eventcallback, (funcp)transaction_0, (funcp)transaction_1};
const int NumRelocateId= 104;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/multiplier_tb_behav/xsim.reloc",  (void **)funcTab, 104);
	iki_vhdl_file_variable_register(dp + 43056);
	iki_vhdl_file_variable_register(dp + 43112);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/multiplier_tb_behav/xsim.reloc");
}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/multiplier_tb_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 55824, dp + 55248, 0, 15, 0, 15, 16, 1);
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/multiplier_tb_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/multiplier_tb_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/multiplier_tb_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
