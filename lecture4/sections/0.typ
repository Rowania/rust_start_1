#import "../globals.typ": *

== 简介

#slide[
  #grid(
    columns: (28em, 1fr),
    // 固定左栏宽度+右栏自适应
    gutter: 1em,
    // 栏间距
    // 左栏: 文字内容
    [
      #link("https://www.rust-lang.org/zh-CN/")[🦀Rust官网]

      在编程语言的世界里，开发者常常面临一个经典的三难选择：性能、安全与抽象，三者似乎难以兼得。

      C/C++等系统级语言提供了极致的性能和底层控制力，但将内存安全的重担完全交给了开发者，稍有不慎便会引发难以追踪的bug。

      Python等高级语言通过垃圾回收机制提供了内存安全和高度的抽象能力，让开发变得简单快捷，却在性能上做出了巨大牺牲。

      Rust的出现，正是为了挑战这一“不可能三角”，它承诺提供与C++相媲美的性能、零成本的抽象，以及在编译时就强制保障的内存安全。

    ],
    [
      #image("../images/0.png", width: 100%, alt: "0")
    ],
  )
]
== 环境
#slide[
  也许你受够了c++的环境配置…
  #image("../images/1.png", width: 20%, alt: "1")
  “这报错是啥玩意儿啊？`undefined reference to`… 我明明链接了啊！昨天还好好的，今天怎么就不行了？编译器是不是在耍我？报的错跟实际问题根本不是一回事！”

  “行，我打个断点调试一下。嗯？GDB 怎么连不上了？`Could not find a task to run`… 我！昨天刚配好的环境，谁又给我动了？”
]
#slide[
  “算了，不管了，IDE 应该能帮我吧。诶？我的代码提示呢？我的自动补全怎么没了？昨天还丝滑流畅，今天就跟个记事本一样。右下角 `clangd` 在那转圈，点开一看，‘正在下载 LLVM’，进度条万年不动。行，我等。半小时后，‘下载失败’。你给的那个下载链接，我用浏览器都打不开啊！”

  “我上官网手动下。好家伙，MinGW、MinGW-w64、MSYS2、TDM-GCC……到底该下哪个？网上十篇教程有八种说法，每个都说自己的是对的。环境变量配来配去，`PATH` 里一长串，跟个藏宝图似的，我自己都看不懂了。”

  “所以，GNU、MinGW、LLVM、Clang，你们这帮神仙到底是什么关系啊？不就是想在 Windows 上跑个 C++ 吗？怎么搞得跟要发射火箭一样复杂？我真的受够了！”
]
#slide[
  python似乎也不是很好用
  #image("../images/2.jpg", width: 20%, alt: "2")
  “项目要求用 `conda`。行，`conda create -n my_env`，一气呵成。然后 `conda install some_package`，‘Package not found in current channels’。怎么回事？conda 里居然没有这个包？！”

  “没事，我不是还有 `pip` 吗？`pip install some_package`，‘Successfully installed’。完美！一运行，`ImportError`。为什么？！我不是已经装上了吗？”
]

#slide[
  - 那么rust是如何做的呢？
  #image("../images/3.svg", width: 100%, alt: "2")
]


#slide[
  #image("../images/4.gif", width: 25%, alt: "Rust Crab")

  #text[
    实践环节：动手安装一下Rust环境#link("https://www.rust-lang.org/zh-CN/learn/get-started")[🦀 Rust安装指南]

    该页面会自动检测你的操作系统（Windows、Linux、macOS），并给出最适合你的安装方式。

    这也是我们学习 Rust 的第一步，建议大家按照官方推荐流程完成安装，体验 Rust 简洁高效的环境配置。（可以和上边的两种语言形成对比）
  ]
]

#slide[
  #image("../images/5.svg", width: 100%, alt: "5")
]

#slide[
  - 动手实践：实现第一个`Hello World!`


  ```bash
  cargo new my_app
  ```

]

#slide[
  #image("../images/6.svg", width: 100%, alt: "6")
  这里对应了两种不同的项目结构
  - 二进制 crate (Binary Crate)：生成一个可执行程序（有 main.rs 文件）。目的是运行。
  - 库 crate (Library Crate)：生成一个库，供其他程序调用（有 lib.rs 文件）。目的是被依赖。
]
#slide[
  #grid(
    columns: (20em, 1fr),
    // 固定左栏宽度+右栏自适应
    gutter: 1em,
    // 栏间距
    // 左栏: 文字内容
    [
      crate 是什么？

      #set text(red)
      Crate 是 Rust 语言中最小的编译单元
      #set text(black)

      如何理解呢？

      可以将Crate理解为一个完整的细胞

      细胞器 === 私有的模块和数据结构

      细胞膜 === 公共API

      生物（细胞组合） === 应用程序（crate组合）

    ],
    [
      #image("../images/7.png", width: 100%, alt: "6")
    ],
  )
]

== 语法
#slide[
  #grid(
    columns: (22em, 1fr),
    // 固定左栏宽度+右栏自适应
    gutter: 1em,
    // 栏间距
    // 左栏: 文字内容
    [

      随着对编程语言学习的深入，我们发现，各种编程语言都能解决所有理论上可通过编程解决的问题。

      #set text(red)
      那么，其背后的本质是什么呢？
      #set text(black)

      我认为，其本质在于它们都具备了图灵完备的计算能力。

      然而，这股强大的潜能需要一套精确的规则来表达和控制，而这套规则，正是语法结构。它为我们驾驭这种强大的计算能力提供了具体的操作方法。

      所以，想要学习一门编程语言，首先要学会的就是它的语法结构，因为这是我们与机器沟通、并指挥其完成任务的第一步。

    ],
    [
      #image("../images/8.png", width: 100%, alt: "8")
    ],
  )
]

#slide[
  #image("../images/9.svg", width: 100%, alt: "9")
  #image("../images/10.svg", width: 100%, alt: "10")
  #image("../images/11.svg", width: 100%, alt: "11")
]


#slide[
  - 让我们使用实际的代码例子来说明这些语法

  #link("https://github.com/shihuaidexianyu/rust-example")[🦀 rust-example]

]
#slide[
  - 遮蔽 (Shadowing)

  定义：在同一作用域内，使用 `let` 关键字可以声明一个与之前变量同名的新变量，这个新变量会“遮蔽”旧变量。

  ```rs
  let count = 10; // "全局" (或外层作用域) 变量

  fn my_func() {
      // 如果你只想读取，没问题
      println!("{}", count); // 这会访问外层的 count，输出 10

      // 如果你想创建一个新的局部变量来遮蔽它，必须用 let
      let count = count + 1; // 显式声明一个新的、局部的 count
      println!("{}", count); // 输出 11
  }
  ```

]
#slide[

  核心优势:

  1. 允许改变类型：这是与 `mut` (可变变量) 的最大区别。你可以用一个新类型的变量遮蔽旧变量，非常适合数据转换的场景。

    ```rust
    let spaces = "   ";         // spaces 是 &str 类型
    let spaces = spaces.len(); // spaces 被遮蔽，新变量是 usize 类型
    ```

  2. 维持不可变性：每次遮蔽都会创建一个新的、默认不可变的变量。这有助于防止在后续代码中意外修改值，增强了代码的安全性。

  与 Python 的区别：Rust 的遮蔽是显式的（必须用 `let`），且不会产生 Python 中因隐式创建本地变量而导致的 `UnboundLocalError` 陷阱。

  ```python

  count = 10  # 全局变量

  def my_func():
      # Python 看到下面有对 count 的赋值操作，
      # 于是它认为 count 是一个局部变量，而不是外面的全局变量。
      # 但是在 print 的时候，这个局部的 count 还没有被赋值定义。
      # 所以会抛出 UnboundLocalError
      print(count) # 错误！ UnboundLocalError: local variable 'count' referenced before assignment
      count += 1

  my_func()
  ```
]
#slide[
  代码块作为表达式 (Block as an Expression)

  在 Rust 中，`{}` 代码块本身可以是一个表达式，能够计算并返回一个值。

  代码块的返回值是其最后一行没有分号的表达式的值。

  ```rust
  let x = {
      let y = 5;
      y + 1 // 没有分号，表达式的值 6 将作为整个块的返回值
  }; // x 的值现在是 10
  ```

  代码块中可以使用`return`关键字，它会立即中断代码块的执行，并返回`return`之后的内容（中断赋值、中断函数）。

]
#slide[
  enum 和 match 是 Rust 中一对相辅相成、功能极其强大的组合。

  它们共同构成了 Rust 实现类型安全和代码表现力的核心基石之一。

  如果说所有权系统是 Rust 在内存安全上的答案，那么 enum 和 match 就是 Rust 在数据结构和控制流上的优雅解决方案。








]
#slide[
  enum 的核心思想是：一个类型可以是多种不同可能性中的一种。

  这听起来有点像其他语言中的枚举(但说真的我感觉我都没用过其它语言的枚举)，但 Rust 的 enum 远不止于此。其他语言的枚举通常只是对整数的一组命名常量，而 Rust 的 enum 变体可以携带不同类型和数量的数据。

  这使得 enum 成为一种创建自定义“和类型”（Sum Type）的强大工具。一个 enum 的值，只能是其定义的变体之一，绝无其他可能。
]


#slide[

  我们刚刚看到的语法，都是在为一个更宏大、更核心的机制服务，这个机制就是所有权系统。它深刻地影响着我们如何编写 Rust 代码。

  接下来让我们看看所有权机制。

]
== 所有权机制
#slide[

  所有权是Rust最核心、最独特的特性，它使得Rust无需垃圾回收器（GC）就能保证内存安全。理解所有权，是掌握Rust的关键。

  要理解Rust的所有权，首先要明白它解决了什么问题。
  程序的内存通常分为栈（Stack）和堆（Heap）。

  栈的分配和回收速度极快，遵循“后进先出”的原则，用于存储大小固定的数据。（但是它在程序编译的时候就确定了，且比较的小）

  堆则用于存储大小在编译时未知或可能变化的数据，分配和回收相对较慢，且需要精细管理 。（是在程序运行的过程中确定的，但是需要额外的管理）

  而所有权机制主要针对的是位于堆上的数据。


]
#slide[
  #grid(
    columns: (15em, 1fr),
    // 固定左栏宽度+右栏自适应
    gutter: 1em,
    // 栏间距
    // 左栏: 文字内容
    [

      我们可以用一个“餐厅停车”的比喻来理解不同语言的内存管理方式：

      假设现在有一个餐厅的停车场，它很大，大到需要使用导航（内存地址）才能找到在哪里停车。

      作为管理员，你需要知道哪里有位置，并指导顾客把车停到空位上。

      如何完成这件事？？？


    ],
    [
      #image("../images/12.png", width: 100%, alt: "12")
    ],
  )
]
#slide[
  - C/C++ (手动管理):
    - 你得自己找车位停车，并牢牢记住车停在哪儿（就像用 malloc 分配内存）。
    - 吃完饭走的时候，你必须自己负责把车开走（调用 free）。
    - 如果你忘了开走，这辆车就会永远占着车位（内存泄漏）。如果你告诉朋友车在A区，但自己提前开走了，朋友就会扑空（悬垂指针）。
  - Python (垃圾回收):
    -你把钥匙交给门口的服务员（创建对象），就可以直接去吃饭了，非常省心。
    - 服务员会雇一个清洁工（垃圾回收器），他会定时巡视，看到哪些车的车主已经结账走了，就把这些“没人要”的车开走处理掉。
    - 这很方便，但清洁工工作时可能会暂时堵住停车场入口，造成一点点延迟（GC停顿）。

]
#slide[
  - Rust (所有权):
  - 你拿到一张智能钥匙卡（所有权），这张卡与你的餐桌绑定。这是移动这辆车的唯一凭证。
  - 规则极其严格：当你结账离开餐厅时（变量离开作用域），结账系统会强制收回你的钥匙卡，并立即自动把车位清空。
  - 你根本没有机会忘记或搞错，因为不按规矩来，结账系统（编译器）那一关就过不去。
]
#slide[
  #grid(
    columns: (15em, 1fr),
    // 固定左栏宽度+右栏自适应
    gutter: 1em,
    // 栏间距
    // 左栏: 文字内容
    [

      - 继续刚才的例子
      - 现在采用了Rust驱动的停车场管理系统，但是光有这些功能不足以满足顾客的需求

      - 新的需求:
        - 在吃饭期间，顾客的朋友想用一下他的车，但顾客并不想把唯一的“智能钥匙卡”交给他的朋友。


    ],
    [
      #image("../images/13.png", width: 100%, alt: "12")
    ],
  )
]


#slide[
  - 那么Rust是如何完成这件事的呢？
    - Rust为此提供了借用（borrowing）机制，允许在不转移所有权的情况下临时访问数据。
    - 但是借用满足以下两条规则：
      - 在任何给定时间，你可以拥有任意多个不可变引用（`&T`）。
      - 或者，你只能拥有一个可变引用（`&mut T`）。
  - 用停车场来理解
    - 不可变引用 (&T)：“餐厅可以给很多位顾客你车位的照片（&T），他们都可以凭照片找到你的车并欣赏它，但谁都不能开走或改装它。只要有人在看，车就必须停在原地保持原样。” -> 可以有多个不可变引用，但此时不能有可变引用。

    - 可变引用 (&mut T)：“餐厅只能把唯一一把代驾钥匙（&mut T）交给一位代驾司机。当司机拿着钥匙时，为了安全，其他人（包括你自己）都不能靠近这辆车（不能有任何其他引用），直到司机把钥匙还回来。” -> 只能有一个可变引用，且此时不能有任何不可变引用。
]


== 尾声
#slide[
  #align(center)[#text(1.5em, weight: "bold")[回顾与总结]]
  #v(1em)
  #align(center)[#text(1.2em)[Rust：挑战“不可能”的现代系统编程语言]]
  #v(1.5em)

  #grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    [
      #heading(level: 3)[核心优势]
      - *告别环境噩梦:* 一站式工具链 `rustup` 和 `cargo`。
      - *性能与安全的统一:* 媲美 C++ 的性能，无 GC 开销。
      - *零成本抽象:* 高度抽象，无运行时损耗。
    ],
    [
      #heading(level: 3)[关键机制]
      - *所有权 (Ownership):* 编译时保证内存安全。
      - *借用 (Borrowing):* 通过 `&` 和 `&mut` 实现安全的数据共享。
      - #text(blue)[编译器的“唠叨”，是你最可靠的伙伴。]
    ],
  )
]

#slide[
  #align(center)[#text(1.5em, weight: "bold")[您的 Rust 之旅才刚刚开始]]
  #v(2em)

  #grid(
    columns: (1fr, 1fr),
    gutter: 3em,
    [
      #heading(level: 3)[下一步探索]
      - *泛型 (`Generics`) 与 `Trait`*: 编写可复用的抽象代码。
      - *生命周期 (`Lifetimes`)*: 深入理解借用检查器。
    ],
    [
      #heading(level: 3)[推荐资源]
      - #link("https://kaisery.github.io/trpl-zh-cn/")[《Rust 程序设计语言》] (The Book)
      - #link("https://doc.rust-lang.org/rust-by-example/zh/index.html")[Rust by Example]
      - #link("https://rustcc.cn/")[Rust 中文社区]
    ],
  )

  #v(3em)
  #align(center)[
    #text(1.5em, weight: "bold")[欢迎加入 Rustacean 的行列！]
    #image("../images/4.gif", width: 50%, alt: "Rust Crab")
  ]

]
