module top_module(clk, rst, sseg, anode); 

  input clk, rst; 

  output [7:0] sseg; 

  output [3:0] anode; 

   

  wire enable; 

  reg [4:0] addr_1, addr_2, addr_3, addr_4; 

  wire [7:00] sseg_4, sseg_3, sseg_2, sseg_1; 

   

  reg[3:0] state_current, state_next; 

   

  always @(posedge clk) begin 

    if(rst) begin 

      state_current <= 0; 

    end 

    else begin 

      state_current <= state_next; 

    end 

  end 

   

  always@(*) begin 

    state_next = state_current; 

    case(state_current) 

      0:begin 

        addr_1 = 22; 

        addr_2 = 29; 

        addr_3 = 20; 

        addr_4 = 14; 

        if(enable == 1'b1) begin 

          state_next = 1; 

        end 

      end 

      1:begin 

        addr_1 = 29; 

        addr_2 = 20; 

        addr_3 = 14; 

        addr_4 = 21; 

        if(enable == 1'b1) begin 

          state_next = 2; 

        end 

      end 

      2:begin 

        addr_1 = 20; 

        addr_2 = 14; 

        addr_3 = 21; 

        addr_4 = 21; 

        if(enable == 1'b1) begin 

          state_next = 3; 

        end 

      end 

      3:begin 

        addr_1 = 14; 

        addr_2 = 21; 

        addr_3 = 21; 

        addr_4 = 0; 

        if(enable == 1'b1) begin 

          state_next = 4; 

        end 

      end 

      4:begin 

        addr_1 = 21; 

        addr_2 = 21; 

        addr_3 = 0; 

        addr_4 = 22; 

        if(enable == 1'b1) begin 

          state_next = 5; 

        end 

      end 

      5:begin 

        addr_1 = 21; 

        addr_2 = 0; 

        addr_3 = 22; 

        addr_4 = 29; 

        if(enable == 1'b1) begin 

          state_next = 6; 

        end 

      end 

      6:begin 

        addr_1 = 0; 

        addr_2 = 22; 

        addr_3 = 29; 

        addr_4 = 20; 

        if(enable == 1'b1) begin 

          state_next = 0; 

        end 

      end 

    endcase 

  end 
