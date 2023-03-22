<?php
class Cekarna{
	private $cekajici;
	private $priority;
	private $childQueue;
	private $ambulance;
	
	public function __construct($cekajici, $priority, $childQueue, $ambulance){
		$this->cekajici = $cekajici;
		$this->priority = $priority;
		$this->childQueue = $childQueue;
		$this->ambulance = $ambulance;
	}
	public function PrichodDoCekarny($pacient){
		$x = $pacient->returnIf();
		if($x == 0){
			array_push($this->priority, $pacient);
		}
		elseif($x == 1){
			array_push($this->childQueue, $pacient);
		}
		else{
			array_push($this->cekajici, $pacient);
		}
		return $pacient->showName();
	}
	public function PrichodDoAmbulance(){
		if($this->priority[0]){
			array_push($this->ambulance, array_shift($this->priority));
		}
		elseif($this->childQueue[0]){
			array_push($this->ambulance, array_shift($this->childQueue));
		}
		else{
			array_push($this->ambulance, array_shift($this->cekajici));
		}
	}
	public function pocetCekajicich(){
		return count($this->cekajici) + count($this->priority) + count($this->childQueue);
	}
}

class Pacient{
	private $jmeno;
	private $prijmeni;
	private $ockovani;
	private $vek;
	
	public function __construct($jmeno, $prijmeni, $ockovani, $vek){
		$this->jmeno = $jmeno;
		$this->prijmeni = $prijmeni;
		$this->ockovani = $ockovani;
		$this->vek = $vek;
	}
	public function returnIf(){
		if($this->ockovani==true){
			return 0;
		}
		if($this->vek <= 5){
			return 1;
		}
		else{
			return 2;
		}
	}
	public function showName(){
		echo $this->jmeno . " " . $this->prijmeni . " vstoupil do čekárny";
	}
}
$s = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis dictum leo non pellentesque dapibus. Donec in maximus ante. Sed ornare tristique dui eu lobortis. Nam consequat consectetur quam quis interdum. Integer vulputate pellentesque lacus quis rutrum. Sed et elit sagittis, condimentum sem a, condimentum nunc. Aenean ipsum nibh, auctor nec auctor ut, fermentum at neque. Aliquam sed lectus efficitur, ornare lacus imperdiet, condimentum purus. Integer vitae ligula eget nisl volutpat consectetur non ut dui.";
explode(" ", $s);
$cek = new Cekarna(array(), array(), array(), array());
for($i=0; $i<100;$i++){
	if($i%2==1){
		$b = false;
	}
	else{
		$b = true;
	}
	$a = new Pacient($s[rand(0,200)], $s[rand(0,200)], $b,rand(1,17));
	$cek->prichodDoCekarny($a);
	}
	
$cek->prichodDoAmbulance();
 ?>