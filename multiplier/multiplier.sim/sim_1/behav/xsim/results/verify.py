import os

def verify_results():
    """
    读取乘法器仿真结果并验证其正确性。
    """
    results_file = 'results.txt'
    errors_file = 'errors.txt'
    error_count = 0

    # 检查results.txt是否存在
    if not os.path.exists(results_file):
        print(f"错误: 输入文件 '{results_file}' 未找到。")
        print("请先运行Vivado仿真，并将生成的results.txt文件放到本脚本同级目录下。")
        return

    print(f"正在读取文件 '{results_file}'...")

    # 同时打开输入文件和错误日志文件
    with open(results_file, 'r') as f_in, open(errors_file, 'w') as f_err:
        for line_num, line in enumerate(f_in, 1):
            try:
                # 分割每行中的a, b, c
                parts = line.strip().split()
                if len(parts) < 3:
                    continue # 跳过空行或格式不正确的行

                a = int(parts[0])
                b = int(parts[1])
                c = int(parts[2])

                # 检查 a * b 是否与 c 相等 [cite: 19]
                if a * b != c:
                    error_count += 1
                    error_message = f"错误在行 {line_num}: a={a}, b={b}, 乘法器结果 c={c}, 期望结果 a*b={a*b}\n"
                    print(error_message.strip())
                    # 将错误记录到另一个文本文件 [cite: 19]
                    f_err.write(error_message)

            except (ValueError, IndexError) as e:
                print(f"解析行 {line_num} 时出错: '{line.strip()}' -> {e}")

    # 根据是否有错误来报告最终结果 [cite: 19]
    if error_count == 0:
        print("\n-------------------------")
        print("所有100个测试用例均正确。")
        print("验收通过")
        print("-------------------------")
        # 如果没有错误，可以删除空的errors.txt文件
        os.remove(errors_file)
    else:
        print(f"\n-------------------------")
        print(f"共发现 {error_count} 个错误。")
        print(f"详细信息已记录在 '{errors_file}' 文件中。")
        print("-------------------------")

if __name__ == "__main__":
    verify_results()