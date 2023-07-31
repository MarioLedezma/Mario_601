package ClienteServidor;

import java.io.DataInputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Observable;

//cualquier objeto cuyo estado puede representar interés y sobre el cual 
//otro objeto ha demostrado ese interés

public class Servidor extends Observable implements Runnable {

    private int puerto;

    public Servidor(int puerto) {
        this.puerto = puerto;

    }

    @Override
    public void run() {
        ServerSocket servidor = null;
        Socket socket = null;
        DataInputStream entrada;

        try {
            //CREAMOS EL SERVIDOR DEL SOCKET
            servidor = new ServerSocket(puerto);
            System.out.println("Servidor iniciado");

            //SIEMPRE ESTARÁ ESCUCHANDO PETICIONES
            while (true) {
                 //ESPERO QUE EL CLIENTE SE CONECTE
                socket = servidor.accept();
                System.out.println("Cliente conectado");
                entrada = new DataInputStream(socket.getInputStream());

                String mensaje = entrada.readUTF();
                System.out.println(mensaje);

                this.setChanged();
                this.notifyObservers(mensaje);
                this.clearChanged();

                socket.close();
                System.out.println("Cliente desconectado");
            }
        } catch (IOException error) {
            System.out.println(error);
        }
    }

}

