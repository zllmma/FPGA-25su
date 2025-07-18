`timescale 1ns / 1ps
`timescale 1ns / 1ps

module tb_fsm;

    // -- Parameters
    parameter CLK_PERIOD = 10; // ʱ������Ϊ10ns

    // -- Regs for DUT inputs
    reg clk;
    reg rst_n;
    reg A;
    reg B;

    // -- Wire for DUT output
    wire [2:0] out;

    // -- Instantiate the Device Under Test (DUT)
    // ʵ��������ģ��
    fsm uut (
        .clk(clk),
        .rst_n(rst_n),
        .A(A),
        .B(B),
        .out(out)
    );

    // -- Clock Generation
    // ʱ�������߼�
    initial begin
        clk = 0;
        forever #(CLK_PERIOD / 2) clk = ~clk;
    end

    // -- Test Stimulus
    // ���Լ�������
    initial begin
        // 1. Initialize and Reset
        // ��ʼ������λ
        $display("------ Starting Simulation ------");
        A = 0;
        B = 0;
        rst_n = 1; // ��ʼʱ����λ�ź���Ч
        #5;
        rst_n = 0; // ����һ���͵�ƽ��Ч�ĸ�λ�ź�
        $display("Time=%0t -> Asserting Reset (rst_n = 0)", $time);
        #(CLK_PERIOD * 2);
        rst_n = 1; // �ͷŸ�λ
        $display("Time=%0t -> De-asserting Reset (rst_n = 1)", $time);
        
        // �ȴ���һ��ʱ�������أ�FSM��� initial -> STATE_1
        @(posedge clk);
        $display("Time=%0t -> FSM should be transitioning to STATE_1", $time);

        // 2. Test STATE_1
        // ���� STATE_1: ���� A&&B �����㣬Ӧͣ���� STATE_1
        @(posedge clk);
        A = 1;
        B = 0;
        $display("Time=%0t -> Testing STATE_1 (A=1, B=0), should stay in STATE_1", $time);

        // ���� STATE_1: ���� A&&B ���㣬Ӧת�Ƶ� STATE_2
        @(posedge clk);
        A = 1;
        B = 1;
        $display("Time=%0t -> Testing STATE_1 (A=1, B=1), should transition to STATE_2", $time);

        // 3. Test STATE_2
        // ���� STATE_2: ���� !A �����㣬Ӧͣ���� STATE_2
        @(posedge clk);
        A = 0;
        B = 1; // B��ֵ��Ӱ���״̬
        $display("Time=%0t -> Testing STATE_2 (A=0), should stay in STATE_2", $time);
        
        // ���� STATE_2: ���� !A ���㣬Ӧת�Ƶ� STATE_3
        @(posedge clk);
        A = 1;
        $display("Time=%0t -> Testing STATE_2 (A=1), should transition to STATE_3", $time);

        // 4. Test STATE_3
        // ���� STATE_3: ���� A&&!B ���㣬Ӧͣ���� STATE_3
        @(posedge clk);
        A = 1;
        B = 0;
        $display("Time=%0t -> Testing STATE_3 (A=1, B=0), should stay in STATE_3", $time);

        // ���� STATE_3: ���� !(A^B) ���㣬Ӧת�Ƶ� STATE_4
        @(posedge clk);
        A = 1;
        B = 1;
        $display("Time=%0t -> Testing STATE_3 (A=1, B=1), should transition to STATE_4", $time);

        // 5. Test STATE_4 (Terminal State)
        // ���� STATE_4: �ն�״̬��Ӧʼ��ͣ���� STATE_4
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
    // ��ѡ��ʹ�� $monitor ����źű仯
    initial begin
        // Ϊ�˷���۲죬���Լ���ڲ�״̬ current_state
        $monitor("Time=%0t | rst_n=%b A=%b B=%b | out=%3b | internal_state=%3b",
                 $time, rst_n, A, B, out, uut.current_state);
    end

endmodule