#2020/07/27 数值系统

# 带符号数
x1=20;print(typeof(x1), " ")
# 无符号数
ux1=unsigned(x1);print(typeof(ux1), " ")
# 带符号数
sx1=signed(ux1);print(typeof(sx1)," ")
# 布尔类型
bool=true;print(typeof(bool)," ")
# 科学计数
f1=2.5e-4;print(typeof(f1)," ")
# 符点数
f2=Float32(2.5e-4);print(typeof(f2)," ")
# 符点数0
𝟘=zero(Float32);print(typeof(𝟘)," ")
# 整形数1
𝟙=one(1);print(typeof(𝟙)," ")
# eps函数
f3=eps(10.0);println("\n",f3)
