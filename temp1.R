a=10
b=20
c=30
#--------------------#

x=c(3,4,5)
x
class(x)
x+3
x*2

p = c(50000,10000,20000)
n = c(3,4)
r = c(6,7) 
si = p*n*r/100
si

x = c(1,2.2,'abc')
x
x+2

x=list(a=1,b=1.2,c='abc',d= T)
x

names(x)

x['a']

x$b



x=list(a=1,b=c(1,2,3,4),c='abc',d= T)
x
x$b
x[2]

###########################################
m = matrix(c(1,2,3,4,5,6,7,8,9,10,11,12), 3,4)
m
m[2,2]
m[2,3]
m[2,]
m[,3]

m = matrix(c(1,2,3,4,5,6), 3,2, byrow = T)
m

v1 = c(1,2,3)
v2 = c(4,5,6)
rbind(v1,v2)
cbind(v1,v2)

v1 = c(1,2,3,7,8,9)
v2 = c(4,5,6)
rbind(v1,v2)


d <- array(dim = c(5))
d[1] = 1
d[2] = 2
d

d <- array(dim = c(3,3))
d[1][1] =1
d

d <- array(dim = c(3,3,3))
d[1][1][1] = 1
d

v1 = c(1,2,3)
v2 = c(4,5,6)
df = data.frame(v1,v2)
df

v1 = c(1,2,3)
v2 = c(4,5,6)
v3 = c(7,8,9)
df = data.frame(v1,v2, v3)
df
