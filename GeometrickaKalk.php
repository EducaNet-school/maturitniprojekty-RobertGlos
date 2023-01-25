<?php
class geoCalc{
  public $a;
  public $b;
  public $c;
  public function __construct($a, $b = null, $c = null){
    $this->a = $a;
    $this->b = $b;
    $this->c = $c;
  }
  public function calc(){
    if ($this->c==null){
      //ctver
      if ($this->b == null){
        return $this->a*$this->a;
      }
        //obd
      else{
        return $this->a * $this->b;
      }
    }
      //Trojuhl
    elseif($this->a == $this->b){
      return (($this->c * ((($this->a ** 2)-(($this->c/2) ** 2))**0.5)) / 2);
      }
      
    else{
      $s = ($this->a + $this->b + $this->c)/2;
      return ($s*($s - $this->a)*($s - $this->b)*($s - $this->c))**(1/2);
    }
  }
  
}
$troj = new geoCalc(6,5,8);
echo $troj->calc();