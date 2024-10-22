import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {

  static const name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  //
  bool isLoading = false;
  

  List<int> imageIds = [1,2,3,4,5];
  final ScrollController scrollController = ScrollController();
   @override
  void initState() {
    
    super.initState();
    scrollController.addListener(() {

      if(scrollController.position.pixels + 500 >=  scrollController.position.maxScrollExtent){
        //load next page
        loadNextPage();
      }

    },);



  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future loadNextPage()async {
    //si ya esta en true
    if( isLoading ) return;

    //cuando empiezo a cargar isLoading es true
    isLoading = true;

    setState(() {
      
    });

    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    isLoading = false;
    
    //TODO revisar si está montado el componente /widget
    setState(() {
      
    });

  } 

  void addFiveImages (){
    final lastId = imageIds.last;
    imageIds.addAll(
       // esto es igual a imagesIds.add(lastId + 1);...
      [1,2,3,4,5].map((e) => lastId + e)
     
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: ListView.builder(
          controller: scrollController,
          itemCount: imageIds.length,
          itemBuilder: (context, index) {
            return FadeInImage(
              fit: BoxFit.cover,
              width: double.infinity,
              height: 300,
              placeholder: const AssetImage('assets/images/jar-loading.gif'), 
              image: NetworkImage('https://picsum.photos/id/${imageIds[index]}/500/300')
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: Icon(Icons.arrow_back_ios_new_outlined),
      ),
    );
  }
}