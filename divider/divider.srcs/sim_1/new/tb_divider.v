`timescale 1ns / 1ps

module divider_tb;

    // 信号声明
    reg aclk;
    reg s_axis_dividend_tvalid;
    reg [15:0] s_axis_dividend_tdata;
    reg s_axis_divisor_tvalid;
    reg [7:0] s_axis_divisor_tdata;
    wire m_axis_dout_tvalid;
    wire [23:0] m_axis_dout_tdata;

    // 文件操作和循环变量
    integer input_file, result_file, i, timeout_counter;

    // 存储变量
    reg [15:0] a_from_file;
    reg [7:0]  b_from_file;
    reg [15:0]  c_result; 

    // IP例化
    div_gen_0 divider_inst (
        .aclk(aclk),
        .s_axis_dividend_tvalid(s_axis_dividend_tvalid),
        .s_axis_dividend_tdata(s_axis_dividend_tdata),
        .s_axis_divisor_tvalid(s_axis_divisor_tvalid),
        .s_axis_divisor_tdata(s_axis_divisor_tdata),
        .m_axis_dout_tvalid(m_axis_dout_tvalid),
        .m_axis_dout_tdata(m_axis_dout_tdata)
    );

    // 时钟生成
    initial begin
        aclk = 0;
        forever #5 aclk = ~aclk;
    end
    
    // 主测试流程
    initial begin
        // ---- 阶段1: 生成输入文件 ----
        input_file = $fopen("results/inputdata.txt", "w");
        for (i = 0; i < 100; i = i + 1) begin
            a_from_file = {$random} % 65536;
            b_from_file = {$random} % 256;
            if (b_from_file == 0) b_from_file = 1;
            $fdisplay(input_file, "%d %d", a_from_file, b_from_file);
        end
        $fclose(input_file);
        $display("Phase 1 Complete: Generated results/inputdata.txt");

        // ---- 阶段2: 读取文件并串行执行测试 ----
        #50;
        input_file = $fopen("results/inputdata.txt", "r");
        result_file = $fopen("results/result.txt", "w");
        
        s_axis_dividend_tvalid <= 0;
        s_axis_divisor_tvalid  <= 0;

        for (i = 0; i < 100; i = i + 1) begin
            $fscanf(input_file, "%d %d", a_from_file, b_from_file);
            
            @(posedge aclk);
            s_axis_dividend_tdata <= a_from_file;
            s_axis_divisor_tdata  <= b_from_file;
            s_axis_dividend_tvalid <= 1;
            s_axis_divisor_tvalid  <= 1;
            
            @(posedge aclk);
            s_axis_dividend_tvalid <= 0;
            s_axis_divisor_tvalid  <= 0;

            timeout_counter = 0;
            while (m_axis_dout_tvalid == 0) begin
                @(posedge aclk);
                timeout_counter = timeout_counter + 1;
            end
            
            c_result = m_axis_dout_tdata[23:8]; 
           
            $fdisplay(result_file, "%d %d %d", a_from_file, b_from_file, c_result);
            
            repeat(2) @(posedge aclk);
        end
        
        $fclose(input_file);
        $fclose(result_file);
        $display("Phase 2 Complete: Simulation finished.");
        $finish;
    end

endmodule