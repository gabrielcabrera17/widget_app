import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {

  static const name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ) ,
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children:  [
          SizedBox(height: 30),
          Text('Circular progess indicator'),
          SizedBox(height: 30),
          CircularProgressIndicator(strokeWidth: 2, backgroundColor: Colors.black45,),

          SizedBox(height: 20),
          Text('Circula  y linear indicator controlado'),
          SizedBox(height: 10,),
          _ControlledProgresIndicator()

        ],
      ),
    );
  }
}

class _ControlledProgresIndicator extends StatelessWidget {
  const _ControlledProgresIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value){
        return (value * 2)/100;
      }).takeWhile((value) => value < 100),
      builder: (context, snapshot){
      
        final progressValue = snapshot.data ?? 0;
        //print(progressValue);
        return  Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(value: progressValue,strokeWidth: 2, backgroundColor: Colors.black12,),
            SizedBox(width: 20,),
            Expanded(
              child: LinearProgressIndicator(value: progressValue)
            )
          ],
        )
      );
      
      }
    );
  }
}