# 2020/07/20

# 元编程与并行计算
# 表达式使用
str = "12-3"
ex=Meta.parse(str)
dump(ex)

ex2 = :(5+6)
println(typeof(ex2))

ex3=Expr(:call,:+,4,8)
dump(ex3)

# 宏应用
using DataFrames
mya1 = ["周涛","王群","张可","张亮","周远","王雨欣"]
mya2 = ["女","男","女","男","男","女"]
mya3 = [12,14,9,15,8,14]
mya4 = [96,86,75,98,100,63]
mya5 = ["A","B","C","A","A","D"]
studf1 = DataFrame()
studf1[:姓名] = mya1
studf1[:性别] = mya2
studf1[:年龄] = mya3
studf1[:成绩] = mya4
studf1[:评级] = mya5