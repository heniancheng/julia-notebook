# 2020/07/20

# DataFrame数据包使用
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
println(studf1[3:5,[:成绩,:评级]])
println(maximum(studf1.成绩))
println(sum(studf1.成绩)/6)