#python 函数
#ord()函数将单个字符转换为整数

#print(ord('谭')) #输出 35885

#chr()函数把编码转换为对应的字符
#print(chr(35885)) #输出谭

# encode 转换编码函数
#"啊".encode("utf-8")

#len  获取字符串长度函数,类似PHP   mb_strlen
#len("大多数多sf12")

#int(var)  转换为int类型


#list array=["asdfas",23,32] 数据类型，跟redis一样
#append #将元素压如 list数据尾部
#insert 将元素压入list数据头部
# pop(key)  删除list数据指定数据  ,未指定时默认删除尾部

#dict 数据类型  array={"key1":"value","sdds":32} 
#array={"key1":"value","sdds":32}
#array.get("检查是否存在某个key","不存在时返回设置值 可以不设置")
#array.pop("要删除某key和value","不存在返回设置的值，存在返回被删除的值 可以不设置")

# / 除  * 乘   + 加  -减 % 求余  ** 次方

#python 自定义函数


def fun_name():
    print("1函数内容")
    print("2函数内容")
    print("3函数内容")
print("非函数内容")
fun_name()

#执行会输出
#非函数内容
#1函数内容
#2函数内容
#3函数内容

#python函数能返回多个值！！ PHP 和js不能返回多个值


def retduo(s="默认值"):  #默认参数
    return "真神奇","返回多个值测试"  #返回多个值


var1 ,var2 =retduo()
print(var1)
print(var2)
#但其实这只是一种假象，Python函数返回的仍然是单一值：
#原来返回值是一个tuple！但是，在语法上，返回一个tuple可以省略括号，而多个变量可以同时接收一个tuple
#，按位置赋给对应的值，所以，Python的函数返回多值其实就是返回一个tuple，但写起来更方便。
#定义函数时未定义返回值时，python会返回None。php则返回null

def fun(*var): #可变参数
    f=0
    for i in var:
       f+=i
    return f;
print(fun(2,2,4,1,3))  #2+2+4+1+3=12
#神奇，python可以定义可变参数，顾名思义一个变量代替0-n个

def person(name, age, **kw):    #关键字参数
    print('name:', name, 'age:', age, 'other:', kw)

#关键字参数！！
person('Bob', 35, city='Beijing')
person('Adam', 45, gender='M', job='Engineer')
#    关键字参数有什么用？它可以扩展函数的功能。比如，在person函数里，
#    我们保证能接收到name和age这两个参数，但是，如果调用者愿意提供更多的参数，
#    我们也能收到。试想你正在做一个用户注册的功能，除了用户名和年龄是必填项外，
#    其他都是可选项，利用关键字参数来定义这个函数就能满足注册的需求
    
    
    
#命名关键字参数
#在Python中定义函数，可以用必选参数、默认参数、可变参数、关键字参数和命名关键字参数，这5种参数都可以组合使用。
#但是请注意，参数定义的顺序必须是：必选参数、默认参数、可变参数、命名关键字参数和关键字参数。