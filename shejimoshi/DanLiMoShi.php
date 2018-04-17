<?php

/* 
 * 单例模式.
 */
class Single{
    public $hash;
    static protected $ins=null;
    final protected function __construct(){
        $this->hash=rand(1,9999);
    }
    static public function getInstance(){
        if (self::$ins instanceof self) {
            return self::$ins;
        }
//        self::$ins=new self();
        self::$ins=new Single();
        return self::$ins;
    }
}

#返回的值都会相同，因为单例模式就是指某个类只能new一次，好处是提升性能，减少不必要的new
print_r (Single::getInstance());
print_r (Single::getInstance());
print_r (Single::getInstance());
print_r (Single::getInstance());
print_r (Single::getInstance());