import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/presentation/providers/theme_provider.dart';


class ThemeChangerScreen extends ConsumerWidget {

  static const name = 'theme_changer_screen';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: Text('Theme changer'),
        actions: [
           IconButton(
  
            icon: Icon(isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
            onPressed: () {
              //ref.read(isDarModeProvider.notifier).update((state) => !state,);
              ref.read(themeNotifierProvider.notifier).toogleDarkMode();
            }, 
            
          ),
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

//Yodos los colores disponibles
class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {

    final List<Color> colors = ref.watch(colorListProvider);
    final int selectedColor = ref.watch(themeNotifierProvider).selectedColor;
    //final int colorSelected = ref.watch(selectedColorProvider);

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];

        return RadioListTile(
          title: Text('Este color', style: TextStyle(color: color),),
          subtitle: Text('${color.value}'),
          value: index, 
          activeColor: color,
          groupValue: selectedColor, 
          onChanged: (value) {
            // todo: notificar el cambio 
           // ref.read(selectedColorProvider.notifier).update((state) => index,);
            ref.read(themeNotifierProvider.notifier).changeColorIndex(index);
          },
        );
      },
      
    );
  }
}