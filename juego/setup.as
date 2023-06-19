package  {
	
	//DEFINICIÓN DE CLASE
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	//FIRMA 
	public class setup extends MovieClip {
		//VARIABLES DE CLASE
		private var fondo_new:fondo = new fondo();
		private var piso_new: piso = new piso();
		static var protagonista_new: protagonista = new protagonista();
		private var antagonista_new: antagonista = new antagonista();
		
		
		static var puntos:Number=0;
		static var puntosbox_new:puntosbox = new puntosbox();
		
		//METODO CONTRUCTOR
		public function setup() {
			// constructor code
			
			addChild(fondo_new);
			addChild(piso_new);
			addChild(protagonista_new);
			addChild(antagonista_new);
			
			addChild(puntosbox_new);
			
			puntosbox_new.x=100;
			puntosbox_new.y=40;
			puntosbox_new.puntostxt.text= String(puntos);
			
			fondo_new.y=200;
			fondo_new.x=275;
			
			piso_new.y=385;
			piso_new.x=275;
			
			protagonista_new.y=375;
			protagonista_new.x=275;
			
			antagonista_new.y=50;
			antagonista_new.x=275;
			
			this.addEventListener(Event.ENTER_FRAME, actualiza_puntos);
			
		}
		
		public function actualiza_puntos(e:Event){
			puntosbox_new.puntostxt.text=String(puntos);
		}
	}
	
}
