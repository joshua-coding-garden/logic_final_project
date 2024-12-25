module test(
output reg[3:0]S,//控制亮燈排數
output reg [7:0]Red,//紅色燈
output reg [7:0]Green,//綠色燈
output reg [7:0]Blue,//藍色燈
output reg [15:0]T,//
output reg [6:0]O,//
output reg beep,//叫聲
input [1:0]button,//玩家一左右
input [1:0]button2,//玩家二左右
output reg [1:0] COM,
input CLk,Clear
);
	reg [4:0]A_count,B_count;
	reg C_Count;
	reg[2:0]count;
	reg[3:0]count1;
	reg [2:0]kind;
	reg [1:0]endgame;
	reg mode,mode1,mode2,mode3,mode4,clear,change;
	reg [3:0]mode5,mode6,mode7,mode8,mode9;
	reg [3:0]mode10,mode11,mode12,mode13,mode14,mode15,mode16;
	reg [3:0]mode17,mode18,mode19,mode20,mode21,mode22,mode23,mode24,mode25,mode26;
	wire [7:0]red,blue,green,red1,blue1,green1,RED,GREEN,BLUE;
	wire [3:0]S2,S3;
	reg [3:0]SS;
	reg [7:0]red2,blue2,green2;
	divfreq F0(CLk,CLk_div);
	divfreq3 F3(CLk,CLk_div3);
	divfreq4 F5(CLk,CLk_div4);
	divfreq8 F8(CLk,CLk_div8);
	times A1(S2,red,green,blue,clear,button,CLk,Clear);
	times2 A2(S3,red1,green1,blue1,clear,button2,CLk,Clear);
	
     //初始設定
	initial
	begin
		count<=4'b0000;
	   A_count<=5'b00000;
	   B_count<=5'b00000;
	   S<=4'b1011;
	   Red <=8'b01111111;
	   Green<=8'b11111111;
	   Blue<=8'b11111110;
	   endgame<=2'b00;
	   kind<=3'b000;
	   clear=0;
	   change=0;
	   mode=0;
	   mode1=0;
	   mode2=0;
	   mode3=0;
	   mode4=0;
	   mode5<=3'b000;
	   mode6<=3'b000;
	   mode7<=3'b000;
	   mode8<=3'b000;
	   mode9<=3'b000;
	   mode10<=3'b000;
	   mode11<=3'b000;
	   mode12<=3'b000;
	   mode13<=3'b000;
	   mode14<=3'b000;
	   mode15<=3'b000;
	   mode16<=3'b000;
	   mode17<=3'b000;
	   mode18<=3'b000;
	   mode19<=3'b000;
	   mode20<=3'b000;
	   mode21<=3'b000;
	   mode22<=3'b000;
	   mode23<=3'b000;
	   mode24<=3'b000;
	   mode25<=3'b000;
	   mode26<=3'b000;
	   beep<=0;
		COM <= 2'b10;
		T <= 16'b1111111111111111;
		C_Count <= 1'b0;
	end
 
   //倒數時間
	always @(posedge CLk_div4)
	begin
		if (Clear) begin
			T <= 16'b1111111111111111;
			C_Count <= 1'b0;
		end
		else begin
			case (T)
				16'b0000000000000000: C_Count <= 1'b1;
				default: begin T <= {T[14:0], 1'b0}; C_Count <= 1'b0; end
			endcase
		end
	end

	 always @(posedge CLk_div8) begin
			case (COM)
				2'b10: begin
					case (A_count)
						5'b00000: O = 7'b1000000;
						5'b00001: O = 7'b1111001;
						5'b00011: O = 7'b0100100;
						5'b00111: O = 7'b0110000;
						5'b01111: O = 7'b0011001;
						5'b11111: O = 7'b0010010;
					endcase
					COM = 2'b01;
				end
				2'b01: begin
					case (B_count)
						5'b00000: O = 7'b1000000;
						5'b00001: O = 7'b1111001;
						5'b00011: O = 7'b0100100;
						5'b00111: O = 7'b0110000;
						5'b01111: O = 7'b0011001;
						5'b11111: O = 7'b0010010;
					endcase
					COM = 2'b10; 
				end
			endcase
		end
	    //球
	always @(posedge CLk_div3,posedge Clear)
	begin
	   if (Clear)  //清除
		begin
			SS<=4'b1100;
		   kind<=3'b000;
			endgame<=2'b00;
			change=0;
			beep<=0;
			mode=0;
		   mode1=0;
		   mode2=0;
		   mode3=0;
		   mode4=0;
		   mode5<=3'b000;
		   mode6<=3'b000;
		   mode7<=3'b000;
			mode8<=3'b000;
			mode9<=3'b000;
			mode10<=3'b000;
			mode11<=3'b000;
			mode12<=3'b000;
			mode13<=3'b000;
			mode14<=3'b000;
			mode15<=3'b000;
			mode16<=3'b000;
			mode17<=3'b000;
			mode18<=3'b000;
			mode19<=3'b000;
			mode20<=3'b000;
			mode21<=3'b000;
			mode22<=3'b000;
			mode23<=3'b000;
			mode24<=3'b000;
			mode25<=3'b000;
			mode26<=3'b000;
			red2 <=8'b11111111;
			green2<=8'b10111111;
			blue2<=8'b11111111;
			A_count<=5'b0;
			B_count<=5'b0;
			clear=0;
		end
		//當clear變數=1的時候初始化
      else if (clear==1)
		begin
			SS<=4'b1100;
			kind<=3'b000;
			beep<=0;
			mode=0;
			mode1=0;
			mode2=0;
			mode3=0;
			mode4=0;
			mode5<=3'b000;
			mode6<=3'b000;
			mode7<=3'b000;
			mode8<=3'b000;
			mode9<=3'b000;
			mode10<=3'b000;
			mode11<=3'b000;
			mode12<=3'b000;
			mode13<=3'b000;
			mode14<=3'b000;
			mode15<=3'b000;
			mode16<=3'b000;
			mode17<=3'b000;
			mode18<=3'b000;
			mode19<=3'b000;
			mode20<=3'b000;
			mode21<=3'b000;
			mode22<=3'b000;
			mode23<=3'b000;
			mode24<=3'b000;
			mode25<=3'b000;
			mode26<=3'b000;
			red2 <=8'b11111111;
			blue2<=8'b11111111;
			if (change==0)  //當change=0換紅色邊發球
			begin
				 green2<=8'b10111111;
				 mode=0;//球往上
			end
			else if (change==1) //當change=0換藍色邊發球
			begin
				 green2<=8'b11111101;
				 mode=1;//球往下
			end
			clear=0;
		end
		else
		begin
		   if(A_count==5'b11111||(C_Count==1'b1&&A_count>B_count))
			   endgame=2'b01;
			else if (B_count==5'b11111||(C_Count==1'b1&&A_count<B_count))
				endgame=2'b10;
			else if (C_Count==1'b1&&A_count==B_count)
				endgame=2'b11;
			else if (kind==3'b000)
			
			begin//球直上直下
			   if(mode==0)//球往上
				begin
					if (green2==8'b11111101)
					begin
					   if (SS==S3+2'b10)
						begin
							green2<=green2;	
						   if (mode19==3'b000)
							begin
							   mode19<=3'b001;
								kind<=3'b010;
								mode=1;
						   end
							else if (mode19==3'b001)
							begin
							   mode19<=3'b000;
							   kind<=3'b100;
								mode=1;
							end
						end
						else if (SS==S3+1'b1)
						begin
							green2<=green2;
							if (mode17==3'b000)
							begin
							    mode17<=3'b001;
								 kind<=3'b000;
							    mode=1;
							end
					      else if (mode17==3'b001)
							begin
							    mode17<=3'b010;
								 kind<=3'b000;
							    mode=1;
							end		
						   else if (mode17==3'b010)
							begin
							   mode17<=3'b011;
								kind<=3'b010;
								mode=1;
						   end
							else if (mode17==3'b011)
							begin
							   mode17<=3'b000;
							   kind<=3'b100;
								mode=1;
							end
						end
						else if (SS==S3)
						begin
							green2<=green2;
						   if (mode20==3'b000)
							begin
							   mode20<=3'b001;
								kind<=3'b010;
								mode=1;
						   end
							else if (mode20==3'b001)
							begin
							   mode20<=3'b000;
							   kind<=3'b100;
								mode=1;
							end
						end
						else //得分
						begin
							green2<={~(1'b0),green2[7:1]};
							A_count<={A_count[3:0],1'b1};
							clear=1;
							change=1;
							beep<=1;
						end
					end
					else
						green2<={~(1'b0),green2[7:1]};
				end
            else if(mode==1)//球往下
	         begin
					if (green2==8'b10111111)
					begin
					   if (SS==S2+2'b10)
						begin
							green2<=green2;
						   if (mode21==3'b000)
							begin
							   mode21<=3'b001;
								kind<=3'b001;
								mode=0;
						   end
							else if (mode21==3'b001)
							begin
							   mode21<=3'b000;
							   kind<=3'b011;
								mode=0;
							end
						end
						else if (SS==S2+1'b1)
						begin
							green2<=green2;
							if (mode18==3'b000)
							begin
							    mode18<=3'b001;
								 kind<=3'b000;
							    mode=0;
							end
					      else if (mode18==3'b001)
							begin
							    mode18<=3'b010;
								 kind<=3'b000;
							    mode=0;
							end		
						   else if (mode18==3'b010)
							begin
							   mode18<=3'b011;
								kind<=3'b001;
								mode=0;
						   end
							else if (mode18==3'b011)
							begin
							   mode18<=3'b000;
							   kind<=3'b011;
								mode=0;
							end
						end
					   else if (SS==S2)
						begin
							green2<=green2;
						   if (mode22==3'b000)
							begin
							   mode22<=3'b001;
								kind<=3'b001;
								mode=0;
						   end
							else if (mode22==3'b001)
							begin
							   mode22<=3'b000;
							   kind<=3'b011;
								mode=0;
							end
						end
						else//得分
						begin
						   green2<={green2[6:0],~(1'b0)};
							B_count<={B_count[3:0],1'b1};
							clear=1;
							change=0;
							beep<=1;
						end
				   end
					else
						green2<={green2[6:0],~(1'b0)};
			   end			
			end
			//從紅色右邊發球
			else if (kind==3'b001)
			begin
			   if (mode1==0)//球往上
				begin
					if (SS==4'b1111)
					begin
						green2<=green2;
						mode1=1;
					end
					else if (green2==8'b11111101)
					begin
					   if (SS==S3+1'b1||SS==S3+2'b10||SS==S3)
						begin
					       green2<=green2;
						    mode1=1;
						end
						else
						begin
						    green2<={~(1'b0),green2[7:1]};
					       SS=SS+1'b1;
							 A_count<={A_count[3:0],1'b1};
							 clear=1;
							 change=1;
							 beep<=1;
					   end
					end
					else
					begin
						green2<={~(1'b0),green2[7:1]};
					   SS=SS+1'b1;
					end	
				end
				else if (mode1==1)//球往下
				begin
					if (green2==8'b11111101)
					begin
					   if (SS==S3+2'b10)
						begin
							green2<=green2;
							if (mode5==3'b000)
							begin
							    kind<=3'b010;
								 mode5<=3'b001;
								 mode1=0;
							end
							else if (mode5==3'b001)
							begin
							    kind<=3'b100;
								 mode5<=3'b000;
								 mode1=0;
							end
						end
						else if (SS==S3+1'b1)
						begin
						    green2<=green2;
							 if (mode6==3'b000)
							 begin
							     kind<=3'b000;
								  mode6<=3'b001;
								  mode1=0;
							 end
							 else if (mode6==3'b001)
							 begin
							     kind<=3'b010;
								  mode6<=3'b010;
								  mode1=0;
							 end
							 else if (mode6==3'b010)
							 begin
							     kind<=3'b100;
								  mode6<=3'b000;
								  mode1=0;
							 end
						end
						else if (SS==S3)
						begin
						    green2<=green2;
							if (mode7==3'b000)
							begin
							    kind<=3'b010;
								 mode7<=3'b001;
								 mode1=0;
							end
							else if (mode7==3'b001)
							begin
							    kind<=3'b100;
								 mode7<=3'b000;
								 mode1=0;
							end
						end
						else if (SS==S3+2'b11)
						begin
						    green2<=green2;
							if (mode26==3'b000)
							begin
							    kind<=3'b010;
								 mode26<=3'b001;
								 mode1=0;
							end
							else if (mode26==3'b001)
							begin
							    kind<=3'b100;
								 mode26<=3'b000;
								 mode1=0;
							end
						end
						else
						begin
							green2<={~(1'b0),green2[7:1]};
							SS=SS-1'b1;
							A_count<={A_count[3:0],1'b1};
							clear=1;
							change=1;
							beep<=1;
						end
					end
					else
					begin
						green2<={~(1'b0),green2[7:1]};
				      SS=SS-1'b1;
				   end		
				end
			end
         //從藍色右邊發球
			else if (kind==3'b010)
			begin
				if (mode2==0)//球往上
				begin
					if (SS==4'b1000)
					begin
						green2<=green2;
						mode2=1;
					end
					else if (green2==8'b10111111)
					begin
					   if (SS==S2+1'b1||SS==S2+2'b10||SS==S2)
						begin
					       green2<=green2;
						    mode2=1;
						end
						else
						begin
						    green2<={green2[6:0],~(1'b0)};
					       SS=SS-1'b1;
							 B_count<={B_count[3:0],1'b1};
							 clear=1;
							 change=0;
							 beep<=1;
					   end
					end
					else
					begin
						green2<={green2[6:0],~(1'b0)};
					   SS=SS-1'b1;
					end	
				end
				else if (mode2==1)//球往下
				begin
					if (green2==8'b10111111)
					begin
						if (SS==S2+2'b10)
						begin
							green2<=green2;
							if (mode11==3'b000)
							begin
							    kind<=3'b001;
								 mode11<=3'b001;
								 mode2=0;
							end
							else if (mode11==3'b001)
							begin
							    kind<=3'b011;
								 mode11<=3'b000;
								 mode2=0;
							end
						end
						else if (SS==S2+1'b1)
						begin
						    green2<=green2;
							 if (mode12==3'b000)
							 begin
							     kind<=3'b000;
								  mode12<=3'b001;
								  mode2=0;
							 end
							 else if (mode12==3'b001)
							 begin
							     kind<=3'b001;
								  mode12<=3'b010;
								  mode2=0;
							 end
							 else if (mode12==3'b010)
							 begin
							     kind<=3'b011;
								  mode12<=3'b000;
								  mode2=0;
							 end
						end
						else if (SS==S2)
						begin
						    green2<=green2;
							if (mode13==3'b000)
							begin
							    kind<=3'b001;
								 mode13<=3'b001;
								 mode2=0;
							end
							else if (mode13==3'b001)
							begin
							    kind<=3'b011;
								 mode13<=3'b000;
								 mode2=0;
							end
						end
						else if (SS==S2+2'b11)
						begin
						    green2<=green2;
							if (mode24==3'b000)
							begin
							    kind<=3'b001;
								 mode24<=3'b001;
								 mode2=0;
							end
							else if (mode24==3'b001)
							begin
							    kind<=3'b011;
								 mode24<=3'b000;
								 mode2=0;
							end
						end
						else
						begin
							green2<={green2[6:0],~(1'b0)};
							SS=SS+1'b1;
							B_count<={B_count[3:0],1'b1};
							clear=1;
							change=0;
							beep<=1;
						end
					end
					else
					begin
						green2<={green2[6:0],~(1'b0)};
				      SS=SS+1'b1;
				   end		
				end
			end
			// 從紅色左邊發球
			else if (kind==3'b011)
			begin
			   if (mode3==0)//球往上
				begin
					if (SS==4'b1000)
					begin
						green2<=green2;
						mode3=1;
					end
					else if (green2==8'b11111101)
					begin
					   if (SS==S3+1'b1||SS==S3+2'b10||SS==S3)
						begin
					       green2<=green2;
						    mode3=1;
						end
						else
						begin
						    green2<={~(1'b0),green2[7:1]};
					       SS=SS-1'b1;
							 A_count<={A_count[3:0],1'b1};
							 clear=1;
							 change=1;
							 beep<=1;
					   end
					end
					else
					begin
						green2<={~(1'b0),green2[7:1]};
					   SS=SS-1'b1;
					end	
				end
				else if (mode3==1)//球往下
				begin
					if (green2==8'b11111101)
					begin
					   if (SS==S3+2'b10)
						begin
							green2<=green2;
							if (mode8==3'b000)
							begin
							    kind<=3'b010;
								 mode8<=3'b001;
								 mode3=0;
							end
							else if (mode8==3'b001)
							begin
							    kind<=3'b100;
								 mode8<=3'b000;
								 mode3=0;
							end
						end
						else if (SS==S3+1'b1)
						begin
						    green2<=green2;
							 if (mode9==3'b000)
							 begin
							     kind<=3'b000;
								  mode9<=3'b001;
								  mode3=0;
							 end
							 else if (mode9==3'b001)
							 begin
							     kind<=3'b010;
								  mode9<=3'b010;
								  mode3=0;
							 end
							 else if (mode9==3'b010)
							 begin
							     kind<=3'b100;
								  mode9<=3'b000;
								  mode3=0;
							 end
						end
						else if (SS==S3)
						begin
						    green2<=green2;
							if (mode10==3'b000)
							begin
							    kind<=3'b010;
								 mode10<=3'b001;
								 mode3=0;
							end
							else if (mode10==3'b001)
							begin
							    kind<=3'b100;
								 mode10<=3'b000;
								 mode3=0;
							end
						end
						else if (SS==S3+2'b11)
						begin
						    green2<=green2;
							if (mode25==3'b000)
							begin
							    kind<=3'b010;
								 mode25<=3'b001;
								 mode3=0;
							end
							else if (mode25==3'b001)
							begin
							    kind<=3'b100;
								 mode25<=3'b000;
								 mode3=0;
							end
						end
						else
						begin
							green2<={~(1'b0),green2[7:1]};
							SS=SS+1'b1;
							A_count<={A_count[3:0],1'b1};
							clear=1;
							change=1;
							beep<=1;
						end
					end
					else
					begin
						green2<={~(1'b0),green2[7:1]};
				      SS=SS+1'b1;
				   end		
				end
			end
         //從藍色的左邊發球
			else if (kind==3'b100)
			begin
				if (mode4==0)//球往上
				begin
					if (SS==4'b1111)
					begin
						green2<=green2;
						mode4=1;
					end
					else if (green2==8'b10111111)
					begin
					   if (SS==S2+1'b1||SS==S2+2'b10||SS==S2)
						begin
					       green2<=green2;
						    mode4=1;
						end
						else
						begin
						    green2<={green2[6:0],~(1'b0)};
					       SS=SS+1'b1;
							 B_count<={B_count[3:0],1'b1};
							 clear=1;
							 change=0;
							 beep<=1;
					   end
					end
					else
					begin
						green2<={green2[6:0],~(1'b0)};
					   SS=SS+1'b1;
					end	
				end
				else if (mode4==1)//球往下
				begin
					if (green2==8'b10111111)
					begin
						if (SS==S2+2'b10)
						begin
							green2<=green2;
							if (mode14==3'b000)
							begin
							    kind<=3'b001;
								 mode14<=3'b001;
								 mode4=0;
							end
							else if (mode14==3'b001)
							begin
							    kind<=3'b011;
								 mode14<=3'b000;
								 mode4=0;
							end
						end
						else if (SS==S2+1'b1)
						begin
						    green2<=green2;
							 if (mode15==3'b000)
							 begin
							     kind<=3'b000;
								  mode15<=3'b001;
								  mode4=0;
							 end
							 else if (mode15==3'b001)
							 begin
							     kind<=3'b001;
								  mode15<=3'b010;
								  mode4=0;
							 end
							 else if (mode15==3'b010)
							 begin
							     kind<=3'b011;
								  mode15<=3'b000;
								  mode4=0;
							 end
						end
						else if (SS==S2)
						begin
						    green2<=green2;
							if (mode16==3'b000)
							begin
							    kind<=3'b001;
								 mode16<=3'b001;
								 mode4=0;
							end
							else if (mode16==3'b001)
							begin
							    kind<=3'b011;
								 mode16<=3'b000;
								 mode4=0;
							end
						end
						else if (SS==S2+2'b11)
						begin
						    green2<=green2;
							if (mode23==3'b000)
							begin
							    kind<=3'b001;
								 mode23<=3'b001;
								 mode4=0;
							end
							else if (mode23==3'b001)
							begin
							    kind<=3'b011;
								 mode23<=3'b000;
								 mode4=0;
							end
						end
						else
						begin
							green2<={green2[6:0],~(1'b0)};
							SS=SS-1'b1;
							B_count<={B_count[3:0],1'b1};
							clear=1;
							change=0;
							beep<=1;
						end
					end
					else
					begin
						green2<={green2[6:0],~(1'b0)};
				      SS=SS-1'b1;
				   end		
				end
			end
		end
	end
	 
	 
	
		
	
	 //show
	 always @(posedge CLk_div,posedge Clear)
	 begin
	   if (Clear)
		begin
				S<=4'b1011;
				Red <=8'b01111111;
				Green<=8'b11111111;
				Blue<=8'b11111110;
		end
		else if (clear==1)
		begin
			count<=count+1'b1;
		   if (count==3'b111)
			    count<=3'b000;
			//玩家一
			else if (count==3'b000)
			begin
				S<=4'b1011;
				Red <=8'b01111111;
				Green<=8'b11111111;
				Blue<=8'b11111111;
			end
			else if (count==3'b001)
			begin
				S<=4'b1100;
				Red <=8'b01111111;
				Green<=8'b11111111;
				Blue<=8'b11111111;
			end
			else if (count==3'b010)
			begin
				S<=4'b1101;
				Red <=8'b01111111;
				Green<=8'b11111111;
				Blue<=8'b11111111;
			end
			//玩家二
			else if (count==3'b011)
			begin
				S<=4'b1011;
				Red <=8'b11111111;
				Green<=8'b11111111;
				Blue<=8'b11111110;
			end
			else if (count==3'b100)
			begin
				S<=4'b1100;
				Red <=8'b11111111;
				Green<=8'b11111111;
				Blue<=8'b11111110;
			end
			else if (count==3'b101)
			begin
				S<=4'b1101;
				Red <=8'b11111111;
				Green<=8'b11111111;
				Blue<=8'b11111110;
			end
			//球
			else if (count==3'b110)
			begin
			   S<=4'b1100;
				Red <=8'b11111111;
				Blue<=8'b11111111;
				if (change==0)
				    Green<=8'b10111111;
				else if (change==1)
				    Green<=8'b11111101;
			end
		 end
        //紅色贏
		else if (endgame==2'b01)
		begin
		   Red <=8'b00000000;
			Green<=8'b11111111;
			Blue<=8'b11111111;
			if (S<=4'b1111)
			   S<=S+1'b1;
		end
        //藍色贏
		else if (endgame==2'b10)
		begin
		   Red <=8'b11111111;
			Green<=8'b11111111;
			Blue<=8'b00000000;
			if (S<=4'b1111)
			   S<=S+1'b1;
					end
        //平手
		else if (endgame==2'b11)
		begin
		   Red <=8'b00000000;
			Green<=8'b11111111;
			Blue<=8'b00000000;
			if (S<=4'b1111)
			   S<=S+1'b1;
		end
		else
		begin
		   count<=count+1'b1;
		   if (count==3'b111)
			    count<=3'b000;
			//玩家一
			else if (count==3'b000)
			begin
				S<=S2;
				Red <=8'b01111111;
				Green<=8'b11111111;
				Blue<=8'b11111111;
			end
			else if (count==3'b001)
			begin
				S<=S2+1'b1;
				Red <=8'b01111111;
				Green<=8'b11111111;
				Blue<=8'b11111111;
			end
			else if (count==3'b010)
			begin
				S<=S2+2'b10;
				Red <=8'b01111111;
				Green<=8'b11111111;
				Blue<=8'b11111111;
			end
			//玩家二
			else if (count==3'b011)
			begin
				S<=S3;
				Red <=8'b11111111;
				Green<=8'b11111111;
				Blue<=8'b11111110;
			end
			else if (count==3'b100)
			begin
				S<=S3+1'b1;
				Red <=8'b11111111;
				Green<=8'b11111111;
				Blue<=8'b11111110;
			end
			else if (count==3'b101)
			begin
				S<=S3+2'b10;
				Red <=8'b11111111;
				Green<=8'b11111111;
				Blue<=8'b11111110;
			end
			//球
			else if (count==3'b110)
			begin
			   S<=SS;
				Red <=red2;
				Green<=green2;
				Blue<=blue2;
			end
		end
	end

endmodule


//玩家一的module
module times(
output reg[3:0]S,
output reg [7:0]Red,
output reg [7:0]Green,
output reg [7:0]Blue,
input clear,
input [1:0]button,
input CLk,Clear
);
		  
		divfreq2 F1(CLk,CLk_div2);
		always @(posedge CLk_div2,posedge Clear)
		begin
		  if (Clear)
		  begin
		      S<=4'b1011;
				Red <=8'b01111111;
			   Green<=8'b10111111;
			   Blue<=8'b11111111;
		  end
		  else if (clear==1)
		  begin
		      S<=4'b1011;
				Red <=8'b01111111;
			   Green<=8'b10111111;
			   Blue<=8'b11111111;
		  end
		  else if (button==2'b01)
		  begin
				if (S==4'b1101)
					S<=S;
				else
					S<=S+1'b1;	
		  end

		  else if (button==2'b10)
		  begin
				if (S==4'b1000)
					S<=S;
				else
					S<=S-1'b1;
		  end
	   end		 
endmodule

//玩家二的module
module times2(output reg[3:0]S,output reg [7:0]Red,output reg [7:0]Green,
output reg [7:0]Blue,input clear,input [1:0]button2,input CLk,Clear);
		  
		divfreq2 F2(CLk,CLk_div2); 
		always @(posedge CLk_div2,posedge Clear)
		begin
		  if (Clear)
		  begin
		      S<=4'b1011;
				Red <=8'b11111111;
			   Green<=8'b11111111;
			   Blue<=8'b11111110;
		  end
		  else if (clear)
		  begin
		      S<=4'b1011;
				Red <=8'b11111111;
			   Green<=8'b11111111;
			   Blue<=8'b11111110;
		  end
		  else if (button2==2'b01)
		  begin
				if (S==4'b1101)
					S<=S;
				else
					S<=S+1'b1;	
		  end

		  else if (button2==2'b10)
		  begin
				if (S==4'b1000)
					S<=S;
				else
					S<=S-1'b1;
		  end
	   end		 
endmodule
////show
module divfreq(input CLk,output reg CLk_div);
    reg[24:0]number;
	 always @(posedge CLk)
	     begin
		   if(number > 50000)
				begin
			    number <=25'b0;
				 CLk_div <= ~CLk_div;
			   end
			 else
			  number <= number+1'b1;
		  end
endmodule 

//玩家移動的clock
module divfreq2(input CLk,output reg CLk_div2);
    reg[24:0]number2;
	 always @(posedge CLk)
	     begin
		   if(number2 > 3000000)
				begin
			    number2 <=25'b0;
				 CLk_div2 <= ~CLk_div2;
			   end
			 else
			  number2 <= number2+1'b1;
		   end
endmodule

//球的clock
module divfreq3(input CLk,output reg CLk_div3);
    reg[50:0]number3;
	 always @(posedge CLk)
	     begin
		   if(number3 > 5000000)
				begin
			    number3 <=25'b0;
				 CLk_div3 <= ~CLk_div3;
			   end
			 else
			  number3 <= number3+1'b1;
		   end
endmodule

//倒數計時器clock
module divfreq4(input CLk,output reg CLk_div4);
    reg[50:0]number4;
	 always @(posedge CLk)
	     begin
		   if(number4 > 75000000)
				begin
			    number4 <=25'b0;
				 CLk_div4 <= ~CLk_div4;
			   end
			 else
			  number4 <= number4+1'b1;
		   end
endmodule
//7段
module divfreq8(input CLk,output reg CLk_div);
    reg[24:0]number;
	 always @(posedge CLk)
	     begin
		   if(number > 2500)
				begin
			    number <=25'b0;
				 CLk_div <= ~CLk_div;
			   end
			 else
			  number <= number+1'b1;
		  end
endmodule
