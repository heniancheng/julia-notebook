# 2020/07/20 

# 多维数组

# 创建数组
arr1=[1 2 3;4 5 6;7 8 9]
println(arr1)
arr2=  rand(1:100,3,3)      #zeros、ones、falses、true、randn
println(arr2)
println("arr2: ",ndims(arr2)," dims; size ",size(arr2),)
arr3=0:2:20;println(arr3)
arr4=range(2;step=2,length=10);println(arr4)


# 访问数组
println("arr1[1][2]: ",arr1[1,2])
println("arr1[1][2]: ",arr1[CartesianIndex(1,2)])
li=LinearIndices(arr1);println("arr1[1][2]: ",arr1[li[1,2]])
for i in eachindex(arr1)
    print(arr1[i]," ")
end
println()

# 子数组与视图
println(arr1[1:2,1:2])
println(view(arr1,1:2,1:2))  # @view arr1[1:2,1:2]

# 稀疏数组
import Pkg;Pkg.add("SparseArrays");Pkg.add("LinearAlgebra")
using SparseArrays
using LinearAlgebra
println(sparse(I,3,5))   #单位矩阵
println(sparse(UniformScaling(10),3,5))  #对角为10单位矩阵
println(sprand(Float32,3,5,0.3))  #随机生成稀疏矩阵

# 矢量化计算
println(map(round,[1.2,3.5,1.7]))

# 复合类型
abstract type Point{T} end
mutable struct Point2D{T} <: Point{T}
    x::T
    y::T
end
mutable struct Point3D{T} <: Point{T}
    x::T
    y::T
    z::T
end
function pointSum(p::Point)
    m = 0
    for field in fieldnames(typeof(p))
        m += getfield(p,field)
    end
    m
end
p1=Point2D{Int32}(1,2)
println(pointSum(p1))
p2=Point3D{Float32}(1,2,3)
println(pointSum(p2))

# 元组
tu=(1,2,3)
println(tu)
tu2=(name="hc",age=12)
println(tu2)

# 集合
s1=Set([1,2,3,4])
println(s1)

# 字典
d1=Dict("x1"=>1.2, "x2"=>2.2)
println(d1["x1"]," ",d1["x2"])