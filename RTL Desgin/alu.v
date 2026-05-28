module alu(A,B,S,M,Cn,F,comp,G,P,Cn4,signal);
  input [3:0]A; //input 1
  input [3:0]B; //input 2
  input [3:0]S; //function selection
  input M,Cn,signal; //mode, carry in, VCC/GND
  output reg [3:0]F; //function output
  output G,P,Cn4; // A=B, Generate, Propogate, Cout
  output reg comp;
 
  wire [3:0]p; //internal propogate
  wire [3:0]g; //internal generate
 
  //internal propogate
  assign p[0] = (A[0] & B[0]) & (S[3] & S[2]);
  assign p[1] = (A[1] & B[1]) & (S[3] & S[2]);
  assign p[2] = (A[2] & B[2]) & (S[3] & S[2]);
  assign p[3] = (A[3] & B[3]) & (S[3] & S[2]);
  //internal generate
  assign g[0] = ((A[0] & B[0]) & (S[1] & S[0])) + M;
  assign g[1] = ((A[1] & B[1]) & (S[1] & S[0])) + M;
  assign g[2] = ((A[2] & B[2]) & (S[1] & S[0])) + M;
  assign g[3] = ((A[3] & B[3]) & (S[1] & S[0])) + M;
  //propogate
  assign P = p[0] & p[1] & p[2] & p[3];
  //generate
  assign G = g[3] + (p[3] & g[2]) + (p[3] & p[2] & g[1]) + (p[3] & p[2] & p[1] & g[0]);
  // carry out
  assign Cn4 = G & (P + Cn);
 
 
  always @(*)
    begin
      // comp flag
      if (A == B)
      begin
        comp = 1;
        F = 4'b1111;
      end
      else
        comp = 0;
  // active low (GND)
      if (signal == 0)
        begin
          if (M == 1)
            begin
              //always @(*)
                //begin
                  case (S)
                    4'b00_00: F = (~A);
                    4'b00_01: F = ~(A & B);
                    4'b00_10: F = ~(A) + ~(B);
                    4'b00_11: F = 1;
                    4'b01_00: F = ~(A) + ~(B);
                    4'b01_01: F = ~(B);
                    4'b01_10: F = ~(A) ^ ~(B);
                    4'b01_11: F = (A) + ~(B);
                    4'b10_00: F = ~(A) & (B);
                    4'b10_01: F = (A) ^ (B);
                    4'b10_10: F = (B);
                    4'b10_11: F = A + B;
                    4'b11_00: F = 0;
                    4'b11_01: F = (A) & ~(B);
                    4'b11_10: F = (A) & (B);
                    4'b11_11: F = (A);
                    default F = 4'b0000;
                  endcase
                //end
            end
          else if (M == 0 && Cn == 0)
            begin
              //always @(*)
                //begin
                  case (S)
                    4'b00_00: F = (A) - 1;
                    4'b00_01: F = ((A) & (B)) - 1;
                    4'b00_10: F = ((A) & ~(B)) - 1;
                    4'b00_11: F = -1;
                    4'b01_00: F = A + ((A) + ~(B));
                    4'b01_01: F = ((A) & (B)) + ((A) + ~(B));
                    4'b01_10: F = (A) - (B) - 1;
                    4'b01_11: F = (A) + ~(B);
                    4'b10_00: F = (A) + ((A) + (B));
                    4'b10_01: F = (A) + (B);
                    4'b10_10: F = ((A) & ~(B)) + ((A) + (B));
                    4'b10_11: F = A + B;
                    4'b11_00: F = (A) + (A);
                    4'b11_01: F = ((A) & (B)) + (A);
                    4'b11_10: F = ((A) & ~(B)) - (A);
                    4'b11_11: F = (A);
                    default F = 4'b0000;
                  endcase
                //end
            end
        end

      // active high (VCC)
      // signal = 0
      else
        begin
          if (M == 1)
            begin
              //always @(*)
                //begin
                  case (S)
                    4'b00_00: F = (~A);
                    4'b00_01: F = ~(A) + ~(B);
                    4'b00_10: F = ~(A) & (B);
                    4'b00_11: F = 0;
                    4'b01_00: F = ~(A & B);
                    4'b01_01: F = ~(B);
                    4'b01_10: F = (A) ^ (B);
                    4'b01_11: F = (A) & ~(B);
                    4'b10_00: F = ~(A) + (B);
                    4'b10_01: F = ~(A) ^ ~(B);
                    4'b10_10: F = (B);
                    4'b10_11: F = (A) & (B);
                    4'b11_00: F = 1;
                    4'b11_01: F = (A) + ~(B);
                    4'b11_10: F = (A) + (B);
                    4'b11_11: F = (A);
                    default F = 4'b0000;
                  endcase
                //end
            end
          else if (M == 0 && Cn == 1)
            begin
              //always @(*)
                //begin
                  case (S)
                    4'b00_00: F = (A);
                    4'b00_01: F = (A) + (B);
                    4'b00_10: F = (A) + ~(B);
                    4'b00_11: F = -1;
                    4'b01_00: F = A + ((A) & ~(B));
                    4'b01_01: F = ((A) + (B)) + ((A) & ~(B));
                    4'b01_10: F = (A) - (B) - 1;
                    4'b01_11: F = ((A) & (B)) - 1;
                    4'b10_00: F = (A) + ((A) & (B));
                    4'b10_01: F = (A) + (B);
                    4'b10_10: F = ((A) + ~(B)) + ((A) & (B));
                    4'b10_11: F = ((A) & (B)) - 1;
                    4'b11_00: F = (A) + (A);
                    4'b11_01: F = ((A) + (B)) + (A);
                    4'b11_10: F = ((A) + ~(B)) + (A);
                    4'b11_11: F = (A) - 1;
                    default F = 4'b0000;
                  endcase
                //end
            end
        end
    end
 
endmodule

