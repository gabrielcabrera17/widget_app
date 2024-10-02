import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_app/presentation/screens/home/home_screen.dart';

class ButtonsScreen extends StatelessWidget {
  
  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buttons Screens"),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return  SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Elevated ')),
            const ElevatedButton(onPressed: null, child: Text('Elevated Disabled')),
            ElevatedButton.icon(
              onPressed: () {}, 
              icon: const Icon(Icons.access_alarm_rounded),
              label: const Text('Elevated Icon')),
            
            FilledButton(onPressed: () {}, child: const Text('Filled')),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.accessibility_new), 
              label: const Text('Filled icon')),
            
            OutlinedButton(onPressed: () {}, child: const Text('Outline')),
            OutlinedButton.icon(
              onPressed: () {},
              label: const Text('Outline Icon'),
              icon: const Icon(Icons.terminal)
              ),

            TextButton(onPressed: (){}, child: const Text('Text Boton')),
            TextButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.account_box_rounded),
              label: const Text('Text icon'),),


              //Todo custom button
              const CustomButton(),

              IconButton(onPressed: (){}, icon: const Icon(Icons.app_registration_outlined)),
               IconButton(
                onPressed: (){},
                icon: const Icon(Icons.app_registration_outlined),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(colors.primary),
                ),
                )
          ],
        ),
      ),
    );
  }
}

//boton personalizado

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

//clicRRect nos permitira rendondear los bordes de nuestro material
    return  ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Hola Mundo', style: TextStyle(color: Colors.white),)),
        ),
      ),
    );
  }
}