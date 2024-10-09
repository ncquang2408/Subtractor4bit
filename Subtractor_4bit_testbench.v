`timescale 1ps/1ps
module Subtractor_4bit_testbench; 
	reg [3:0] A; 
	reg [3:0] B; 
	reg Bin; 
	wire [3:0] D; 
	wire Bout; 
	
	
	Subtractor_4bit dut ( 
	.A(A), 
	.B(B), 
	.Bin(Bin),  
	.D(D), 
	.Bout(Bout) 
	); 
	
	
	initial begin
	$monitor("At time %0t: A=%b B=%b, Bin=%b, D=%b, Bout=%b",$time, A,B,Bin,D,Bout);
	
	A = 4'b0000; 
	B = 4'b0000; 
	Bin = 0; 
	
	
	// Test case 1: A > B , Bin = 0	
	//D always gives positive value so Bout will be turned on 0 in this case
	#15; A = 4'b1110; B = 4'b1100;	// (14 - 12) 
	if (Bout == 1'b1) //if Bout in previous turned on 1, set Bin = 1
		Bin = 1'b1;
	else
		Bin = 1'b0;
	
	// Test case 2: A = B , Bin = 0
	// D always gives 0 value so Bout will be turned on 0 in this case
	#15; A = 4'b1010; B = 4'b1010; //(10 - 10)
	if (Bout == 1'b1) //if Bout in previous turned on 1, set Bin = 1
		Bin = 1'b1;
	else
		Bin = 1'b0;
	
	// Test case 3: A < B , Bin = 0  
	// D always gives negative value so Bout will be turned on 1 in this case
	#15; A = 4'b0110; B = 4'b1011;	// (6 - 11) 
	if (Bout == 1'b1) //if Bout in previous turned on 1, set Bin = 1
		Bin = 1'b1;
	else 
		Bin = 1'b0;
	
	// Test case 4: A = B , Bin = 1 
	// D always gives 15 value so Bout will be turned on 1 in this case
	#15; A = 4'b0101; B = 4'b0101;	// (5 - 5)
	if (Bout == 1'b1) //if Bout in previous turned on 1, set Bin = 1
		Bin = 1'b1;
	else
		Bin = 1'b0;
	
	// Test case 5: A < B, Bin = 1;
	// D always gives negative value so Bout will be turned on 1 in this case
	#15; A = 4'b1100; B = 4'b1111; // (12 - 15)
	if (Bout == 1'b1) //if Bout in previous turned on 1, set Bin = 1
		Bin = 1'b1;
	else
		Bin = 1'b0;
	
	//Test case 6: A > B, Bin = 1;
	// D always gives positive value (greater or equal 0) so Bout will be turned on 0 in this case
	#15; A = 4'b1001; B = 4'b0011; // (9 - 3)
	if (Bout == 1'b1) //if Bout in previous turned on 1, set Bin = 1
		Bin = 1'b1;
	else
		Bin = 1'b0;
	
	end
endmodule 