<?php
abstract class EventGenertor{
    private $obj;
    //增加观察者
    function addobservic(obs $obj){
        $this->obj[]=$obj;
    }
    function notify(){
        foreach($this->obj as $obj){
            $obj ->update();
        }
    }
}
#观察者方法
interface obs{
    function update($event_info=null);
} 

#
class Event extends EventGenertor{
    function trgger( $obj){
        $this->addobservic($obj);
    }
    function trgger1(){
        $j=new chufa;
        $j->update();
        $j=new chufa2;
        $j->update();
        $j=new chufa3;
        $j->update();
        //............
    }
}
#事件触发者
class chufa implements obs{
    public function update($event_info=null) {
        var_dump($event_info);
        echo "事件发生者1";
    }
}
class chufa2 implements obs{
    public function update($event_info=null) {
        var_dump($event_info);
        echo "事件发生者2";
    }
}
class chufa3 implements obs{
    public function update($event_info=null) {
        var_dump($event_info);
        echo "事件发生者3";
    }
}

//传统做法 耦合侵入式 
//$obj=new Event;
//$obj ->trgger1();

//使用观察者
echo "<br>============<br>";

$obj1=new Event;
$obj1->trgger(new chufa);
//$obj1->trgger(new chufa2);
$obj1->trgger(new chufa3);
$obj1->notify();
