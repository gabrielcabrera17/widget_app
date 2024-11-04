//counter_screen
//+ Icons.add
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/presentation/providers/counter_provider.dart';


class CounterScreen extends ConsumerWidget {

  static const name='counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final int clickCounter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Screen'),
      ),
      body:Center(
        child: Text('Valor: $clickCounter', style:Theme.of(context).textTheme.titleLarge ,),   
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        
      },
      child: Icon(Icons.add),
      ),
    );
  }
}