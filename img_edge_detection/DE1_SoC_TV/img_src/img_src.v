module img_src(
oRed,
oGreen,
oBlue,							
VGA_CTRL_CLK,
DLY_RST_2,
SEL,
VGA_X,
VGA_Y,
VGA_Read

);


// 33.7khz 64.2hz   720*480 

input VGA_CTRL_CLK,DLY_RST_2,SEL,VGA_Read;
input [10:0] VGA_X;
input [10:0] VGA_Y;


output  [9:0]  oRed;
output  [9:0]  oGreen;
output  [9:0]  oBlue;

wire  BWDATA;
wire [23:0] bgr_data_raw;



assign oRed = SEL ? (BWDATA ? 10'b11_1111_1111 : 10'b0): {bgr_data_raw[23:16],2'b0 } ;
assign oGreen = SEL ? (BWDATA ? 10'b11_1111_1111 : 10'b0): {bgr_data_raw[15:8],2'b0 } ;
assign oBlue = SEL ? (BWDATA ? 10'b11_1111_1111 : 10'b0):  {bgr_data_raw[7:0],2'b0 } ;




//Addresss generator
`ifdef VGA_640x480p60 
parameter pix_stop = 640*480;
parameter Line_stop = 640;
`else
parameter pix_stop = 800*600;
parameter Line_stop = 800;


`endif

reg [18:0] ADDR;
reg [18:0] LineH;
reg [9:0] pMOVE;


always@(posedge VGA_CTRL_CLK,negedge DLY_RST_2)
begin
  if (!DLY_RST_2)
     ADDR<=19'd0;
	  
  else if (VGA_X==11'b0 && VGA_Y==11'b0)
  
     ADDR<= 19'd0 ;
	  
  else if (VGA_Read ==1'b1)
      ADDR<= ADDR +19'd1;
		
end






assign VGA_CLK_n = ~VGA_CTRL_CLK;

wire [18:0] newaddr ;
assign newaddr = (ADDR < 153600) ?  ADDR : ADDR - 153600 ;

	img_data	img_data_dut (
	.address ( newaddr[17:1] ),
	.clock ( VGA_CLK_n ),
	.q ( bgr_data_raw )
	);
	
	//////INDEX addr.

imgbw_data	img_data_inst (
	.address ( ADDR ),
	.clock ( VGA_CLK_n ),
	.q ( BWDATA)
	);


	
endmodule


