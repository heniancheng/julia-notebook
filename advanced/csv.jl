# 2020/07/20

# CSV文件读取数据
using DelimitedFiles
matrix1 = rand(1:100,10,8)
myf1 = open("mycsv.csv","w")
writedlm(myf1,matrix1,',')
close(myf1)

using CSV
myf2 = open("mycsv.csv","r")
cols = ["x1","x2","x3","x4","x5","x6","x7","x8"]
data = CSV.read("mycsv.csv";header=cols)
println(data)