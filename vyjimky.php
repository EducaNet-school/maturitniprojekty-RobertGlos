<?php 
	class Kino{
		public function ProdejListku($divak, $film){
			try{
				if($divak->returnVek() <= $film->returnVek()){
					throw new MissingMoneyException();
				}
				if($divak->returnCash() < $film->returnCash()){
					throw new customerTooYoungException();
				}
				else{
					echo "<br>Prodan listek k: " . $film->returnNazev() . " Vek byl: " . $divak->returnVek() . "/". $film->returnVek();
				}
			}
			catch(customerTooYoungException $b){
				echo $b->err();
			}
			catch(MissingMoneyException $c){
				echo $c->err();
			}	
		}
	}
	class Divak{
		private $budget;
		private $vek;
		public function returnVek(){
			return $this->vek;
		}
		public function returnCash(){
			return $this->budget;
		}
		public function __construct($budget, $vek){
			$this->budget=$budget;
			$this->vek =$vek;
		}
	}
	class Film{
		private $nazev;
		private $cena;
		private $potrebnyVek;
		
		public function returnVek(){
			return $this->potrebnyVek;
		}
		public function returnCash(){
			return $this->cena;
		}
		public function returnNazev(){
			return $this->nazev;
		}
		public function __construct($nazev, $cena, $potrebnyVek){
			$this->nazev=$nazev;
			$this->cena=$cena;
			$this->potrebnyVek =$potrebnyVek;
		}
		
	}
	class customerTooYoungException extends Exception{
		public function err(){
			return "<br>Vek je moc nizky pro sledovani filmu";
		}
	}
	class MissingMoneyException extends Exception{
		public function err(){
			return "<br>Bez do prace";
		}
	}
for($i=0;$i<100;$i++){
	$a = new Divak(rand(0,400), rand(14,30));
	$b = new Film("film", rand(85,400), rand(15,18));
	$c = new Kino();
	$c->ProdejListku($a, $b);
}
	
?>