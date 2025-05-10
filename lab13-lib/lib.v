////////////////////////////////////////////////////////////////////////////////
// this compiles all units if none are specified                              //
////////////////////////////////////////////////////////////////////////////////
`ifndef priority7
 `ifndef latchrs
  `ifndef dffrs
   `ifndef drive8
    `define priority7
    `define latchrs
    `define dffrs
    `define drive8
   `endif
  `endif
 `endif
`endif

////////////////////////////////////////////////////////////////////////////////
// priority encoder outputs number of highest priority input                  //
// lowest numbered input has highest priority                                 //
// this is a combinational block so should use blocking assignments           //
////////////////////////////////////////////////////////////////////////////////
`ifdef priority7
module priority7 ( y, a ) ;

  output reg  [2:0] y ;
  input  wire [7:1] a ;

  always @(*) begin
    case (a)
      7'bxxxxxx1 : y = 3'b001 ;
      7'bxxxxx10 : y = 3'b010 ;
      7'bxxxx100 : y = 3'b011 ;
      7'bxxx1000 : y = 3'b100 ;
      7'bxx10000 : y = 3'b101 ;
      7'bx100000 : y = 3'b110 ;
      7'b1000000 : y = 3'b111 ;
      default     : y = 3'b000 ;
    endcase
  end

endmodule
`endif


////////////////////////////////////////////////////////////////////////////////
// latch with active-high enable and active-low asynchronous reset and set    //
// set has priority over reset                                                //
// this is a combinational block modeling a sequential device                 //
// so must use nonblocking assignments                                        //
////////////////////////////////////////////////////////////////////////////////
`ifdef latchrs
module latchrs ( q, e, d, r, s ) ;

  output reg  q ;
  input  wire e, d, r, s ;

  always @(*) begin: latch 
    if (r == 1'b1 && s == 1'b0) begin
       q<= 1'b1;
    end
    else if(s == 1'b0 && r == 1'b0) begin
      q <= 1'b1;
    end
     else if (s == 1'b1 && r == 1'b1 && d == 1'b1) begin
      q<= 1'b1;
    end
    else if (s == 1'b1 && (r == 1'b0 || r == 1'b1) ) begin
      q<= 1'b0;
    end
    else begin
      q<= 1'b0;
    end
  end

// do not remove comment below
// cadence async_set_reset "s, r"

endmodule
`endif


////////////////////////////////////////////////////////////////////////////////
// flop-flop with active-high clock and enable and                            //
// active-low asynchronous reset and set. set has priority over reset.        //
// this is a sequential block so must use nonblocking assignments             //
////////////////////////////////////////////////////////////////////////////////
`ifdef dffrs
module dffrs ( q, c, d, e, r, s ) ;

  output reg  q ;
  input  wire c, d, e, r, s ;

  always @(*) begin
    if (r == 1'b1 && s == 1'b0) begin
       q<= 1'b1;
    end
    else if(s == 1'b0 && r == 1'b0) begin
      q <= 1'b1;
    end
     else if (s == 1'b1 && r == 1'b1 && d == 1'b1) begin
      q<= 1'b1;
    end
    else if (s == 1'b1 && (r == 1'b0 || r == 1'b1) ) begin
      q<= 1'b0;
    end
    else begin
      q<= 1'b0;
    end
  end


endmodule
`endif


////////////////////////////////////////////////////////////////////////////////
// bus driver                                                                 //
// output is high-impedance when not enabled                                  //
// this is a combinational block                                              //
////////////////////////////////////////////////////////////////////////////////
`ifdef drive8
module drive8 ( y, a, e ) ;

  output reg  [7:0] y ;
  input  wire [7:0] a ;
  input  wire       e ;
  always @(*) begin
    if (e) begin
      y <= a;
    end
    else begin
      y <= 8'bz;
    end
  end

endmodule
`endif

