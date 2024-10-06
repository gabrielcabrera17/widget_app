import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
   // final colors = Theme.of(context).colorScheme;
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Snackbars y Diálogos")
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