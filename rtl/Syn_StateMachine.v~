
module StateMachine ( CLK, NRST, start, rst, CIN, A, B, S, COUT );
  input CLK, NRST, start, rst, CIN, A, B;
  output S, COUT;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [1:0] state;
  wire   [1:0] next_state;

  DFC1 \state_reg[0]  ( .D(n8), .C(CLK), .RN(NRST), .Q(state[0]), .QN(n2) );
  DFC1 \state_reg[1]  ( .D(next_state[1]), .C(CLK), .RN(NRST), .Q(state[1]), 
        .QN(n1) );
  NOR23 U12 ( .A(rst), .B(n3), .Q(next_state[1]) );
  XNR20 U13 ( .A(state[1]), .B(state[0]), .Q(n3) );
  BUF2 U14 ( .A(next_state[0]), .Q(n8) );
  OAI210 U15 ( .A(rst), .B(n1), .C(n4), .Q(next_state[0]) );
  NAND30 U16 ( .A(n2), .B(n1), .C(start), .Q(n4) );
  XOR21 U17 ( .A(B), .B(A), .Q(n6) );
  NOR21 U18 ( .A(n7), .B(n1), .Q(COUT) );
  AOI221 U19 ( .A(CIN), .B(n6), .C(A), .D(B), .Q(n7) );
  NOR21 U20 ( .A(n5), .B(n2), .Q(S) );
  XNR21 U21 ( .A(CIN), .B(n6), .Q(n5) );
endmodule

