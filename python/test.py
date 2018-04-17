#!/usr/bin/env python3
# -*- coding: utf-8 -*-

## python get input 
#i=input("真逗比还能这样干？"); #类似js中提示确认
#print(i,"dddddddd")

#===========python 跟php数据类型不同，不可以自动转换数据类型。。。



#
#a =99
#if a == 99:
#    print("混\n\
#    换行跟js一样欸\
#    蛋#")
#else:
#    print("sb")

    
    

#Python程序是大小写敏感的，如果写错了大小写，程序会报错
#运算符比较
#php      运算符        &&   ||     or      and     !
# python  运算符        &     |     or      and     not
#python  赋值跟php一样 ，都可以覆盖值
#python 非引用传值
#python 中没有常量，需要定义常量只能自己想法子
#b="adas"
#b=True
#b=2332
#print(b) 结果 为2332

###########这是什么意思
#b = r"dfdfd"
#b = b"dfdfd"
#print(b)
##########

#由于Python源代码也是一个文本文件，所以，当你的源代码中包含中文的时候，在保存源代码时，就需要务必指定保存为UTF-8编码。当Python解释器读取源代码时，为了让它按UTF-8编码读取，我们通常在文件开头写上这两行：
#!/usr/bin/env python3   第一行注释是为了告诉Linux/OS X系统，这是一个Python可执行程序，Windows系统会忽略这个注释；
# -*- coding: utf-8 -*-  第二行注释是为了告诉Python解释器，按照UTF-8编码读取源代码，否则，你在源代码中写的中文输出可能会有乱码


#常见的占位符有：
#%d	整数
#%f	浮点数
#%s	字符串
#%x	十六进制整数


#set可以看成数学意义上的无序和无重复元素的集合，因此，两个set可以做数学意义上的交集、并集等操作：
#>>> s1 = set([1, 2, 3])
#>>> s2 = set([2, 3, 4])
#>>> s1 & s2
#{2, 3}
#>>> s1 | s2
#{1, 2, 3, 4}

#python 定义函数



