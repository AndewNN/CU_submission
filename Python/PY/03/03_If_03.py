a = [float(i) for i in input().split()]
ma = -1e9
mi = 1e9

for i in a:
    if(ma < i):
        ma = i
    if(mi > i):
        mi = i

#######################################################################

print(round(sum(i for i in a if i != ma and i != mi)/(len(a)-2), 2))

#######################################################################

s = 0
for i in a:
    if i != ma and i != mi:
        s += i
s /= (len(a)-2)
print(round(s, 2))

#######################################################################

print(round(sum(sorted(a)[1:-1])/(len(a)-2), 2))

"""

9.84 9.30 9.42 9.58

9.15 9.20 9.30 9.50 

"""

# 9.58 5.5 2.1 3.0
# input().split() -> ['9.58', '5.5', '2.1', '3.0']