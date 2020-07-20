julia-notebook
==========

一份Julia的学习手册。

## 1 使用前的准备工作

### 1.1 概述

* MIT开发，并开源、免费。
* 适用于高性能数值计算
* 适用于分布式并行计算
* 有些像Python语法

### 1.2 学习资源

* 中文社区：  
<https://discourse.juliacn.com>
* 官方学习：  
<https://julialang.org/learning>
* Github仓库：  
<https://github.com/JuliaLang/julia>
* Github手册：  
<https://github.com/JuliaComputing/JuliaBoxTutorials>

### 1.3 Julia安装

Junia安装：<https://julialang.org/downloads>

### 1.4 IDE

* VS Code（推荐）
  * 博客园帮助：<https://www.cnblogs.com/andrew-address/p/12694531.html>
* Atom+Juno
  * Atom下载：<https://atom.io/>
  * 官网帮助：<http://docs.junolab.org/latest/man/installation/>
  * CSDN帮助：<https://blog.csdn.net/IT_xiao_bai/article/details/81623358>
* JuliaPro（国内不建议用）
  * JuliaPro下载：<https://juliacomputing.com/products/juliapro.html>
  * CSDN帮助：<https://blog.csdn.net/weixin_41923961/article/details/88583072>
* Jupyer notebook
  * 简书说明：<https://www.jianshu.com/p/91365f343585>
  * 官方说明：<https://jupyter.org/install>
* nteract桌面环境
  * nteract下载：<https://nteract.io/>
  * 软件安装前确保本机有Python执行环境，推荐安装Anaconda
  * Anaconda安装：<https://www.anaconda.com/products/individual>
* 网页环境：<https://repl.it>

## 2 基本语法

### 2.1 变量

* 直接声明初始化，函数`typeof(var)`可得到类型。
* Unicode数学符号可以使用反斜杠加LaTeX符号名，再按TAB健打出。
* 一些内置变量pi可直接使用

### 2.2 数值

* 无符号整数/二进制/八进制：0x32、0b10、0o17
* 科学表示数：2.56e-2、2.56E-2
* eps、Inf、-Inf、NaN、-NaN
* 复数与有理数：1+2im、3//5
* 字符：’a’
* 字符串：x=”abc”、’’’abc’’’（索引引用x[1:4]、x[end]）

### 2.3 字符串

* 单字符可以与整数互相切换`Int(‘x’)`、`Char(0x32)`
* 字符串字面量由双引号或三重双引号分隔
* 拼接（string函数、*、$）
* 子串（SubString函数、str[n:m]）

### 2.4 流程控制

#### 2.4.1 条件结构

结构：`if-elseif-else-end`

举例：

#### 2.4.2 循环结构

结构1：`while-end`

举例1：

结构2：`for i in [v1,v2]`或者`for i=n1:n3`

举例2：

**小技巧：**

* `global`声明循环外变量作用域
* `local`声明第一个循环变量作用域
* 函数里面的变量作用域为整个函数，不需要声明
* break与continue语句类似其他语言用法

#### 2.4.3 复合结构

* `begin … end`返回最后一个子表达式的值
* 可被替代`(exp1;exp2;exp3)`

#### 2.4.4 异常处理

结构：`try-catch-end`

举例：

### 2.5 函数

#### 2.5.1 基本定义与使用

* 定义：
`function f(x,y) … end` 或者`f(x,y)=…`

* 使用：`f(3,4)`
* 元组、数组作为实参调用：`f((3,4)…)`
* 返回值：return或者直接最行一行、逗号隔开返回多个值的元组

#### 2.5.2 特殊函数定义与使用

* 特殊参数：`function f(x,y; age=16,score=96)`
* 默认参数：`function f(x::Int32,y::Int32=96,z::String=”abc”)`
* 变长参数：`function f(x,y…) … end`（可通过y得到后面的参数列表）

#### 2.5.3 函数对象

* 概念：定义的函数是一个Function对象，从而函数内部可以继续定义函数作为返回值（isa(add, Function)）

* 运算符作为函数对象：`+, -, *, /`。比如：`add = +`，`sub = -`，`mul = *`，`mysum = add`。

* 函数作为参数；`function(f:Function, x, y)`

* 函数作为返回：`return add`（调用`f()()`或者`a=f() a()`）

#### 2.5.4 匿名函数

定义：无函数名，用于函数体比较简单，函数作为参数与返回值

创建：`function (param) … end` 或者`(param) -> expression`、`x -> 2x`

举例1：（作为参数）

* 先定义
  
```Julia
function g(f:Function, x, y, z)
  f(x,y,z)
end
```

* 再调用

```Julia
g((x,y,z)->x*y+z,2,3,4)
=======================
g(2,3,4) do x, y, z x*y+ z end
```

举例2：（作为返回值）

* 先定义

```Julia
function f1() x -> x^2 + 2x end
```

* 再调用

```Julia
a=f1()
a(2)  
=============
f1()(2)
```

#### 2.5.5 参数限定

概念：限定参数类型的范围

用法：

```Julia
function f1(x1::T1,x2::T2) where {T1 <: Int32, T2 <: Int32} … end
```

#### 2.5.6 多态分发（类似方法重载）

* 查看同名方法个数：methods(f)
* 同名函数匹配规则：先严格，再宽松

注意：带默认值函数相当于多个同名函数，可被覆盖。比如有默认值函数`function f(x, y=2,z=3) … end`。`function f(x,y) … end`可覆盖`f(x,y,z=3)`

#### 2.5.7 常用函数

函数 | 功能 |
---------|---------
`include(“file”)` | 导入文件
`print()/println()` | 输出字符串
 `readline()` | 输入字符串
 `parse(type,var)` | 将字符串var解析成type类型（整型、浮点型、复数）
 `sqrt(a)` | 开平方
 `rand(n)/randn` | 生成n个0-1的随机数（正态分布）
 `rand([])` | 从指定数据中生成一个随机数
 `rand(n:m,k)` | 从n-m之间生成k个随机数
 `rand(n:m,k,l)` | 从n-m之间生成k*l个随机数
 `range(b,stop,len/k)` | 从b-stop中生成len个/步长为k的序列
 `n:m` | n-m步长为1的序列
 `sort()` | 可对数组排序

## 3 高级用法

### 3.1 协程初识

类似函数，但无调用者与被调用者区分。使用Channel机制实现。先进先出的队列，允许多个Task对它进行读和写。

实例：

* 先定义

  ```Julia
  function producer(c::Channel)
  put!(c,”start”)
  end
  ```

* 再使用

  ```Julia
  chnl=Channel(producer)
  take!(chnl)
  ```
