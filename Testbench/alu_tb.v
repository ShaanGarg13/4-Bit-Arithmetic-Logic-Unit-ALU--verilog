module alu_tb;
  reg [3:0]A, B, S;
  reg M,Cn,signal;
  wire [3:0]F;
  wire comp,G,P,Cn4;
  alu uut(A,B,S,M,Cn,F,comp,G,P,Cn4,signal);
  initial begin
    repeat(5)
      begin
        #10;
        A = $random();
        B = $random();
        S = $random();
        M = $random();
        Cn = $random();
        signal = $random();
      end
  end
endmodule