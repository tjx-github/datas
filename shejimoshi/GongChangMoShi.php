<?php
//工厂模式+单例模式+注册树模式


//创建单例
class Single {
    public $hash;
    static protected $ins=null;
    final protected function __construct(){
        $this->hash=rand(1,9999);
    }
    static public function getInstance(){ #单例模式
        if (self::$ins instanceof self) {
            return self::$ins;
        }
        self::$ins=new self();
        return self::$ins;
    } 
}
class Single2 {
    public $hash;
    static protected $ins=null;
    final protected function __construct(){
        $this->hash=time();
    }
    static public function getInstance(){ #单例模式
        if (self::$ins instanceof self) {
            return self::$ins;
        }
        self::$ins=new self();
        return self::$ins;
    } 
}


//工厂模式
class RandFactory{
    public static function factory( $ClassName  ){
        return $ClassName::getInstance();
    }
}

//注册树
class Register{
    protected static $objects;
    public static function set($alias,   $object){
           self::$objects[$alias]=$object;
    }
    public static function get($alias){
        return self::$objects[$alias];
    }
    public static function _unset($alias){
        unset(self::$objects[$alias]);
    }
    public static function getobject(){
        return self::$objects;
    }
}


Register::set('Single2',RandFactory::factory("Single2"));
print_r(Register::get('Single2'));
Register::set('Single',RandFactory::factory("Single"));
print_r(Register::get('Single'));
print_r(Register::get('Single2'));
print_r(Register::get('Single2'));
print_r(Register::get('Single'));
echo "\n==============\n";
print_r(Register::getobject());

