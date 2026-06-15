module des#(parameter addr_width =4 , 
	    parameter data_width =32,
	    parameter depth =16)
	( input clk,restn, write_1_read_0_enable,  input[addr_width-1:0] addr, input [data_width -1:0] write,output reg [data_width-1:0] read);


	//internal memory
	reg [data_width-1:0] mem[depth];




	always @(posedge clk)begin
	if(!restn)

		for(int i=0; i<depth; i++)begin
	  mem[i] <= 0;
  end
       else if(write_1_read_0_enable)
	    mem[addr] <= write;
      else
	   read <= mem[addr];

     end






endmodule 
