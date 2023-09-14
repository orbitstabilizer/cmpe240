

def mul(x, y, n = 32):
    ans = 0
    format = f" {{:0{n}b}}"
    print( format.format(x))
    print(format.format(y))
    print("x" + "-"*n)
    while y: 
        if y&1:
            ans += x
            print( format.format(x))
        else :
            print( format.format(0))
        y >>= 1
        x <<= 1

    print("+", "-"*n)
    print( format.format(ans))


    return ans

a = mul(71,98, 32)
print(a)
