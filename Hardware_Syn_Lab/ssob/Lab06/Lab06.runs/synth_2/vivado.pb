
�
Sourcing tcl script '%s'
201*common2C
/D:/Xilinx/Vivado/2023.1/scripts/Vivado_init.tcl2default:defaultZ17-201h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2$
create_project: 2default:default2
00:00:062default:default2
00:00:082default:default2
467.0042default:default2
197.3522default:defaultZ17-268h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental D:/AD/CU_submission/Hardware_Syn_Lab/ssob/Lab06/Lab06.srcs/utils_1/imports/synth_2/vga_test.dcp2default:defaultZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2s
_D:/AD/CU_submission/Hardware_Syn_Lab/ssob/Lab06/Lab06.srcs/utils_1/imports/synth_2/vga_test.dcp2default:defaultZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
u
Command: %s
53*	vivadotcl2D
0synth_design -top vga_test -part xc7a35tcpg236-12default:defaultZ4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a35t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a35t2default:defaultZ17-349h px� 
V
Loading part %s157*device2#
xc7a35tcpg236-12default:defaultZ21-403h px� 
�
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
42default:defaultZ8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
_
#Helper process launched with PID %s4824*oasys2
43402default:defaultZ8-7075h px� 
�
%s*synth2�
yStarting RTL Elaboration : Time (s): cpu = 00:00:03 ; elapsed = 00:00:05 . Memory (MB): peak = 1281.613 ; gain = 411.340
2default:defaulth px� 
�
synthesizing module '%s'%s4497*oasys2
vga_test2default:default2
 2default:default2i
SD:/AD/CU_submission/Hardware_Syn_Lab/ssob/Lab06/Lab06.srcs/sources_1/new/vga_test.v2default:default2
232default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
vga_sync2default:default2
 2default:default2i
SD:/AD/CU_submission/Hardware_Syn_Lab/ssob/Lab06/Lab06.srcs/sources_1/new/vga_sync.v2default:default2
12default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
vga_sync2default:default2
 2default:default2
02default:default2
12default:default2i
SD:/AD/CU_submission/Hardware_Syn_Lab/ssob/Lab06/Lab06.srcs/sources_1/new/vga_sync.v2default:default2
12default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2 
vga_gradient2default:default2
 2default:default2m
WD:/AD/CU_submission/Hardware_Syn_Lab/ssob/Lab06/Lab06.srcs/sources_1/new/vga_gradient.v2default:default2
232default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2 
SinglePulser2default:default2
 2default:default2u
_D:/AD/CU_submission/Hardware_Syn_Lab/ssob/Lab06/Lab06.srcs/sources_1/imports/new/SinglePulser.v2default:default2
232default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
	Debouncer2default:default2
 2default:default2r
\D:/AD/CU_submission/Hardware_Syn_Lab/ssob/Lab06/Lab06.srcs/sources_1/imports/new/Debouncer.v2default:default2
232default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
	DFlipFlop2default:default2
 2default:default2r
\D:/AD/CU_submission/Hardware_Syn_Lab/ssob/Lab06/Lab06.srcs/sources_1/imports/new/DFlipFlop.v2default:default2
232default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	DFlipFlop2default:default2
 2default:default2
02default:default2
12default:default2r
\D:/AD/CU_submission/Hardware_Syn_Lab/ssob/Lab06/Lab06.srcs/sources_1/imports/new/DFlipFlop.v2default:default2
232default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	Debouncer2default:default2
 2default:default2
02default:default2
12default:default2r
\D:/AD/CU_submission/Hardware_Syn_Lab/ssob/Lab06/Lab06.srcs/sources_1/imports/new/Debouncer.v2default:default2
232default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2 
SinglePulser2default:default2
 2default:default2
02default:default2
12default:default2u
_D:/AD/CU_submission/Hardware_Syn_Lab/ssob/Lab06/Lab06.srcs/sources_1/imports/new/SinglePulser.v2default:default2
232default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2 
vga_gradient2default:default2
 2default:default2
02default:default2
12default:default2m
WD:/AD/CU_submission/Hardware_Syn_Lab/ssob/Lab06/Lab06.srcs/sources_1/new/vga_gradient.v2default:default2
232default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
vga_test2default:default2
 2default:default2
02default:default2
12default:default2i
SD:/AD/CU_submission/Hardware_Syn_Lab/ssob/Lab06/Lab06.srcs/sources_1/new/vga_test.v2default:default2
232default:default8@Z8-6155h px� 
�
%s*synth2�
yFinished RTL Elaboration : Time (s): cpu = 00:00:04 ; elapsed = 00:00:07 . Memory (MB): peak = 1370.129 ; gain = 499.855
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:05 ; elapsed = 00:00:07 . Memory (MB): peak = 1370.129 ; gain = 499.855
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:05 ; elapsed = 00:00:07 . Memory (MB): peak = 1370.129 ; gain = 499.855
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0042default:default2
1370.1292default:default2
0.0002default:defaultZ17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
Parsing XDC File [%s]
179*designutils2n
XD:/AD/CU_submission/Hardware_Syn_Lab/ssob/Lab06/Lab06.srcs/constrs_1/new/constraints.xdc2default:default8Z20-179h px� 
�
No ports matched '%s'.
584*	planAhead2
RsRx2default:default2n
XD:/AD/CU_submission/Hardware_Syn_Lab/ssob/Lab06/Lab06.srcs/constrs_1/new/constraints.xdc2default:default2
752default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2n
XD:/AD/CU_submission/Hardware_Syn_Lab/ssob/Lab06/Lab06.srcs/constrs_1/new/constraints.xdc2default:default2
752default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
RsRx2default:default2n
XD:/AD/CU_submission/Hardware_Syn_Lab/ssob/Lab06/Lab06.srcs/constrs_1/new/constraints.xdc2default:default2
762default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2n
XD:/AD/CU_submission/Hardware_Syn_Lab/ssob/Lab06/Lab06.srcs/constrs_1/new/constraints.xdc2default:default2
762default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
RsTx2default:default2n
XD:/AD/CU_submission/Hardware_Syn_Lab/ssob/Lab06/Lab06.srcs/constrs_1/new/constraints.xdc2default:default2
772default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2n
XD:/AD/CU_submission/Hardware_Syn_Lab/ssob/Lab06/Lab06.srcs/constrs_1/new/constraints.xdc2default:default2
772default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
RsTx2default:default2n
XD:/AD/CU_submission/Hardware_Syn_Lab/ssob/Lab06/Lab06.srcs/constrs_1/new/constraints.xdc2default:default2
782default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2n
XD:/AD/CU_submission/Hardware_Syn_Lab/ssob/Lab06/Lab06.srcs/constrs_1/new/constraints.xdc2default:default2
782default:default8@Z17-55h px�
�
Finished Parsing XDC File [%s]
178*designutils2n
XD:/AD/CU_submission/Hardware_Syn_Lab/ssob/Lab06/Lab06.srcs/constrs_1/new/constraints.xdc2default:default8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2l
XD:/AD/CU_submission/Hardware_Syn_Lab/ssob/Lab06/Lab06.srcs/constrs_1/new/constraints.xdc2default:default2.
.Xil/vga_test_propImpl.xdc2default:defaultZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1478.0162default:default2
0.0002default:defaultZ17-268h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0012default:default2
1478.0162default:default2
0.0002default:defaultZ17-268h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:10 ; elapsed = 00:00:15 . Memory (MB): peak = 1478.016 ; gain = 607.742
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Loading part: xc7a35tcpg236-1
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:10 ; elapsed = 00:00:15 . Memory (MB): peak = 1478.016 ; gain = 607.742
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:11 ; elapsed = 00:00:15 . Memory (MB): peak = 1478.016 ; gain = 607.742
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
I
%s
*synth21
Start Preparing Guide Design
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
�The reference checkpoint %s is not suitable for use with incremental synthesis for this design. Please regenerate the checkpoint for this design with -incremental_synth switch in the same Vivado session that synth_design has been run. Synthesis will continue with the default flow4740*oasys2s
_D:/AD/CU_submission/Hardware_Syn_Lab/ssob/Lab06/Lab06.srcs/utils_1/imports/synth_2/vga_test.dcp2default:defaultZ8-6895h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
|Finished Doing Graph Differ : Time (s): cpu = 00:00:11 ; elapsed = 00:00:15 . Memory (MB): peak = 1478.016 ; gain = 607.742
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Preparing Guide Design : Time (s): cpu = 00:00:11 ; elapsed = 00:00:15 . Memory (MB): peak = 1478.016 ; gain = 607.742
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:11 ; elapsed = 00:00:15 . Memory (MB): peak = 1478.016 ; gain = 607.742
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
U
%s
*synth2=
)

Incremental Synthesis Report Summary:

2default:defaulth p
x
� 
N
%s
*synth26
"1. Incremental synthesis run: no

2default:defaulth p
x
� 
a
%s
*synth2I
5   Reason for not running incremental synthesis : 


2default:defaulth p
x
� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}4868*oasysZ8-7130h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   32 Bit       Adders := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   10 Bit       Adders := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    2 Bit       Adders := 1     
2default:defaulth p
x
� 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               12 Bit    Registers := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               10 Bit    Registers := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                2 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                1 Bit    Registers := 13    
2default:defaulth p
x
� 
?
%s
*synth2'
+---Multipliers : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	               4x32  Multipliers := 6     
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   12 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    1 Bit        Muxes := 2     
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2j
VPart Resources:
DSPs: 90 (col length:60)
BRAMs: 100 (col length: RAMB18 60 RAMB36 30)
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
j
%s
*synth2R
>DSP Report: Generating DSP rgb_reg2, operation Mode is: A*B2.
2default:defaulth p
x
� 
i
%s
*synth2Q
=DSP Report: register rgb_reg2 is absorbed into DSP rgb_reg2.
2default:defaulth p
x
� 
i
%s
*synth2Q
=DSP Report: operator rgb_reg2 is absorbed into DSP rgb_reg2.
2default:defaulth p
x
� 
i
%s
*synth2Q
=DSP Report: operator rgb_reg2 is absorbed into DSP rgb_reg2.
2default:defaulth p
x
� 
u
%s
*synth2]
IDSP Report: Generating DSP rgb_reg2, operation Mode is: (PCIN>>17)+A*B2.
2default:defaulth p
x
� 
i
%s
*synth2Q
=DSP Report: register rgb_reg2 is absorbed into DSP rgb_reg2.
2default:defaulth p
x
� 
i
%s
*synth2Q
=DSP Report: operator rgb_reg2 is absorbed into DSP rgb_reg2.
2default:defaulth p
x
� 
i
%s
*synth2Q
=DSP Report: operator rgb_reg2 is absorbed into DSP rgb_reg2.
2default:defaulth p
x
� 
j
%s
*synth2R
>DSP Report: Generating DSP rgb_reg2, operation Mode is: A*B2.
2default:defaulth p
x
� 
i
%s
*synth2Q
=DSP Report: register rgb_reg2 is absorbed into DSP rgb_reg2.
2default:defaulth p
x
� 
i
%s
*synth2Q
=DSP Report: operator rgb_reg2 is absorbed into DSP rgb_reg2.
2default:defaulth p
x
� 
i
%s
*synth2Q
=DSP Report: operator rgb_reg2 is absorbed into DSP rgb_reg2.
2default:defaulth p
x
� 
u
%s
*synth2]
IDSP Report: Generating DSP rgb_reg2, operation Mode is: (PCIN>>17)+A*B2.
2default:defaulth p
x
� 
i
%s
*synth2Q
=DSP Report: register rgb_reg2 is absorbed into DSP rgb_reg2.
2default:defaulth p
x
� 
i
%s
*synth2Q
=DSP Report: operator rgb_reg2 is absorbed into DSP rgb_reg2.
2default:defaulth p
x
� 
i
%s
*synth2Q
=DSP Report: operator rgb_reg2 is absorbed into DSP rgb_reg2.
2default:defaulth p
x
� 
j
%s
*synth2R
>DSP Report: Generating DSP rgb_reg2, operation Mode is: A*B2.
2default:defaulth p
x
� 
i
%s
*synth2Q
=DSP Report: register rgb_reg2 is absorbed into DSP rgb_reg2.
2default:defaulth p
x
� 
i
%s
*synth2Q
=DSP Report: operator rgb_reg2 is absorbed into DSP rgb_reg2.
2default:defaulth p
x
� 
i
%s
*synth2Q
=DSP Report: operator rgb_reg2 is absorbed into DSP rgb_reg2.
2default:defaulth p
x
� 
u
%s
*synth2]
IDSP Report: Generating DSP rgb_reg2, operation Mode is: (PCIN>>17)+A*B2.
2default:defaulth p
x
� 
i
%s
*synth2Q
=DSP Report: register rgb_reg2 is absorbed into DSP rgb_reg2.
2default:defaulth p
x
� 
i
%s
*synth2Q
=DSP Report: operator rgb_reg2 is absorbed into DSP rgb_reg2.
2default:defaulth p
x
� 
i
%s
*synth2Q
=DSP Report: operator rgb_reg2 is absorbed into DSP rgb_reg2.
2default:defaulth p
x
� 
j
%s
*synth2R
>DSP Report: Generating DSP rgb_reg2, operation Mode is: A*B2.
2default:defaulth p
x
� 
i
%s
*synth2Q
=DSP Report: register rgb_reg2 is absorbed into DSP rgb_reg2.
2default:defaulth p
x
� 
i
%s
*synth2Q
=DSP Report: operator rgb_reg2 is absorbed into DSP rgb_reg2.
2default:defaulth p
x
� 
i
%s
*synth2Q
=DSP Report: operator rgb_reg2 is absorbed into DSP rgb_reg2.
2default:defaulth p
x
� 
u
%s
*synth2]
IDSP Report: Generating DSP rgb_reg2, operation Mode is: (PCIN>>17)+A*B2.
2default:defaulth p
x
� 
i
%s
*synth2Q
=DSP Report: register rgb_reg2 is absorbed into DSP rgb_reg2.
2default:defaulth p
x
� 
i
%s
*synth2Q
=DSP Report: operator rgb_reg2 is absorbed into DSP rgb_reg2.
2default:defaulth p
x
� 
i
%s
*synth2Q
=DSP Report: operator rgb_reg2 is absorbed into DSP rgb_reg2.
2default:defaulth p
x
� 
j
%s
*synth2R
>DSP Report: Generating DSP rgb_reg2, operation Mode is: A*B2.
2default:defaulth p
x
� 
i
%s
*synth2Q
=DSP Report: register rgb_reg2 is absorbed into DSP rgb_reg2.
2default:defaulth p
x
� 
i
%s
*synth2Q
=DSP Report: operator rgb_reg2 is absorbed into DSP rgb_reg2.
2default:defaulth p
x
� 
i
%s
*synth2Q
=DSP Report: operator rgb_reg2 is absorbed into DSP rgb_reg2.
2default:defaulth p
x
� 
u
%s
*synth2]
IDSP Report: Generating DSP rgb_reg2, operation Mode is: (PCIN>>17)+A*B2.
2default:defaulth p
x
� 
i
%s
*synth2Q
=DSP Report: register rgb_reg2 is absorbed into DSP rgb_reg2.
2default:defaulth p
x
� 
i
%s
*synth2Q
=DSP Report: operator rgb_reg2 is absorbed into DSP rgb_reg2.
2default:defaulth p
x
� 
i
%s
*synth2Q
=DSP Report: operator rgb_reg2 is absorbed into DSP rgb_reg2.
2default:defaulth p
x
� 
j
%s
*synth2R
>DSP Report: Generating DSP rgb_reg2, operation Mode is: A*B2.
2default:defaulth p
x
� 
i
%s
*synth2Q
=DSP Report: register rgb_reg2 is absorbed into DSP rgb_reg2.
2default:defaulth p
x
� 
i
%s
*synth2Q
=DSP Report: operator rgb_reg2 is absorbed into DSP rgb_reg2.
2default:defaulth p
x
� 
i
%s
*synth2Q
=DSP Report: operator rgb_reg2 is absorbed into DSP rgb_reg2.
2default:defaulth p
x
� 
u
%s
*synth2]
IDSP Report: Generating DSP rgb_reg2, operation Mode is: (PCIN>>17)+A*B2.
2default:defaulth p
x
� 
i
%s
*synth2Q
=DSP Report: register rgb_reg2 is absorbed into DSP rgb_reg2.
2default:defaulth p
x
� 
i
%s
*synth2Q
=DSP Report: operator rgb_reg2 is absorbed into DSP rgb_reg2.
2default:defaulth p
x
� 
i
%s
*synth2Q
=DSP Report: operator rgb_reg2 is absorbed into DSP rgb_reg2.
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:16 ; elapsed = 00:00:23 . Memory (MB): peak = 1478.016 ; gain = 607.742
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
2default:defaulth px� 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px� 
�
%s*synth2p
\
DSP: Preliminary Mapping Report (see note below. The ' indicates corresponding REG is set)
2default:defaulth px� 
�
%s*synth2�
�+-------------+-----------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
2default:defaulth px� 
�
%s*synth2�
�|Module Name  | DSP Mapping     | A Size | B Size | C Size | D Size | P Size | AREG | BREG | CREG | DREG | ADREG | MREG | PREG | 
2default:defaulth px� 
�
%s*synth2�
�+-------------+-----------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
2default:defaulth px� 
�
%s*synth2�
�|vga_gradient | A*B2            | 18     | 5      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 0    | 
2default:defaulth px� 
�
%s*synth2�
�|vga_gradient | (PCIN>>17)+A*B2 | 16     | 5      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 0    | 
2default:defaulth px� 
�
%s*synth2�
�|vga_gradient | A*B2            | 18     | 5      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 0    | 
2default:defaulth px� 
�
%s*synth2�
�|vga_gradient | (PCIN>>17)+A*B2 | 16     | 5      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 0    | 
2default:defaulth px� 
�
%s*synth2�
�|vga_gradient | A*B2            | 18     | 5      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 0    | 
2default:defaulth px� 
�
%s*synth2�
�|vga_gradient | (PCIN>>17)+A*B2 | 16     | 5      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 0    | 
2default:defaulth px� 
�
%s*synth2�
�|vga_gradient | A*B2            | 18     | 5      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 0    | 
2default:defaulth px� 
�
%s*synth2�
�|vga_gradient | (PCIN>>17)+A*B2 | 16     | 5      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 0    | 
2default:defaulth px� 
�
%s*synth2�
�|vga_gradient | A*B2            | 18     | 5      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 0    | 
2default:defaulth px� 
�
%s*synth2�
�|vga_gradient | (PCIN>>17)+A*B2 | 16     | 5      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 0    | 
2default:defaulth px� 
�
%s*synth2�
�|vga_gradient | A*B2            | 18     | 5      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 0    | 
2default:defaulth px� 
�
%s*synth2�
�|vga_gradient | (PCIN>>17)+A*B2 | 16     | 5      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 0    | 
2default:defaulth px� 
�
%s*synth2�
�+-------------+-----------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+

2default:defaulth px� 
�
%s*synth2�
�Note: The table above is a preliminary report that shows the DSPs inferred at the current stage of the synthesis flow. Some DSP may be reimplemented as non DSP primitives later in the synthesis flow. Multiple instantiated DSPs are reported only once.
2default:defaulth px� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
2default:defaulth px� 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:22 ; elapsed = 00:00:31 . Memory (MB): peak = 1478.016 ; gain = 607.742
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
}Finished Timing Optimization : Time (s): cpu = 00:00:27 ; elapsed = 00:00:39 . Memory (MB): peak = 1526.988 ; gain = 656.715
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
|Finished Technology Mapping : Time (s): cpu = 00:00:28 ; elapsed = 00:00:41 . Memory (MB): peak = 1536.020 ; gain = 665.746
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
vFinished IO Insertion : Time (s): cpu = 00:00:31 ; elapsed = 00:00:46 . Memory (MB): peak = 1536.020 ; gain = 665.746
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:31 ; elapsed = 00:00:46 . Memory (MB): peak = 1536.020 ; gain = 665.746
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:31 ; elapsed = 00:00:46 . Memory (MB): peak = 1536.020 ; gain = 665.746
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:31 ; elapsed = 00:00:46 . Memory (MB): peak = 1536.020 ; gain = 665.746
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:31 ; elapsed = 00:00:46 . Memory (MB): peak = 1536.020 ; gain = 665.746
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:31 ; elapsed = 00:00:46 . Memory (MB): peak = 1536.020 ; gain = 665.746
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
i
%s
*synth2Q
=
DSP Final Report (the ' indicates corresponding REG is set)
2default:defaulth p
x
� 
�
%s
*synth2�
+-------------+---------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
2default:defaulth p
x
� 
�
%s
*synth2�
�|Module Name  | DSP Mapping   | A Size | B Size | C Size | D Size | P Size | AREG | BREG | CREG | DREG | ADREG | MREG | PREG | 
2default:defaulth p
x
� 
�
%s
*synth2�
+-------------+---------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
2default:defaulth p
x
� 
�
%s
*synth2�
�|vga_gradient | A*B'          | 17     | 4      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 0    | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|vga_gradient | PCIN>>17+A*B' | 15     | 4      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 0    | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|vga_gradient | A*B'          | 17     | 4      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 0    | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|vga_gradient | PCIN>>17+A*B' | 15     | 4      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 0    | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|vga_gradient | A*B'          | 17     | 4      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 0    | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|vga_gradient | PCIN>>17+A*B' | 15     | 4      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 0    | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|vga_gradient | A*B'          | 17     | 4      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 0    | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|vga_gradient | PCIN>>17+A*B' | 15     | 4      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 0    | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|vga_gradient | A*B'          | 17     | 4      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 0    | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|vga_gradient | PCIN>>17+A*B' | 15     | 4      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 0    | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|vga_gradient | A*B'          | 17     | 4      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 0    | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|vga_gradient | PCIN>>17+A*B' | 15     | 4      | -      | -      | 48     | 0    | 1    | -    | -    | -     | 0    | 0    | 
2default:defaulth p
x
� 
�
%s
*synth2�
�+-------------+---------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+

2default:defaulth p
x
� 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px� 
E
%s*synth2-
+------+--------+------+
2default:defaulth px� 
E
%s*synth2-
|      |Cell    |Count |
2default:defaulth px� 
E
%s*synth2-
+------+--------+------+
2default:defaulth px� 
E
%s*synth2-
|1     |BUFG    |     1|
2default:defaulth px� 
E
%s*synth2-
|2     |CARRY4  |   374|
2default:defaulth px� 
E
%s*synth2-
|3     |DSP48E1 |    12|
2default:defaulth px� 
E
%s*synth2-
|4     |LUT1    |    48|
2default:defaulth px� 
E
%s*synth2-
|5     |LUT2    |   537|
2default:defaulth px� 
E
%s*synth2-
|6     |LUT3    |   591|
2default:defaulth px� 
E
%s*synth2-
|7     |LUT4    |   569|
2default:defaulth px� 
E
%s*synth2-
|8     |LUT5    |   294|
2default:defaulth px� 
E
%s*synth2-
|9     |LUT6    |   592|
2default:defaulth px� 
E
%s*synth2-
|10    |MUXF7   |    12|
2default:defaulth px� 
E
%s*synth2-
|11    |FDCE    |    24|
2default:defaulth px� 
E
%s*synth2-
|12    |FDRE    |    43|
2default:defaulth px� 
E
%s*synth2-
|13    |IBUF    |    16|
2default:defaulth px� 
E
%s*synth2-
|14    |OBUF    |    14|
2default:defaulth px� 
E
%s*synth2-
+------+--------+------+
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:31 ; elapsed = 00:00:46 . Memory (MB): peak = 1536.020 ; gain = 665.746
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
r
%s
*synth2Z
FSynthesis finished with 0 errors, 1 critical warnings and 1 warnings.
2default:defaulth p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:25 ; elapsed = 00:00:44 . Memory (MB): peak = 1536.020 ; gain = 557.859
2default:defaulth p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:31 ; elapsed = 00:00:46 . Memory (MB): peak = 1536.020 ; gain = 665.746
2default:defaulth p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0292default:default2
1547.8592default:default2
0.0002default:defaultZ17-268h px� 
g
-Analyzing %s Unisim elements for replacement
17*netlist2
3982default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
�
�Netlist '%s' is not ideal for floorplanning, since the cellview '%s' contains a large number of primitives.  Please consider enabling hierarchy in synthesis if you want to do floorplanning.
310*netlist2
vga_test2default:default2 
vga_gradient2default:defaultZ29-101h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0012default:default2
1551.6992default:default2
0.0002default:defaultZ17-268h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
h
%Synth Design complete | Checksum: %s
562*	vivadotcl2
c112104c2default:defaultZ4-1430h px� 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
302default:default2
62default:default2
52default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:342default:default2
00:00:522default:default2
1551.6992default:default2
1059.8482default:defaultZ17-268h px� 
~
4The following parameters have non-default value.
%s
395*common2&
general.maxThreads2default:defaultZ17-600h px� 
u
%s6*runtcl2Y
ESynthesis results are not added to the cache due to CRITICAL_WARNING
2default:defaulth px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2c
OD:/AD/CU_submission/Hardware_Syn_Lab/ssob/Lab06/Lab06.runs/synth_2/vga_test.dcp2default:defaultZ17-1381h px� 
�
%s4*runtcl2z
fExecuting : report_utilization -file vga_test_utilization_synth.rpt -pb vga_test_utilization_synth.pb
2default:defaulth px� 
�
Exiting %s at %s...
206*common2
Vivado2default:default2,
Tue Oct 31 16:21:03 20232default:defaultZ17-206h px� 


End Record