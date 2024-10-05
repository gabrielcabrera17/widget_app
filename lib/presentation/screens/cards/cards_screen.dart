import 'package:flutter/material.dart';

const card = <Map<String, dynamic>>[
  {'elevation':0.0, 'label':'Elevation 0'},
  {'elevation':1.0, 'label':'Elevation 1'},
  {'elevation':2.0, 'label':'Elevation 2'},
  {'elevation':3.0, 'label':'Elevation 3'},
  {'elevation':4.0, 'label':'Elevation 4'},
  {'elevation':5.0, 'label':'Elevation 5'},
];



class CardsScreen extends StatelessWidget {

  static const String name = 'cards_screen';

  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards Screens"),
      ),
      body: _CardView(),
    );
  }
}

class _CardView extends StatelessWidget {
  const _CardView();

  @override
  Widget build(BuildContext context) {

    //SingleChildScrollView nos sirve para que no se desborde nuestros cards

    return SingleChildScrollView(
      child: Column(
        children: [
          //barriendo cada una de las tarjetas que tengo
          ...card.map((card)=> _CardType3(
            label: card['label'], 
            elevation: card['elevation'])
          ),
             ...card.map((card)=> _CardType2(
            label: card['label'], 
            elevation: card['elevation'])
          ),
             ...card.map((card)=> _CardType3(
            label: card['label'], 
            elevation: card['elevation'])
          ),

             ...card.map((card)=> _CardType4(
            label: card['label'], 
            elevation: card['elevation'])
          ),

          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

//regresare este widget

class _CardType1 extends StatelessWidget {

  final String label;
  final double elevation;

  const _CardType1({ 
    required this.label, 
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert_outlined))
              ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Text(label),
            )
          ],
        ),
      ),
    );
  }
}

//Cardtype 2

class _CardType2 extends StatelessWidget {

  final String label;
  final double elevation;

  const _CardType2({ 
    required this.label, 
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(const Radius.circular(12)),
        side: BorderSide(
          color: colors.outline,
        )
      ),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert_outlined))
              ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - outline'),
            )
          ],
        ),
      ),
    );
  }
}


//Cardtype3

class _CardType3 extends StatelessWidget {

  final String label;
  final double elevation;

  const _CardType3({ 
    required this.label, 
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      color: colors.surface,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert_outlined))
              ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - Filled'),
            )
          ],
        ),
      ),
    );
  }
}


//Cartype4
class _CardType4 extends StatelessWidget {

  final String label;
  final double elevation;

  const _CardType4({ 
    required this.label, 
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
        child: Stack(
          children: [

            Image.network(
              'https://picsum.photos/id/${elevation.toInt()}/600/250',
              height: 350,
              fit: BoxFit.cover,
            ),

            Align(
              alignment: Alignment.topRight,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert_outlined)),
              )
              ),

           
          ],
        ),
      
    );
  }
}
