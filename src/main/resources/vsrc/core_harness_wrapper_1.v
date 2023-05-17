module BoomCoreHarnessWrapper_1
#(parameter VLEN=256)
(
   input clock,
   input reset,
   input [ 7:0] hartid,

   input [ 2:0] csrwr_cmd,
   input [11:0] csrwr_addr,
   input [63:0] csrwr_wdata,
   input [63:0] csrwr_rdata,

   input commit_arch_valids_0,

   input [ 4:0] commit_uops_0_ldst,
   
   input [ 2:0] commit_uops_0_dst_rtype,
   
   input [39:0] commit_uops_0_debug_pc,

   input [63:0] commit_uops_0_debug_tag,
   
   input [63:0] commit_uops_0_debug_wdata,

   input [VLEN*8-1:0] commit_uops_0_debug_vec_wdata,

   input [   7:0] commit_uops_0_debug_vec_wmask,

   input [31:0] commit_uops_0_debug_inst

);

   BoomCoreHarnessIntf #(.coreMaxAddrBits(  40),
                         .retireWidth    (   1),
                         .xLen           (  64),
                         .vLen           (VLEN),
                         .lregSz         (   5) ) i0();

   assign i0.clock = clock;
   assign i0.reset = reset;
   assign i0.hartid = hartid;

   assign i0.csrwr.cmd   = csrwr_cmd;
   assign i0.csrwr.addr  = csrwr_addr;
   assign i0.csrwr.wdata = csrwr_wdata;
   assign i0.csrwr.rdata = csrwr_rdata;

   assign i0.commit.arch_valids[0] = commit_arch_valids_0;
   
   assign i0.commit.uops[0].ldst = commit_uops_0_ldst;
   
   assign i0.commit.uops[0].dst_rtype = commit_uops_0_dst_rtype;
   
   assign i0.commit.uops[0].debug_pc = commit_uops_0_debug_pc;

   assign i0.commit.uops[0].debug_tag = commit_uops_0_debug_tag;
   
   assign i0.commit.uops[0].debug_wdata = commit_uops_0_debug_wdata;
   
   assign i0.commit.uops[0].debug_vec_wdata = commit_uops_0_debug_vec_wdata;
   
   assign i0.commit.uops[0].debug_vec_wmask = commit_uops_0_debug_vec_wmask;
   
   assign i0.commit.uops[0].debug_inst = commit_uops_0_debug_inst;
   
   BoomCoreHarness
   #(.coreMaxAddrBits(  40),
     .retireWidth    (   1),
     .xLen           (  64),
     .vLen           (VLEN),
     .lregSz         (   5) )
   SV_instance
   (i0);

endmodule

