// /* verilator lint_off UNUSED */
// module regfile (
//     input logic clk_i,
//     input logic rst_ni,
//     input logic rd_wren_i,
//     input logic [4:0] rs1_addr_i,
//     input logic [4:0] rs2_addr_i,
//     input logic [4:0] rd_addr_i,
//     input logic [31:0] rd_data_i,

//     output logic [31:0] rs1_data_o,
//     output logic [31:0] rs2_data_o
// );

//   logic [31:0] memory[0:31];

//   //write operation
//   always_ff @(posedge clk_i) begin
//     if (rd_wren_i) 
//       if (!(rd_addr_i == 0)) memory[rd_addr_i] <= rd_data_i;
//   end

//   //read operation      
//   assign rs1_data_o = memory[rs1_addr_i];
//   assign rs2_data_o = memory[rs2_addr_i];

// endmodule : regfile
// /* verilator lint_off UNUSED */


/////////////////
module regfile (
    //inputs /* verilator lint_off UNUSED */
    input logic clk_i,
    input logic rst_ni,
    input logic [4:0] rs1_addr_i, rs2_addr_i, rd_addr_i,
    input logic [31:0] rd_data_i,
    input logic rd_wren_i,
    //outputs
    output logic [31:0] rs1_data_o, rs2_data_o
);/* verilator lint_off UNUSED */
reg [31:0] register [31:0]; //32x32bit regfile

//register[0] = 0
assign register[0] = 0;
//write operation
always_ff @(posedge clk_i) begin
    if (rst_ni==0) begin //reset low active
        register[ 1] <= 0;
        register[ 2] <= 0;
        register[ 3] <= 0;
        register[ 4] <= 0;
        register[ 5] <= 0;
        register[ 6] <= 0;
        register[ 7] <= 0;
        register[ 8] <= 0;
        register[ 9] <= 0;
        register[10] <= 0;
        register[11] <= 0;
        register[12] <= 0;
        register[13] <= 0;
        register[14] <= 0;
        register[15] <= 0;
        register[16] <= 0;
        register[17] <= 0;
        register[18] <= 0;
        register[19] <= 0;
        register[20] <= 0;
        register[21] <= 0;
        register[22] <= 0;
        register[23] <= 0;
        register[24] <= 0;
        register[25] <= 0;
        register[26] <= 0;
        register[27] <= 0;
        register[28] <= 0;
        register[29] <= 0;
        register[30] <= 0;
        register[31] <= 0;
    end 
    else 
  //write but if rd_addr = 0 then no write
        if (rd_wren_i==1) begin
            if (rd_addr_i==0) begin
                register[rd_addr_i] <= 32'b0;
            end else
            register[rd_addr_i] <= rd_data_i;
        end
end
//read operation
assign rs1_data_o = register[rs1_addr_i];
assign rs2_data_o = register[rs2_addr_i];


endmodule
