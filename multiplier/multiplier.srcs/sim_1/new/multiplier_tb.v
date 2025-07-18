`timescale 1ns / 1ps

module multiplier_tb;

    // 1. �����������ӳ˷�����������ı���
    reg  [7:0] a;
    reg  [7:0] b;
    wire [15:0] c;

    //
    // --- ������ ---
    // ���ļ������ѭ�������������Ƶ�����
    //
    integer file_handle;
    integer i;


    // 2. ����(Instantiate)����IP Catalog�����ɵĳ˷���
    // ȷ������� 'mult_0' �������ɵ�IP��������ȫһ��
    mult_gen_0 multiplier_inst (
        .A(a),
        .B(b),
        .P(c)
    );

    // 3. ��д�����߼�
    initial begin
        // �����Ѿ����ⲿ����������ֱ��ʹ��

        // ʹ��ϵͳ����$fopen��һ���ļ�����д��
        file_handle = $fopen("results/results.txt", "w");
        if (file_handle == 0) begin
            $display("Error: Could not open a file for writing.");
            $finish;
        end

        // ʹ��ѭ������100�������a��b
        for (i = 0; i < 100; i = i + 1) begin
            // ʹ��ϵͳ������� $random ����a��b
            a = $random % 256;
            b = $random % 256;

            // �ȴ�һ�����ݵ���ʱ��ȷ���˷�����ʱ�������
            #10;

            // ��a, b, c��ֵд���ļ�
            $fdisplay(file_handle, "%d %d %d", a, b, c);

            // (��ѡ) �ڷ������̨��Ҳ��ʾ����
            $display("Test %d: a=%d, b=%d, c=%d", i+1, a, b, c);
        end

        // ��������д����Ϻ󣬹ر��ļ�
        $fclose(file_handle);

        // ��ʾ���������Ϣ����������
        $display("Simulation finished. Data written to results.txt.");
        $finish;
    end

endmodule