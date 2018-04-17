#!/usr/bin/env python2
#encoding: UTF-8

print("=========== python 类的定义和属性 ===========")
class Test(object):
    def __init__(self,name ,age,private):  #类似PHP class  __construct
        self._name=name  
#有些时候，你会看到以一个下划线开头的实例变量名，比如_name，
#        这样的实例变量外部是可以访问的，但是，按照约定俗成的规定，
#当你看到这样的变量时，意思就是，“虽然我可以被访问，但是，请把我视为私有变量，
#不要随意访问”
        self.age=age
        self.__private=private 
#        实例的变量名如果以__开头，
#就变成了一个私有变量（private），只有内部可以访问，外部不能访问
    def getdata(self):  #类似PHP class定义类方法
        print("名称：%s , 年龄：%s 私有属性外部不能访问！是否是处？ %s" % (self._name,self.age,self.__private ))
    def get_private(self):
        print(self.__private)
        
obj=Test("小王",21,"不是")
obj.getdata()
obj._name="张飞"
obj.getdata()
obj.__private="是" #表面上将私有属性值改变了
#，其实这在python中解释为在class外部又定义了一个变量。对class的__private属性值无任何改变
obj.get_private();#值依然不是处。。嘿嘿
print("========== python 类的继承 ============")

class fulei(object):
    def __init__(self):
        self.name="fulei"
    def f(self):
        print("帅帅的python,之类继承")
class zilei(fulei):
    pass;
new=zilei();
new.f()
print(new.name)
print("========== python 类方法覆盖  ============")

class zilei2(fulei):
    def f(self):
        print("覆盖内容诶")

x=zilei2();
x.f()

print("========== type  ============")
print("获取数据类型 %s"  % (type(x)))
print("========== python多重继承，PHP不可以  ============")
class y(object):
    def x(self):
        print("继承自y.x")
class yy(object):
    def xx(self):
        print("继承自yy.xx")
        
class ee(y,yy):
    pass
n=ee()
n.x()
n.xx()

print("========== python class  定制 __str__ ,类似php类的魔术方法 ============")
class nostr(object):
    pass
class yesstr(object):
     def __init__(self):
         pass
     def __str__(self):
         return '哦嚯嚯'
     def x(self):
         print("232sddsds")
#对比 __str作用
print(nostr())
kx=yesstr()
kx.x()
print(kx)
print("==================")



 



