import os

def verify_divider_results():
    """
    读取除法器仿真结果并验证其正确性。
    """
    results_file = 'result.txt'
    errors_file = 'check.txt'  # 
    error_count = 0

    if not os.path.exists(results_file):
        print(f"错误: 输入文件 '{results_file}' 未找到。")
        return

    print(f"正在读取文件 '{results_file}'...")

    with open(results_file, 'r', encoding='utf-8') as f_in, open(errors_file, 'w', encoding='utf-8') as f_err:
        for line_num, line in enumerate(f_in, 1):
            try:
                parts = line.strip().split()
                if len(parts) < 3:
                    continue

                a = int(parts[0])
                b = int(parts[1])
                c = int(parts[2])

                # 验证 a / b 是否与 c 相等
                # 在Python中，整数除法使用 //
                if b == 0:
                    expected_c = 0 # 或者根据FPGA行为定义
                else:
                    expected_c = a // b

                # 检查结果是否匹配 
                if expected_c != c:
                    error_count += 1
                    error_message = f"错误在行 {line_num}: a={a}, b={b}, 除法器结果 c={c}, 期望结果 a//b={expected_c}\n"
                    print(error_message.strip())
                    # 记录错误到 check.txt 
                    f_err.write(error_message)

            except (ValueError, IndexError) as e:
                print(f"解析行 {line_num} 时出错: '{line.strip()}' -> {e}")

    # 报告最终结果
    if error_count == 0:
        print("\n-------------------------")
        print("所有100个测试用例均正确。")
        print("验收通过") # 
        print("-------------------------")
        os.remove(errors_file)
    else:
        print(f"\n-------------------------")
        print(f"共发现 {error_count} 个错误。")
        print(f"详细信息已记录在 '{errors_file}' 文件中。")
        print("-------------------------")

if __name__ == "__main__":
    verify_divider_results()