package ClienteServidor;

import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;



public class Cliente implements Runnable{

     //CREAR LOS ATRIBUTOS DE PUERTO Y MENSAJE
    private int puerto;
    private String mensaje;

    public Cliente(int puerto, String mensaje) {
        this.puerto = puerto;
        this.mensaje = mensaje;
    }
       //Es la interface de Java que dispone de un método run 
       //y nos permite ejecutar una Tarea en paralelo desde un programa main usando la clase Thread.     
            
    @Override
    public void run() {
     //HOST DEL SERVIDOR
     final String HOST ="127.0.0.1";
     
     //PUERTO DEL SERVIDOR
     DataOutputStream salida;
     
     try{
         Socket socket = new Socket (HOST, puerto);
         salida = new DataOutputStream(socket.getOutputStream());
         
         //ENVIAMOS EL MENSAJE
         salida.writeUTF(mensaje);
         
     }catch(IOException error){
         System.out.println(error);
     }
     
    }
    
    
    
}
