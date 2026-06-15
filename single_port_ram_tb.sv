
module tab#(parameter add_width =4, parameter data_width=32, parameter depth=16);

wire   [data_width-1:0] read;

reg [ data_width-1:0] write;

reg clk, restn, write_1_read_0_enable;

reg [add_width-1:0] addr;

// inst / conenction

 des d0(.read(read), 
	 .write(write), 
	 .clk(clk), 
	 .restn(restn), 
	 .write_1_read_0_enable(write_1_read_0_enable), 
	 .addr(addr) 
	 );

	 //clock generation
	 always #5 clk = ~clk;

	 initial begin
		 clk <=0; 
		 restn <=0;
		 write <=0;
		 //read <=0;
		 
		 @(posedge clk) restn <=1;

		 for(int i=0; i<10; i++)begin
			 @(posedge clk);
			 write_1_read_0_enable <=$random;
			 write <= $random;
			 addr <=$random;


	 end

 end
 initial begin
	 $monitor("write_read_enable=%b addr=%0d , write_data=%0d  read_data=%0d", write_1_read_0_enable, addr, write,read);
 end

 initial begin
	 #1000;
	 $finish();
 end

 endmodule 


	        






 
