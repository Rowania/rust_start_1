// ===== 1.1 变量与常量 =====

fn main() {
    // 变量：可以改变值的容器（需要用 mut 关键字）
    let mut score = 85;              // 声明一个可变变量，初始值为85
    println!("初始分数: {}", score);
    
    score = 95;                      // 修改变量的值
    println!("更新后的分数: {}", score);
    
    // 不可变变量：默认情况下变量是不可变的
    let age = 25;                    // 声明一个不可变变量
    println!("年龄: {}", age);
    // age = 26;                     // 错误！不能修改不可变变量
    
    // 常量：编译时就确定的值，永远不可变
    const PI: f64 = 3.14159;         // 常量必须指定类型
    println!("圆周率: {}", PI);
    
    /* 说明：
       - Rust 中变量默认是不可变的（immutable），需要 mut 关键字才能修改
       - 常量（const）在编译时就确定值，必须指定类型，命名通常用大写
       - 不可变性是 Rust 安全性的重要特性，防止数据被意外修改
    */
    
    println!();
    
    // ===== 1.2 数据类型 =====
    
    // 整数类型：i32（32位有符号整数）是默认类型
    let count: i32 = 42;             // 显式指定类型
    let temperature = -10;           // 类型推断为 i32
    let big_number: u64 = 1_000_000; // u64：无符号64位整数，下划线提高可读性
    println!("计数: {}, 温度: {}°C, 大数: {}", count, temperature, big_number);
    
    // 浮点数类型：f64（64位）是默认类型
    let price = 29.99;               // 类型推断为 f64
    let pi: f32 = 3.14;              // f32：32位浮点数
    println!("价格: ${}, PI值: {}", price, pi);
    
    // 字符串类型：&str（字符串切片）和 String（可增长字符串）
    let greeting = "Hello, World!";  // &str：字符串字面量
    let mut name = String::from("Alice"); // String：堆上分配的字符串
    name.push_str(" Smith");         // 可以修改 String
    println!("问候语: {}, 姓名: {}", greeting, name);
    
    // 布尔类型：bool
    let is_raining = true;           // 真
    let _is_sunny: bool = false;      // 加上 _ 前缀表示故意不使用
    let is_adult = age >= 18;        // 表达式结果也是布尔值
    println!("正在下雨吗? {}, 是成年人吗? {}", is_raining, is_adult);
    
    // 字符类型：char（Unicode 字符）
    let letter = 'A';                // 注意：单引号表示字符
    let emoji = '😊';                // 支持 Unicode
    let chinese = '中';              // 支持中文字符
    println!("字母: {}, 表情: {}, 中文: {}", letter, emoji, chinese);
    
    /* 说明：
       - 整数：有符号（i8, i16, i32, i64, i128）和无符号（u8, u16, u32, u64, u128）
       - 浮点数：f32 和 f64，默认是 f64
       - 字符串：&str（不可变引用）和 String（可变、堆分配）
       - 布尔值：bool 类型，只有 true 和 false
       - 字符：char 类型，使用单引号，支持 Unicode
    */
    
    // 更多数据类型细节
    println!("\n=== 数据类型进阶 ===");
    
    // 数组：固定大小，所有元素类型相同
    let months: [&str; 12] = [
        "一月", "二月", "三月", "四月", "五月", "六月",
        "七月", "八月", "九月", "十月", "十一月", "十二月"
    ];
    println!("第一个月: {}", months[0]);
    println!("共有 {} 个月", months.len());
    
    // 元组：可以包含不同类型的值
    let person: (&str, i32, f64) = ("张三", 30, 175.5);
    println!("姓名: {}, 年龄: {}, 身高: {}cm", person.0, person.1, person.2);
    
    // 解构元组
    let (name, _age, _height) = person;
    println!("解构后 - 姓名: {}", name);
    
    // 切片：引用数组的一部分
    let slice = &months[0..3];  // 前三个月
    println!("第一季度: {:?}", slice);
    
    // 类型别名
    type Kilometers = i32;
    let distance: Kilometers = 5;
    println!("距离: {} 公里", distance);
    
    println!();
    
    // ===== 1.3 运算符 =====
    
    // 场景：计算购物总价并判断是否享受优惠
    
    // 算术运算符：用于数学计算
    let price = 50;                  // 单价
    let quantity = 3;                // 数量
    let total = price * quantity;    // 乘法
    let tax = total / 10;            // 除法（整数除法会截断小数）
    let final_price = total + tax;   // 加法
    let remainder = total % 10;      // 取余
    println!("总价: {}, 税: {}, 最终价格: {}, 余数: {}", 
             total, tax, final_price, remainder);
    
    // 比较运算符：用于比较值的大小或相等性
    let member_level = 2;
    let is_vip = member_level >= 2;          // 大于等于
    let is_exactly_165 = final_price == 165; // 等于
    let _is_not_zero = final_price != 0;      // 不等于  // 加上 _ 前缀
    println!("是VIP吗? {}, 正好165? {}", is_vip, is_exactly_165);
    
    // 逻辑运算符：用于组合多个条件
    let has_discount = final_price > 100 && is_vip;     // AND：两个条件都满足
    let needs_delivery = final_price < 50 || !is_vip;   // OR：至少一个条件满足
    println!("享受折扣? {}, 需要运费? {}", has_discount, needs_delivery);
    
    // 位运算符示例
    let a: u8 = 0b1010;              // 二进制：10
    let b: u8 = 0b1100;              // 二进制：12
    let and_result = a & b;          // 按位与
    let or_result = a | b;           // 按位或
    let xor_result = a ^ b;          // 按位异或
    println!("位运算: {} & {} = {}, {} | {} = {}, {} ^ {} = {}", 
             a, b, and_result, a, b, or_result, a, b, xor_result);
    
    /* 说明：
       - 算术运算符：+, -, *, /, %（注意整数除法会截断）
       - 比较运算符：==, !=, <, >, <=, >=
       - 逻辑运算符：&&（与）, ||（或）, !（非）
       - 位运算符：&, |, ^, <<, >>（用于二进制位操作）
       - Rust 是强类型语言，运算符两边的类型必须匹配
    */
    
    // 运算符进阶
    println!("\n=== 运算符进阶 ===");
    
    // 复合赋值运算符
    let mut value = 10;
    value += 5;                      // 相当于 value = value + 5
    value *= 2;                      // 相当于 value = value * 2
    println!("复合运算结果: {}", value);
    
    // 类型转换（必须显式）
    let integer = 42;
    let float = integer as f64;      // 显式转换为 f64
    println!("整数 {} 转换为浮点数 {}", integer, float);
    
    // 溢出处理
    let max_u8 = 255u8;
    // let overflow = max_u8 + 1;    // 在 debug 模式下会 panic
    let wrapped = max_u8.wrapping_add(1);        // 包装算术，结果为 0
    let checked = max_u8.checked_add(1);         // 返回 Option
    let saturated = max_u8.saturating_add(1);   // 饱和算术，结果为 255
    println!("包装加法: {}, 检查加法: {:?}, 饱和加法: {}", 
             wrapped, checked, saturated);
    
    // 短路求值
    let x = 5;
    let result = x > 0 && {
        println!("这会被执行，因为 x > 0");
        x < 10
    };
    println!("短路求值结果: {}", result);
}