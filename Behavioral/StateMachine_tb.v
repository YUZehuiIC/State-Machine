// -----------------------------------------------------------------------------------------
// Version | Programmer                                     | Date       | Remark   
// -----------------------------------------------------------------------------------------
// V1      | Dr Kwen-Siong Chong (kschong@ntu.edu.sg)       | 01/08/2013 | Initial version
// -----------------------------------------------------------------------------------------  
//
//  The code is a test benchmark for checking a synchronous-logic full adder
// The code is for teaching purpose in the NTU-TUM class, NM6008. 
//`timescale 1ns/1ps

module StateMachine_tb;

parameter CLK_T = 50;
parameter N = 8;

reg CLK, NRST, start, rst, CIN, A, B;

wire S, COUT;//, state;

// InputVector
reg [4:0] REG_DATA [N-1:0];

integer file1, i;

//initial $sdf_annotate("Syn_StateMachine.sdf", SM1);

StateMachine SM1 (
	.CLK(CLK), 
	.NRST(NRST), 	
	.start(start), 
	.rst(rst), 
	.CIN(CIN), 
	.A(A), 
	.B(B),
	.S(S),
	.COUT(COUT) 
	);

initial
	begin
		file1 = $fopen("./Check.txt");
    	if (!file1) $finish;

    	$readmemb("./InputVector.txt", REG_DATA);
	end

// initialization: all inputs except CLK
initial
  	begin
		NRST = 0; // 0 Effective
		start = 0; // 1 Effective
		rst = 0;// 1 Effective: reset initially
    	CIN = 0;
    	A = 0;
    	B = 0;
		#CLK_T NRST = 1;// Delay time here should be less than CLK_T(half of CLK period)
		//$vcdpluson(SM1);

		$fdisplay(file1, "Index_i\t\tstart\trst\tB\tA\tCIN\tS\tCOUT");

		for (i = 0; i < N; i = i + 1)
			begin
				{start, rst, B, A, CIN} = REG_DATA[i];
				$fdisplay(file1, "%d\t\t%d\t%d\t%d\t%d\t%d\t%d\t%d", i, start, rst, B, A, CIN, S, COUT);
				#(CLK_T*6);
			end
		
		$fclose(file1);
		//$vcdplusoff(SM1);
		$finish;
	end

// Clock genertor
initial
	begin
		CLK = 0;
		forever #CLK_T CLK = !CLK; // Every CLK_T, CLK flips -> CLK_T is a half of the CLK period
	end

//
initial
	begin
		#(1000*CLK_T);
		$finish;
	end

endmodule
