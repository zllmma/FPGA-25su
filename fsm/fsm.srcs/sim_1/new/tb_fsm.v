`timescale 1ns / 1ps
`timescale 1ns / 1ps

module tb_fsm;

    // -- Parameters
    parameter CLK_PERIOD = 10; // 时钟周期为10ns

    // -- Regs for DUT inputs
    reg clk;
    reg rst_n;
    reg A;
    reg B;

    // -- Wire for DUT output
    wire [2:0] out;

    // -- Instantiate the Device Under Test (DUT)
    // 实例化待测模块
    fsm uut (
        .clk(clk),
        .rst_n(rst_n),
        .A(A),
        .B(B),
        .out(out)
    );

    // -- Clock Generation
    // 时钟生成逻辑
    initial begin
        clk = 0;
        forever #(CLK_PERIOD / 2) clk = ~clk;
    end

    // -- Test Stimulus
    // 测试激励序列
    initial begin
        // 1. Initialize and Reset
        // 初始化并复位
        $display("------ Starting Simulation ------");
        A = 0;
        B = 0;
        rst_n = 1; // 初始时，复位信号无效
        #5;
        rst_n = 0; // 产生一个低电平有效的复位信号
        $display("Time=%0t -> Asserting Reset (rst_n = 0)", $time);
        #(CLK_PERIOD * 2);
        rst_n = 1; // 释放复位
        $display("Time=%0t -> De-asserting Reset (rst_n = 1)", $time);
        
        // 等待第一个时钟上升沿，FSM会从 initial -> STATE_1
        @(posedge clk);
        $display("Time=%0t -> FSM should be transitioning to STATE_1", $time);

        // 2. Test STATE_1
        // 测试 STATE_1: 条件 A&&B 不满足，应停留在 STATE_1
        @(posedge clk);
        A = 1;
        B = 0;
        $display("Time=%0t -> Testing STATE_1 (A=1, B=0), should stay in STATE_1", $time);

        // 测试 STATE_1: 条件 A&&B 满足，应转移到 STATE_2
        @(posedge clk);
        A = 1;
        B = 1;
        $display("Time=%0t -> Testing STATE_1 (A=1, B=1), should transition to STATE_2", $time);

        // 3. Test STATE_2
        // 测试 STATE_2: 条件 !A 不满足，应停留在 STATE_2
        @(posedge clk);
        A = 0;
        B = 1; // B的值不影响此状态
        $display("Time=%0t -> Testing STATE_2 (A=0), should stay in STATE_2", $time);
        
        // 测试 STATE_2: 条件 !A 满足，应转移到 STATE_3
        @(posedge clk);
        A = 1;
        $display("Time=%0t -> Testing STATE_2 (A=1), should transition to STATE_3", $time);

        // 4. Test STATE_3
        // 测试 STATE_3: 条件 A&&!B 满足，应停留在 STATE_3
        @(posedge clk);
        A = 1;
        B = 0;
        $display("Time=%0t -> Testing STATE_3 (A=1, B=0), should stay in STATE_3", $time);

        // 测试 STATE_3: 条件 !(A^B) 满足，应转移到 STATE_4
        @(posedge clk);
        A = 1;
        B = 1;
        $display("Time=%0t -> Testing STATE_3 (A=1, B=1), should transition to STATE_4", $time);

        // 5. Test STATE_4 (Terminal State)
        // 测试 STATE_4: 终端状态，应始终停留在 STATE_4
        @(posedge clk);
        A = 0;
        B = 0;
        $display("Time=%0t -> Testing STATE_4 (A=0, B=0), should stay in STATE_4", $time);

        @(posedge clk);
        A = 1;
        B = 1;
        $display("Time=%0t -> Testing STATE_4 (A=1, B=1), should stay in STATE_4", $time);

        // 6. End Simulation
        #(CLK_PERIOD * 2);
        $display("------ Simulation Finished ------");
        $finish;
    end

    // -- Optional: Monitor to display changes
    // 可选：使用 $monitor 监控信号变化
    initial begin
        // 为了方便观察，可以监控内部状态 current_state
        $monitor("Time=%0t | rst_n=%b A=%b B=%b | out=%3b | internal_state=%3b",
                 $time, rst_n, A, B, out, uut.current_state);
    end

endmodule