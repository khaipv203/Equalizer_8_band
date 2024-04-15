module test_bench();
    reg clk, rst_n;
    reg signed [15:0] x_in;
    reg ena_1, ena_2, ena_3, ena_4, ena_5, ena_6, ena_7, ena_8;
    reg signed [15:0] sig_in [31999:0];
    reg signed [15:0] sig_1[32061:0];
    reg signed [15:0] sig_2[32061:0];
    reg signed [15:0] sig_3[32061:0];
    reg signed [15:0] sig_4[32061:0];
    reg signed [15:0] sig_5[32061:0];
    reg signed [15:0] sig_6[32061:0];
    reg signed [15:0] sig_7[32061:0];
    reg signed [15:0] sig_8[32061:0];
    reg [14:0] address;
    reg [14:0] address_1, address_2, address_3, address_4, address_5, address_6, address_7, address_8;
    wire signed [0:15] sig_out_1, sig_out_2, sig_out_3, sig_out_4, sig_out_5, sig_out_6, sig_out_7, sig_out_8;
    reg [0:2] amp_coef_1, amp_coef_2, amp_coef_3, amp_coef_4, amp_coef_5, amp_coef_6, amp_coef_7, amp_coef_8;
    wire [0:31] sig_out;
    initial begin
        $readmemb("sig_in.txt", sig_in);
    end

    initial begin
        amp_coef_1 = 1;
        amp_coef_2 = 1;
        amp_coef_3 = 1;
        amp_coef_4 = 1;
        amp_coef_5 = 1;
        amp_coef_6 = 1;
        amp_coef_7 = 1;
        amp_coef_8 = 1;
    end
    initial begin
        clk = 0;
        rst_n = 1; #20;
        rst_n = 0; #50;
        ena_1 = 1;
        ena_2 = 1;
        ena_3 = 1;
        ena_4 = 1;
        ena_5 = 1;
        ena_6 = 1;
        ena_7 = 1;
        ena_8 = 1;
        rst_n = 1; #20;
        address_1 = 0;
        address_2 = 0;
        address_3 = 0;
        address_4 = 0;
        address_5 = 0;
        address_6 = 0;
        address_7 = 0;
        address_8 = 0;
        // #20000
        // ena_3 = 0;
        // ena_7 = 0;
        
    end
    always #5 clk = ~clk;
    Equalizer equalizer(
        .clk(clk),
        .rst_n(rst_n),
        .x_in(x_in),
        .ena_1(ena_1), .ena_2(ena_2), .ena_3(ena_3), .ena_4(ena_4), .ena_5(ena_5), .ena_6(ena_6), .ena_7(ena_7), .ena_8(ena_8),
        .sig_out_1(sig_out_1), .sig_out_2(sig_out_2), .sig_out_3(sig_out_3), .sig_out_4(sig_out_4), .sig_out_5(sig_out_5), .sig_out_6(sig_out_6), .sig_out_7(sig_out_7), .sig_out_8(sig_out_8),
        .sig_out(sig_out),
        .amp_coef_1(amp_coef_1), .amp_coef_2(amp_coef_2), .amp_coef_3(amp_coef_3), .amp_coef_4(amp_coef_4), .amp_coef_5(amp_coef_5), .amp_coef_6(amp_coef_6), .amp_coef_7(amp_coef_7), .amp_coef_8(amp_coef_8)
    );

    // addition add(
    //     .sig_out_1(sig_out_1), .sig_out_2(sig_out_2), .sig_out_3(sig_out_3), .sig_out_4(sig_out_4), .sig_out_5(sig_out_5), .sig_out_6(sig_out_6), .sig_out_7(sig_out_7), .sig_out_8(sig_out_8),
    //     .sig_out(sig_out)
    // );
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            address <= 0;
        end
        else begin
            if(address == 31999) begin
            address <= 0;
            end 
        else begin
            address <= address + 1;
            end
        end
    end
    always @(address) begin
        x_in <= sig_in[address];
    end

    // always @(posedge clk) begin
    //     if(address_1 == 32062) begin
    //         $writememb("sig_out_lowpass.txt", sig_1);
    //     end
    //     else begin
    //         sig_1[address_1] = sig_out_1;
    //         address_1 = address_1 + 1;
    //     end
    // end
    // always @(posedge clk) begin
    //     if(address_2 == 32062) begin
    //         $writememb("sig_out_bandpass_1.txt", sig_2);
    //     end
    //     else begin
    //         sig_2[address_2] = sig_out_2;
    //         address_2 = address_2 + 1;
    //     end
    // end
    // always @(posedge clk) begin
    //     if(address_3 == 32062) begin
    //         $writememb("sig_out_bandpass_2.txt", sig_3);
    //     end
    //     else begin
    //         sig_3[address_3] = sig_out_3;
    //         address_3 = address_3 + 1;
    //     end
    // end
    // always @(posedge clk) begin
    //     if(address_4 == 32062) begin
    //         $writememb("sig_out_bandpass_3.txt", sig_4);
    //     end
    //     else begin
    //         sig_4[address_4] = sig_out_4;
    //         address_4 = address_4 + 1;
    //     end
    // end
    // always @(posedge clk) begin
    //     if(address_5 == 32062) begin
    //         $writememb("sig_out_bandpass_4.txt", sig_5);
    //     end
    //     else begin
    //         sig_5[address_2] = sig_out_5;
    //         address_5 = address_5 + 1;
    //     end
    // end
    // always @(posedge clk) begin
    //     if(address_6 == 32062) begin
    //         $writememb("sig_out_bandpass_5.txt", sig_6);
    //     end
    //     else begin
    //         sig_6[address_2] = sig_out_6;
    //         address_6 = address_6 + 1;
    //     end
    // end
    // always @(posedge clk) begin
    //     if(address_7 == 32062) begin
    //         $writememb("sig_out_bandpass_6.txt", sig_7);
    //     end
    //     else begin
    //         sig_7[address_2] = sig_out_6;
    //         address_7 = address_7 + 1;
    //     end
    // end
    // always @(posedge clk) begin
    //     if(address_8 == 32062) begin
    //         $writememb("sig_out_highpass_1.txt", sig_8);
    //         $stop;
    //     end
    //     else begin
    //         sig_8[address_2] = sig_out_8;
    //         address_8 = address_8 + 1;
    //     end
    // end
endmodule