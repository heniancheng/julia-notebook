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

```Julia
if z > 2
    println("z > 2")
else
    println("z < 2")
end
```

#### 2.4.2 循环结构

结构1：`while-end`

举例1：

```Julia
i=1
while i <= 5
    global i
    print(i, " ")
    i += 1
end
```

结构2：`for i in [v1,v2]`或者`for i=n1:n3`

举例2：

```Julia
for i ∈ 1:5
    print(i," ")
end

for i in 2:3, j in (1,2,3,4,5)
    print((i,j)," ")
end
```

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

### 3.1 复杂数据类型

#### 3.1.1 特征数据

* 数组

  定义：`arr=[1,2,3]`  
  使用：`arr[1]`、`arr[2:3]`、 `for x in arr`  
  更新：`arr[2]=3`  
  添加：`push!()`  
  删除：`deleteat!(arr,3)`、 `deleteat!(arr,1:2)`

* 元组（**类似于数组，但不能修改**）

  定义：`tup=(1,2,3)`  
  使用：`tup[1]`、`tup[2:3]`、`for x in tup`  
  类似字典定义：tup=(name=”hc”,age=32)  
  类似字典使用：`tup.name`、`tup.age`  
  常用函数：`length(tup)`、`in(1,tup)`  
  分解给变量：`a,b,c=(1,2,3) == a=1 b=2 c=3`

* 字典（类比成映射）

  定义：`dict=Dict(key=>value,key=>value)`  
  使用：`keys()`、`values()`、`dict[“key”]`  
  操作字典：`dict[“key”]=”new”`、`delete!(dict,”key”)`  
  常用函数：`in(“key”=>”value”, dict)`、`haskey(dict, “key”)`

* 集合（无序不重复）

  定义：`set=Set([[1,2,3],4,5,”hello”])`  
  功能：数组或元组去重，成员测试。`if x in set`  
  运算：`push!()`、`pop!()`、`union()`、`intersect()`、`setdiff()`

#### 3.2.2 多维数组

* 基本使用
  * 定义：  
  `matrix=[1 2 3;4 5 6]`  
  `rand(1:100,3,4)`  
  `ones(m,n)`/`zeros(m,n)`  `trues(m,n)/falses(m,n)`  
  `reshape(ma,m,n)`/`copy(ma)`
  * 怎么引用元素？（见DataFrames包使用）
  * 引用元素：  
  `matrix[1,2]`  
  `matrix[end,end]`  
  `matrix[:,2]`
* 矩阵操作
  * 拼接：  
  横向`[m1 m2]`/纵向`[m1;m2]`  
  嵌套矩阵`[m1,m2]`
  * 运算：  
  转置`m’`  
  乘法`m1*m2`/除法`m1*m2^(-1)`
  * 常用函数：  
  `typeof()`/`eltype()`  
  `length()`/`ndims()`、/`size()`
  * 点运算：  
  `round/abs/sqrt/sin.(ma)`
* 矩阵过滤
  * 列过滤：  
  `m[m[:,4].<10,:]`筛选行
  * 行过滤：  
  `m[:,m[4,:].<10]`筛选列
  * 行与列过滤：  
  `m[m[:,4].<10, m[4,:].<10]`
* 其他函数  
  * 用于创建数组：  
  `hcat(1,2,3,4)`  
  `vcat(1,2,3,4)`  
  `hvcat(1,2,3,4)`  
  * 索引位置：  
  `CartesianIndex(i,j,k…)`  
  `LinearIndices(matrix)`  
  * 创建视图：  
  `view(matrix,1:2,1:2)`  
  `@view matrix[1:2,1:2]`  
  * 稀疏数组：（`SparseArrays`、`LinearAlgebra`）  
  `spzeros()`/`sparse(I,3,5)`  
  `sparse(UniformScaling(10),3,5)`  
  `sprand(3,5)`  
  * 矢量化计算：  
   `map(f,[v1,v2,v3])`

#### 3.2.3 结构类型

* 复合类型  
定义：`mutable struct stu var::Float32 var::Int32 end`  
查看内部结构：`dump(stu)`、`fieldnames(stu)`  
使用：对象.成员变量
* 联合类型  
定义：`Union{T1,T2}`
* 构造函数  
定义：与类型相同的函数
* 类型参数化  
定义：  
`mutable struct stu{T1,T2} var::T1 var::T2 end`  
参数化抽象类型：  
`abstract type Point{T1} end`

### 3.2 日期与时间（Dates包）

#### 3.2.1 Date函数

* 创建：  
`t=Date(2019)/Date(2019,2)/Date(2019,2,2)/Dates.today()`
* 获取：  
`Dates.year(t)/month(t)/day(t)/yearmonth(t)/monthday(t)`  
`Dates.Year(t)/Month(t)/Day(t)`
* 计算天数：  
`dump(t)/t.instant/Dates.value(t)`
* 星期几：  
`dayofweek(t)/dayname(t)`
* 月份：  
`month(t)/monthname(t)`  
`daysinmonth(t)`月份有多少天  
`today()`当前日期
* 天数/季节：  
`dayofyear(t)`当年第几天  
`isleapyear(t)`是闰年？  
`quarterofyear(t)`第几季度  
`dayofquarter()`所在季度第几天

#### 3.2.2 DateTime函数（带时分秒）

* 创建：`DateTime(2019,…)/Dates.now()`  
获取：`Dates.hour(t)/minute(t)/second(t)`

#### 3.2.3 时间运算

* 年份相加：  
`Dates.Year(t1)+Dates.Year(t2)`
* Date()运算：  
`Dates.today()+Dates.Year(2)+Dates.Month(3)+Dates.Day(10)`
* DateTime()运算：  
`Dates.now()+Dates.Hour(2)+Dates.Minute(2)+…`

#### 3.2.4 时间序列（TimeSeries包）

* 创建：  
`ts=collect(Date(2018,1,1):Dates.Day(5):Date(2018,6,6))`
* 时间数据表：  
`ta=TimeArray(ts,rand(length(ts),2))`
* 得到时间序列：  
`timestamp(ta::TimeArray)`
* 得到随机数据：  
`values(ta::TimeArray)`

### 3.3 文件读写

#### 3.3.1 普通文件读写

* 创建：  
  `myfile=open(“filename”,”w/a/r+”)`，返回类型是IOStream
* 写入：  
  `write(myfile,”write some content”)`  
  调用close(myfile)才从缓冲区写入文件，数字以ASCII码写入  
  open() do f结构可以免去close()手动调用
* 读取：  
  readlines(myfile)读取所有  
  readline(myfile)读取当前行  
  read(myfile,Char/String)读取一个字符或整个内容

#### 3.3.2 矩阵读写

* 使用模块：`using DelimitedFiles`
* 写入：`writedlm(myfile,mymatrix)`
* 读取：`readdlm(myfile)`

#### 3.3.3 CSV文件读取

* 使用模块：`using DelimitedFiles`
* 写入：`writedlm(myfile,mymatrix,’,’)`
* 读取：`readdlm(myfile)`读取的是字符串

#### 3.3.4 IOBuffer内存对象

* 创建：`myio=IOBuffer()`
* 写入：`write(myio,”hello”,”world”)`
* 读取：`String(take!(myio))`

### 3.4 DataFrame数据

#### 3.4.1 包的查看与安装

* 查看：`import Pkg;Pkg.status()`或者pkg模式下`status`
* 安装：`import Pkg;Pkg.add()`或者pkg模式下`add package`
* 移除：`import Pkg;Pkg.rm()`或者pkg模式下`rm package`

#### 3.4.2 表格显示矩阵

* 由矩阵创建：  
`mydf=DataFrame(mymatrix)`
* 由数组创建：

```Julia
mydf=DataFrame()
mydf[:name1]=mya1
mydf[:name2]=mya2
```

* 操作：  
`size(mydf)`得到行与列  
`size(mydf,1)`得到行  
`size(mydf,2)`得到列
* 列的选择与查看：  
`mydf[2:4]`或者`mydf[[:name1,:name2]]`
* 行的选择与查看：  
`mydf[2:4,:]`、`eachrow(mydf)`结合for一行一行使用

#### 3.4.3 函数的应用

* 最大最小  
`maximun(mydf.name1)`  
`minimum(mydf.name1)`
* 求和：`sum(mydf.name1)`
* 升序降序：  
`sort!(mydf,cols=[:name1],rev=true/false)`
* 统计信息：  
`describe(mydf)` 平均数/最小值/中位数/最大值/数据类型

#### 3.4.4 读取CSV文件

```Julia
Pkg.add(“CSV”)
CSV.read(“myfile”;header=[“col1”,”col2”,”col3”])
```

### 3.5 模块

#### 3.5.1 基本定义与使用

* 定义

  `module modname`可用export导出模块里面的函数

* 使用

  `using modname`  `modname.fun()`调用模块函数，或者直接调用函数`fun()`  
  import可代替using，还可以修改模块  
  需要将该模块保存成.jl文件，并将路径位置加入LOAD_PATH中

  ```Julia
  push!(LOAD_PATH,"/home/runner/JuliaStudy/0618")
  using mymod1
  fun1()
  ```

#### 3.5.2 标准模块

* Main模块：顶层模块，当前运行模块`varinfo()`
* Core模块：语言的核心部分，默认声明了该模块
* Base模块：基本功能部分，默认声明了该模块

### 3.6 元编程与并行计算

### 3.7 协程初识

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
