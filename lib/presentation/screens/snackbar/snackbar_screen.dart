import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_app/config/router/app_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  //metodo para mostrar snackbar
  void showCustomSnackBar(BuildContext context){
    ScaffoldMessenger.of(context).clearSnackBars();

    final snack =  SnackBar(
      //backgroundColor: Colors.red,
      content: const Text('Hola Mundo Soy Gabriel'),
      //para cerrar el Snackbar
      action: SnackBarAction(label: 'Cerrar', onPressed:() {},),
      //La dureacion del snackbar
      //duration: const Duration(seconds: 5),
      );

    ScaffoldMessenger.of(context).showSnackBar(
      snack
    );
  }

  //El buildcontext es la información en  la aplicación
  void openDialog( BuildContext context){
    showDialog(
      context: context, 
      barrierDismissible:false,
      //Builder significa algo que se cosntruira en tiempo de ejecución
      builder: (context) =>  AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text('Esta siguiente acción es irreversible'),
        actions: [
          TextButton(onPressed: ()=> context.pop(), child: const Text('Cancelar')),
          FilledButton(onPressed: ()=> context.pop(), child: const Text('Aceptar'))
        ],
            
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
   // final colors = Theme.of(context).colorScheme;
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Snackbars y Diálogos")
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Licencias utilizadas Todos los derechos reservados...')
                  ]
                );
              }, 
              child: const Text("Licencias usadas")
              ),
              FilledButton.tonal(
              onPressed: () => openDialog(context), 
              child: const Text("Mostrar Dialogos")
              ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        //hoverColor: Colors.red,
        onPressed: () => showCustomSnackBar(context), 
        label: const Text('Mostrar Snackbars'),
        icon:  const Icon(Icons.remove_red_eye_outlined),
      ),
      
    );
  }
}