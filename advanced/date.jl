# 2020/07/20  

# 日期与时间包
using Dates
# t=Date(2020,6,25)
t=Dates.today()
println(Dates.yearmonth(t))
# x=dump(t)
# println(x)
# println(t.instant)
println(Dates.value(t))
println(Dates.daysinmonth(t))
println(Dates.dayofyear(t))
println(t+Dates.Year(1)+Dates.Month(2)+Dates.Day(3))

time=Dates.now()
println(Dates.hour(time))
println(Dates.minute(time))
println(Dates.second(time))
println(time+Dates.Hour(2)+Dates.Minute(3))
