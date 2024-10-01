import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_app/config/menu/menu_items.dart';
import 'package:widget_app/config/router/app_router.dart';
import 'package:widget_app/presentation/screens/buttons/buttons_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + material 3 '),
      ),
      body: _HomeView(),
  
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {

   

    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder:(context, index){

       final menuItem = appMenuItems[index];

        return _CustomListTile(menuItem: menuItem);
        
      }
      );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItems menuItem;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme ;


    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      //shape:  Border.all(color: colors.tertiary),
      onTap:() {
       //TODO: navegar a otras pantallas
       
       /* Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ButtonsScreen(),
          ),
        );*/

       // Navigator.pushNamed(context, menuItem.link);
       context.push(menuItem.link);


      } ,
    );
  }
}