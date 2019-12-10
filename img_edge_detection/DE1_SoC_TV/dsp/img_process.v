module img_process(
                     oRed,
							oGreen,
							oBlue,
			
iVGA_X,
iVGA_Y,
iVGA_CLK,
							iRed,
							iGreen,
							iBlue,
							VGA_Read,
							SW,
							CLK,
							RST);


output  [9:0]  oRed;
output  [9:0]  oGreen;
output  [9:0]  oBlue;

input [9:0] iRed;

input [9:0] iGreen;
input [9:0] iBlue;
							
input [10:0] iVGA_X;
input [10:0] iVGA_Y;
input iVGA_CLK;
							
							
							
input  [9:0]  SW;
input CLK,RST,VGA_Read;



wire [9:0] mRed;
wire [9:0] mGreen;
wire [9:0] mBlue;

wire [9:0] VGA_R_in;
wire [9:0] VGA_G_in;
wire [9:0] VGA_B_in;

reg [29:0] VGA_DATA ;

assign mRed =   SW[8] ? pRed:iRed;
assign mGreen = SW[8] ? pGreen:iGreen;
assign mBlue =  SW[8] ? pBlue:iBlue;

assign oRed = VGA_DATA[9:0] ;
assign oGreen = VGA_DATA[19:10];
assign oBlue = VGA_DATA[29:20] ;

wire [9:0] tGREY;
wire [9:0] GREY2BW ;

wire Sobel_Read,VGA_CTRL_CLK,DLY_RST_2;

wire [9:0] pRed;
wire [9:0] pGreen;
wire [9:0] pBlue;

img_src dut_img_src(
.oRed(pRed),
.oGreen(pGreen),
.oBlue(pBlue),							
.VGA_CTRL_CLK(VGA_CTRL_CLK),
.DLY_RST_2(DLY_RST_2),
.SEL(SW[9]),
.VGA_X(iVGA_X),
.VGA_Y(iVGA_Y),
.VGA_Read(VGA_Read)

);




assign GREY2BW = (tGREY > 8'b0111_1111) ? 10'b11_1111_1111 :10'b0 ; 


RGB2GREY DUT_GREY (mRed,mGreen,mBlue,tGREY);

//assign GREY2BW = (tGREY > {SW[7:4],6'b010_000}) ? 10'b11_1111_1111 :10'b0 ; 


wire [9:0] Sobel_Out;
wire [9:0] filter_in;
wire [9:0]  Sobel_In;

wire wDAL_sobel,wDAL_2_sobel,wDAL_3_sobel;


assign DLY_RST_2 = RST;
assign VGA_CTRL_CLK = CLK;
assign filter_in = tGREY;
assign Sobel_Read = VGA_Read;

Sobel DUT_10_sobel (
  .iCLK(VGA_CTRL_CLK),
  .iRST_N(DLY_RST_2),
  .iTHRESHOLD(8'b1000_0000),
  .iDVAL(Sobel_Read),
  .iDATA(Sobel_In), // gray
  .oDVAL(wDAL_sobel),
  .oDATA(Sobel_Out)
);



 medianfilterblock (
.KEY(1'b1),
 .iCLK(VGA_CTRL_CLK),
  .iRST_N(DLY_RST_2),
  .iDVAL(Sobel_Read),
  .iDATA(filter_in),
 // output reg       oDVAL,
 .oDATA(Sobel_In)
);

wire [9:0] Sobel_2_Out;

Sobel DUT_11_sobel (
  .iCLK(VGA_CTRL_CLK),
  .iRST_N(DLY_RST_2),
  .iTHRESHOLD({SW[7:4],4'b1000}),
  .iDVAL(Sobel_Read),
  .iDATA(GREY2BW), // gray
  .oDVAL(wDAL_2_sobel),
  .oDATA(Sobel_2_Out)
);

wire [9:0] Sobel_3_Out;

Sobel DUT_12_sobel (
  .iCLK(VGA_CTRL_CLK),
  .iRST_N(DLY_RST_2),
  .iTHRESHOLD({SW[7:4],4'b1000}),
  .iDVAL(Sobel_Read),
  .iDATA(tGREY), // gray
  .oDVAL(wDAL_3_sobel),
  .oDATA(Sobel_3_Out)
);



always @ (SW[3:0])
begin
   case(SW[3:0])
   4'b0000:VGA_DATA = {mBlue,mGreen,mRed};
   4'b0001:VGA_DATA = 30'b11_1111_1111_11_1111_1111_11_1111_1111;
   4'b0010:VGA_DATA = 30'h0;
   4'b0011:VGA_DATA = {GREY2BW,GREY2BW,GREY2BW};
   4'b0111:VGA_DATA = {tGREY,tGREY,tGREY};
   4'b1111:VGA_DATA = {Sobel_In,Sobel_In,Sobel_In};
	4'b1110:VGA_DATA = {Sobel_Out,Sobel_Out,Sobel_Out};//filter
	4'b1100:VGA_DATA = {Sobel_2_Out,Sobel_2_Out,Sobel_2_Out};//BW
	4'b1000:VGA_DATA = {Sobel_3_Out,Sobel_3_Out ,Sobel_3_Out};//GERY
	
	
	
 default:VGA_DATA = 30'b11_1111_1111_11_1111_1111_11_1111_1111;
	endcase
end


endmodule
