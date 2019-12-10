`timescale 1ns / 10 ps
module image_TB;
  reg clk; reg rst; reg ena; wire load; wire m_out;
  reg [7:0] DataSource[0:320*240-1];
  reg [7:0] sobel_out_data [0:320*240-1];
  integer save_picture;
  integer i;
reg [7:0] pixel;
wire wDAL_sobel;
wire [9:0] wSobel;
wire [9:0] Sobel_Out;
wire [9:0] Sobel_In;

 
initial
begin
  
  $readmemh("imgdata.txt",DataSource);//????
   #20
	$display("0x00: %h",DataSource[8'h00]);
	
end 
reg [19:0] cnt;
initial cnt = 0;

always @(posedge clk)
begin 
 if (!rst) 
 cnt <= 20'b0;
 else  cnt <= cnt +1;
end
always @(negedge clk)
begin
pixel<=DataSource[cnt];
sobel_out_data[cnt] <= Sobel_Out[9:2] ;
end

always @ (negedge clk)

begin

if (cnt > 320*240-1)
begin
save_picture=$fopen("savedata.txt");
   
  for(i=0;i<320*240;i=i+1)
  begin
  #1 
  //$display(DataSource[i]);
   
  $fdisplay(save_picture,"%h",sobel_out_data[i]);
end
  $fclose(save_picture);
  $stop();
end

end
//begin
//  save_picture=$fopen("savedata.txt");
//  #40
//  for(i=0;i<320*240;i=i+1)
//  begin
//  #100
//  //$display(DataSource[i]);
//  pixel <= DataSource[i])
//  $fdisplay(save_picture,"%h",DataSource[i]);
//end
//  $fclose(save_picture);
//end


sobel sobel0 (
  .iCLK(clk),
  .iRST_N(rst),
  .iTHRESHOLD({8'b11110000}),
  .iDVAL(1'b1),
  .iDATA({pixel,2'b00}), // gray
 // .oDVAL(wDAL_sobel),
  .oDATA(Sobel_Out)
  );
  




initial begin   clk = 1'b0;   rst = 1'b0;   ena = 1'b0;   #40   rst = 1'b1;   #50   ena = 1'b1; end

always #100 clk = ~clk;

   
endmodule
