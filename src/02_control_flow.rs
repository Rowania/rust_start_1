// ===== 2.1 条件语句 =====

fn main() {
    // 场景：根据学生分数给出评级
    let score = 85;
    
    // if-else if-else 结构
    if score > 90 {                          // 第一个条件：分数大于90
        println!("评级：优秀");
        println!("恭喜！成绩非常出色！");
    } else if score > 70 {                   // 第二个条件：分数大于70（且小于等于90）
        println!("评级：良好");
        println!("继续努力，你做得很好！");
    } else {                                 // 其他所有情况
        println!("评级：及格");
        println!("还需要更加努力哦！");
    }
    
    // if 表达式：Rust 中 if 可以返回值
    let status = if score >= 60 { "通过" } else { "不通过" };
    println!("考试状态: {}", status);
    
    // 使用 if let 进行模式匹配（简化的 match）
    let maybe_score = Some(85);
    if let Some(s) = maybe_score {
        println!("获取到分数: {}", s);
    } else {
        println!("没有分数记录");
    }
    
    /* 说明：
       - if-else if-else 让程序根据条件选择执行不同的代码块
       - Rust 的 if 是表达式，可以返回值（注意每个分支返回相同类型）
       - if let 用于简单的模式匹配，比完整的 match 更简洁
       - 条件必须是 bool 类型，不会自动转换其他类型
    */
    
    println!();
    
    // ===== 2.2 循环语句 =====
    
    // loop 循环：无限循环，需要显式 break
    println!("=== loop 循环示例 ===");
    let mut counter = 0;
    let result = loop {
        counter += 1;
        if counter == 3 {
            break counter * 2;               // break 可以返回值
        }
        println!("loop 计数: {}", counter);
    };
    println!("loop 返回值: {}", result);
    
    // while 循环：基于条件的循环
    println!("\n=== while 循环示例 ===");
    println!("模拟手机电量：");
    let mut battery = 100;                   // 初始电量100%
    while battery > 10 {                     // 当电量大于10%时继续工作
        println!("当前电量: {}% - 继续工作中...", battery);
        battery -= 20;                       // 每次循环消耗20%电量
    }
    println!("电量低于10%（当前{}%），需要充电！", battery);
    
    // for 循环：遍历迭代器
    println!("\n=== for 循环示例 ===");
    
    // 使用范围（Range）
    println!("打印数字1到5：");
    for i in 1..=5 {                        // 1..=5 包含5，1..5 不包含5
        println!("数字: {}", i);
    }
    
    // 遍历数组
    let fruits = ["苹果", "香蕉", "橙子"];
    println!("\n水果列表：");
    for (index, fruit) in fruits.iter().enumerate() {
        println!("{}. {}", index + 1, fruit);
    }
    
    // 遍历向量（Vector）
    let numbers = vec![10, 20, 30, 40, 50];
    let mut sum = 0;
    for &num in &numbers {                   // & 借用，避免所有权转移
        sum += num;
    }
    println!("\n数字 {:?} 的和是: {}", numbers, sum);
    
    // 循环标签：控制多层循环
    println!("\n=== 循环标签示例 ===");
    'outer: for i in 1..=3 {               // 'outer 是循环标签
        println!("外层循环: {}", i);
        for j in 1..=3 {
            println!("  内层循环: {}", j);
            if i == 2 && j == 2 {
                println!("  终止外层循环！");
                break 'outer;               // 终止指定的外层循环
            }
            if j == 2 {
                println!("  跳过内层剩余部分");
                continue;                   // 继续下一次内层循环
            }
        }
    }
    
    // continue 和 break 的使用
    println!("\n=== continue 和 break 示例 ===");
    for i in 1..=10 {
        if i % 2 == 0 {
            continue;                       // 跳过偶数
        }
        if i > 7 {
            break;                          // 超过7就退出
        }
        println!("奇数: {}", i);
    }
    
    // while let 循环
    println!("\n=== while let 示例 ===");
    let mut stack = vec![1, 2, 3];
    while let Some(top) = stack.pop() {     // 当 pop 返回 Some 时继续
        println!("弹出: {}", top);
    }
    println!("栈已空");
    
    /* 说明：
       - loop：无限循环，必须用 break 退出，可以返回值
       - while：条件循环，条件为 false 时停止
       - for：最常用，遍历任何实现了 Iterator trait 的类型
       - 1..5 是半开区间 [1,5)，1..=5 是闭区间 [1,5]
       - 使用 enumerate() 可以同时获得索引和值
       - 循环标签：'label 形式，可以精确控制 break 和 continue 作用的循环
       - continue：跳过当前迭代的剩余部分
       - while let：结合模式匹配的循环，常用于处理 Option/Result
    */
    
    println!();
    
    // ===== 2.3 分支语句（match） =====
    
    // match：Rust 的模式匹配，比 switch-case 更强大
    println!("=== 菜单选择系统 ===");
    let menu_choice = 2;
    
    match menu_choice {
        1 => {                               // 当 menu_choice 等于 1
            println!("您选择了：查看余额");
            println!("您的余额是：$1000");
        }
        2 => {                               // 当 menu_choice 等于 2
            println!("您选择了：转账");
            println!("请输入转账金额...");
        }
        3 => {                               // 当 menu_choice 等于 3
            println!("您选择了：修改密码");
            println!("请输入新密码...");
        }
        _ => {                               // _ 通配符，匹配所有其他情况
            println!("无效选择！请输入1-3之间的数字");
        }
    }
    
    // match 作为表达式返回值
    let day = "周一";
    let work_hours = match day {
        "周一" | "周二" | "周三" | "周四" | "周五" => 8,  // 多个模式用 | 分隔
        "周六" => 4,
        "周日" => 0,
        _ => {
            println!("未知的日期");
            0
        }
    };
    println!("\n{} 的工作时间: {} 小时", day, work_hours);
    
    // match 的模式匹配能力
    let number = 15;
    match number {
        0 => println!("零"),
        1..=9 => println!("一位数"),         // 范围匹配
        10 | 20 | 30 => println!("整十数"), // 多值匹配
        _ => println!("其他数字"),
    }
    
    // match Option 类型（Rust 常用模式）
    let gift = Some("生日蛋糕");
    match gift {
        Some(item) => println!("\n收到礼物: {}", item),
        None => println!("\n没有收到礼物"),
    }
    
    // match 守卫（条件匹配）
    println!("\n=== match 守卫示例 ===");
    let age = 18;
    match age {
        x if x < 0 => println!("无效年龄"),
        x if x < 18 => println!("未成年人，{}岁", x),
        18 => println!("刚好成年！"),
        x if x < 65 => println!("成年人，{}岁", x),
        _ => println!("老年人"),
    }
    
    // 解构模式匹配
    println!("\n=== 解构匹配示例 ===");
    let point = (3, 5);
    match point {
        (0, 0) => println!("原点"),
        (x, 0) => println!("在X轴上，x = {}", x),
        (0, y) => println!("在Y轴上，y = {}", y),
        (x, y) => println!("普通点: ({}, {})", x, y),
    }
    
    // @ 绑定
    println!("\n=== @ 绑定示例 ===");
    let message = Some(5);
    match message {
        Some(x @ 3..=7) => println!("找到了在3到7之间的数: {}", x),
        Some(x @ 10..=12) => println!("找到了在10到12之间的数: {}", x),
        Some(x) => println!("找到了其他数: {}", x),
        None => println!("没有找到数"),
    }
    
    /* 说明：
       - match 必须穷尽所有可能，使用 _ 作为默认分支
       - 每个分支可以是表达式，返回相同类型的值
       - 支持多种模式：字面值、范围、多个值、变量绑定等
       - match 是 Rust 处理枚举（enum）的主要方式
       - 相比其他语言的 switch，match 更安全（必须处理所有情况）
       - 守卫（guard）：使用 if 在匹配臂中添加额外条件
       - 解构：可以匹配并解构复杂数据结构
       - @ 绑定：将匹配的值绑定到变量
    */
}