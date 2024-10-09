module Subtractor_4bit(
    input [3:0] A,
    input [3:0] B,
    input Bin,
    output [3:0] D,
    output Bout
);

    wire b1, b2, b3;
	 
	 Subtractor_1bit s1 (
	 .A(A[0]),
	 .B(B[0]),
	 .Bin(Bin),
	 .D(D[0]),
	 .Bout(b1)
	 );
	 
	 Subtractor_1bit s2 (
	 .A(A[1]),
	 .B(B[1]),
	 .Bin(b1),
	 .D(D[1]),
	 .Bout(b2)
	 );
	 
	 Subtractor_1bit s3 (
	 .A(A[2]),
	 .B(B[2]),
	 .Bin(b2),
	 .D(D[2]),
	 .Bout(b3)
	 );
	 
	 Subtractor_1bit s4 (
	 .A(A[3]),
	 .B(B[3]),
	 .Bin(b3),
	 .D(D[3]),
	 .Bout(Bout)
	 );
	 
endmodule 