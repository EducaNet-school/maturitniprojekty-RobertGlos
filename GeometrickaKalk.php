<html>
  <head>
    <title>PHP Test</title>
  </head>
  <body>
    <form action="index.php" method="post">
      <input type="number" name = "a" placeholder="Napište stranu a">
      <br>
      <input type="hidden" id="1" name = "b" placeholder="Napiste stranu b">
      <br>
      <input type="hidden" id="3" name = "c" placeholder="Napiste stranu c">
      <br>
      <input type="submit" value="Vypocitat">
    </form>
    <br>
    <button id="2" onclick="showHidden(1)">+ Strana</button>
    <button id="4" onclick="showHidden(3)">+ strana</button>
    <script>
      document.getElementById(4).style.visibility = 'hidden'
      function showHidden(a){
        document.getElementById(a).type="number"
        document.getElementById(a+1).remove()
        document.getElementById(a+3).style.visibility = 'visible';
      }
    </script>
    <script src="https://replit.com/public/js/replit-badge.js" theme="blue" defer></script> 
  </body>
</html>
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
        return "Obsah Ctverce je: ". $this->a*$this->a;
      }
        //obd
      else{
        return "Obsah Obdelniku je: " . $this->a * $this->b;
      }
    }
      //Trojuhl
    elseif($this->a == $this->b){
      return "Obsah Trojuhelniku je: ". (($this->c * ((($this->a ** 2)-(($this->c/2) ** 2))**0.5)) / 2);
      }
      
    else{
      $s = ($this->a + $this->b + $this->c)/2;
      return "Obsah Trojuhelniku je: ". ($s*($s - $this->a)*($s - $this->b)*($s - $this->c))**(1/2);
    }
  }
  
}
if(isset($_POST["a"])){
  $geoObr = new geoCalc($_POST["a"], $_POST["b"], $_POST["c"]);
  echo $geoObr->calc();
}
