`timescale 1ns / 1ps

module multiplier_tb;

    // 1. 声明用于连接乘法器输入输出的变量
    reg  [7:0] a;
    reg  [7:0] b;
    wire [15:0] c;

    //
    // --- 修正点 ---
    // 将文件句柄和循环变量的声明移到这里
    //
    integer file_handle;
    integer i;


    // 2. 例化(Instantiate)你在IP Catalog中生成的乘法器
    // 确保这里的 'mult_0' 与您生成的IP核名称完全一致
    mult_gen_0 multiplier_inst (
        .A(a),
        .B(b),
        .P(c)
    );

    // 3. 编写测试逻辑
    initial begin
        // 变量已经在外部声明，这里直接使用

        // 使用系统函数$fopen打开一个文件用于写入
        file_handle = $fopen("results/results.txt", "w");
        if (file_handle == 0) begin
            $display("Error: Could not open a file for writing.");
            $finish;
        end

        // 使用循环生成100个随机的a和b
        for (i = 0; i < 100; i = i + 1) begin
            // 使用系统随机函数 $random 生成a和b
            a = $random % 256;
            b = $random % 256;

            // 等待一个短暂的延时，确保乘法器有时间计算结果
            #10;

            // 将a, b, c的值写入文件
            $fdisplay(file_handle, "%d %d %d", a, b, c);

            // (可选) 在仿真控制台中也显示出来
            $display("Test %d: a=%d, b=%d, c=%d", i+1, a, b, c);
        end

        // 所有数据写入完毕后，关闭文件
        $fclose(file_handle);

        // 显示仿真完成信息并结束仿真
        $display("Simulation finished. Data written to results.txt.");
        $finish;
    end

endmodule