import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_app/config/router/app_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo('Busca la comida', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ', 'assets/images/1.png'),
  SlideInfo('Entrega rápida', 'It is a long established fact that a ', 'assets/images/2.png'),
  SlideInfo('Disfruta la comida', 'It is a long established fact that a reader will be distracted by the readable content', 'assets/images/3.png'),
  
];


class AppTutorialScreen extends StatelessWidget {

  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            //para tener el mismo comportamiento en ios 
            physics:  const BouncingScrollPhysics(),
            children: slides.map(
              (slideData) => _Slide(
                title: slideData.title, 
                caption: slideData.caption, 
                imageUrl: slideData.imageUrl
              )
            //el slides.map es un iterable y lo que espera el children es una lista de widget
            // entonces lo convertimos con el .toList()
            ).toList()
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () => context.pop(),
              child: Text('Salir')
              )
          )

        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({ 
    required this.title, 
    required this.caption, 
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage( imageUrl),),
            const SizedBox(height: 20,),
            Text(title, style: titleStyle,),
            const SizedBox(height: 10,),
            Text(caption, style: captionStyle,)
          ],
        ),
      ),
    );
  }
}