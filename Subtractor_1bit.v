module Subtractor_1bit (
    input A,
    input B,
    input Bin,
    output D,
    output Bout
);
	 
    wire x1,y1,z1;
	
	 //Output the result
    assign   D  = A ^ B ^ Bin;
	 
	 //Output the borrow bit
	 
    assign x1   = ~A & Bin;
    assign y1   = ~A & B;
    assign z1   = B & Bin;
	 
    assign Bout      = x1 | y1 | z1;
	 
endmodule


