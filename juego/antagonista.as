package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class antagonista extends MovieClip {

		private var vel: int=10;
		private var dir: Number=1;
		private var limite_der: int=520;
		private var limite_izq: int=32;
		private var cambia:Timer=new Timer(200,0);
		private var tipo:Number;
		private var lanzar:Timer=new Timer(2000,0);
		private var contador:int=0;
		private var textField:TextField;
		
		
		public function antagonista() {
			// constructor code
			addEventListener(Event.ENTER_FRAME, actualiza);
			cambia.addEventListener(TimerEvent.TIMER,cambia_dir);
			cambia.start();		
			lanzar.addEventListener(TimerEvent.TIMER, lanza_bala);
			lanzar.start();
			
			textField = new TextField();
			textField.defaultTextFormat = new TextFormat("_sans", 20, 0xFF0000);
			textField.autoSize = "left";
			textField.text = "Velocidad: " + vel;
			textField.x = 10;
			textField.y = 10;
			addChild(textField);
			
		}
		
		public function cambia_dir(e:TimerEvent){
			tipo=Math.floor(Math.random() * 8);
			//trace (tipo);
			switch(tipo){
				case 1:
				dir=1;
				break;
				case 2:
				dir=-1;
				break;
			}
		}
		
		

		public function actualiza(e:Event){
			x+= vel * dir;
			if( x>=limite_der){
				dir=-1;
			}
			if(x<=limite_izq){
				dir=1
			}
		}
		public function lanza_bala(e:TimerEvent){
		//trace("lanza_bala");
		var bala_nueva=new bala(x,y);
		stage.addChild(bala_nueva);
		
		contador++;
			if (contador % 5 == 0) {
				vel += 10;
				textField.text = "Velocidad: " + vel;
		
	}
	
	}
	
	}
}
