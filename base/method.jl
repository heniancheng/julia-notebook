# 2020/07/20

# 函数基本定义与调用
add(x,y) = x + y
println("3 + 4 = ", add(3,4))

function addtwo(x,y)
    return x + y
end
println("3 + 4 = ", addtwo(3,4))
println("3 + 4 = ", addtwo((3,4)...))   #元组、数组作为实参调用

# 函数多返回值
function maxmin(x,y)
    if x > y
        return (x,y)
    else
        return (y,x)
    end
end
tu=maxmin(2,10)
println("max: ",tu[1]," min: ",tu[2])

# 多种参数传递方式
function BMI(height,weight,sex="男")
    if sex == "男"
        return height * weight * 0.22
    else
        return height * weight * 0.2
    end
end
println("BMI: ", BMI(180,80,"女"))

function myplot(x,y;style="solid",width=1,color="black")
    println("x: ",x," y: ",y," width: ",width," style: ",style," color: ",color)
end
myplot(3,2,style="lined")

function sums(args...)    #args::Vararg(Any,3)
    sum = 0
    for x in args
        sum += x
    end
    return sum
end
println("sums: ",sums(1,2,3,4,5))

# 函数高级用法（函数作为参数或返回值）
function getfunc()
    function addthree(x,y,z)
        x + y + z
    end
end
add3 = getfunc()
println("the sum of three num: ", add3(1,2,3))

# 1匿名函数
function g(f::Function,x,y,z)
    f(x,y,z)
end
function h(f::Function)
        f()
end
println(g((x,y,z) -> x*y+z,1,2,3))
println(h(() -> 10 + 2))
rs1 = g(1,2,3) do x,y,z     # 匿名函数do...end结构
    x*y+z
end
println(rs1)
h() do           # 匿名函数do...end结构
    println(10+2)
end

# 多态分发
function move(x,y,ox=1,oy=2)
    x += ox
    y += oy
    (x,y)
end
function move(x,y,ox)
    x *= ox
    y *= ox
    (x,y)
end
println(move(1,2,10))