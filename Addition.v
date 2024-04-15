module addition
(
    input signed [0:15] sig_out_1, sig_out_2, sig_out_3, sig_out_4, sig_out_5, sig_out_6, sig_out_7, sig_out_8,
    output [0:31] sig_out
);
    wire [0:31] sig_tmp_1, sig_tmp_2, sig_tmp_3, sig_tmp_4, sig_tmp_5, sig_tmp_6, sig_tmp_7, sig_tmp_8;

    assign sig_tmp_1 = (sig_out_1[0] == 1'b1) ? {16'hFFFF, sig_out_1} : {16'b0, sig_out_1};
    assign sig_tmp_2 = (sig_out_2[0] == 1'b1) ? {16'hFFFF, sig_out_2} : {16'b0, sig_out_2};
    assign sig_tmp_3 = (sig_out_3[0] == 1'b1) ? {16'hFFFF, sig_out_3} : {16'b0, sig_out_3};
    assign sig_tmp_4 = (sig_out_4[0] == 1'b1) ? {16'hFFFF, sig_out_4} : {16'b0, sig_out_4};
    assign sig_tmp_5 = (sig_out_5[0] == 1'b1) ? {16'hFFFF, sig_out_5} : {16'b0, sig_out_5};
    assign sig_tmp_6 = (sig_out_6[0] == 1'b1) ? {16'hFFFF, sig_out_6} : {16'b0, sig_out_6};
    assign sig_tmp_7 = (sig_out_7[0] == 1'b1) ? {16'hFFFF, sig_out_7} : {16'b0, sig_out_7};
    assign sig_tmp_8 = (sig_out_8[0] == 1'b1) ? {16'hFFFF, sig_out_8} : {16'b0, sig_out_8};

    assign sig_out = sig_tmp_1 + sig_tmp_2 + sig_tmp_3 + sig_tmp_4 + sig_tmp_5 + sig_tmp_6 + sig_tmp_7 + sig_tmp_8;
endmodule