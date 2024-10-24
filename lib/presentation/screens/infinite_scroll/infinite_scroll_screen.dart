import 'package:animate_do/animate_do.dart';
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
  //revisando si esta montado
  bool isMounted = true;
  

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
    isMounted = false;
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
    
    if(!isMounted) return;
    //TODO revisar si está montado el componente /widget
    setState(() {});

  } 

  Future<void> onRefresh() async {
     isLoading= true;
     setState(() {
       
     });
    await Future.delayed(const Duration(seconds: 3));
    if( !isMounted) return;

    isLoading = false;
    final lasId = imageIds.last;
    imageIds.clear();
    imageIds.add(lasId + 1);
    addFiveImages();

    setState(() {});


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
        child: RefreshIndicator(
          onRefresh: onRefresh,
          edgeOffset: 10,
          strokeWidth: 2,
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: isLoading
         ?
          SpinPerfect(
                infinite: true,
                child: const Icon(Icons.refresh_rounded)
          )
        :
          FadeIn(child: Icon(Icons.arrow_back_ios_new_outlined))
      ),
    );
  }
}