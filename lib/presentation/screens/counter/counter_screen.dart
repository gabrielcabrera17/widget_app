//counter_screen
//+ Icons.add
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/presentation/providers/counter_provider.dart';
import 'package:widget_app/presentation/providers/theme_provider.dart';


class CounterScreen extends ConsumerWidget {

  static const name='counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Screen'),
        actions: [
          
          IconButton(
  
            icon: Icon(isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
            onPressed: () {
              //modificando el valor a tru
              ref.read(isDarModeProvider.notifier).update((state) => !isDarkMode,);
            }, 
            
          ),
          
        ],
      ),
      body:Center(
        child: Text('Valor: $clickCounter', style:Theme.of(context).textTheme.titleLarge ,),   
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
          //cuando se necesite el valor actual del estado
          //ref.read(counterProvider.notifier).update((state) => state + 1);
      },
      child: Icon(Icons.add),
      ),
    );
  }
}