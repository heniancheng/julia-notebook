# 2020/07/20

# 顺序控制
z=begin
    x=1
    y=2
    x+y
end
println(z)
println((x=1;y=2;x+y))

# 条件控制
if z > 2
    println("z > 2")
else
    println("z < 2")
end

# 循环控制
i=1
while i <= 5
    global i
    print(i, " ")
    i += 1
end
println()

for i ∈ 1:5
    print(i," ")
end
println()
for i in 2:3, j in (1,2,3,4,5)
    print((i,j)," ")
end
println()
