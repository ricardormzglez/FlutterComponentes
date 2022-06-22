import 'package:fl_componentes/theme/app_tema.dart';
import 'package:flutter/material.dart';

class ListViewBuilder extends StatefulWidget {
   
  const ListViewBuilder({Key? key}) : super(key: key);

  @override
  State<ListViewBuilder> createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {

  final List<int> imagesIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final ScrollController scrollController = ScrollController();
  bool cargando = false;

  // Estado inicial
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() { 
      // print('${scrollController.position.pixels}, ${scrollController.position.maxScrollExtent}');
      if (scrollController.position.pixels + 200 >= scrollController.position.maxScrollExtent){
        // add5();
        datos();
      }
    });
  }

// Cargar datos
  Future datos() async {
    if ( cargando ) return;
    cargando = true;
    setState(() {
    });
    await Future.delayed( const Duration( seconds: 3));
    add5();
    cargando = false;
    setState(() {
    });

    if (scrollController.position.pixels + 80 <= scrollController.position.maxScrollExtent) return;
    scrollController.animateTo(
      scrollController.position.pixels + 100, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.fastOutSlowIn
    );
  }

// Agregar 5 elementos
  void add5() {
    final lastId = imagesIds.last;
    imagesIds.addAll( 
      [1, 2, 3, 4, 5].map((e) => lastId + e)
    );
    setState(() {
    });
  }

// PullRefresh
  Future<void> onRefresh() async {
    await Future.delayed( const Duration( seconds: 2));
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId+1);
    add5();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('List Builder | InfiniteScroll & PullRefresh'),
      ),
      body: Stack(
        children: [
          RefreshIndicator(
            color: AppTema.primario,
            onRefresh: onRefresh,
            child: ListView.builder(
              controller: scrollController,
              itemCount: imagesIds.length,
              itemBuilder: (BuildContext context, int index) {
                return FadeInImage(
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                  placeholder: const AssetImage('assets/loadings/jar-loading.gif'), 
                  image: NetworkImage('https://picsum.photos/id/${imagesIds[index]}/500/300')
                );
              }
            ),
          ),
          if ( cargando )
            Positioned(
              bottom: size.height * 0.5 - 30,
              left: size.width * 0.5 - 30,
              child: const _PantallaCarga()
            )

        ],
      )
    );
  }
}

class _PantallaCarga extends StatelessWidget {
  const _PantallaCarga({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        shape: BoxShape.circle
      ),
      child: const CircularProgressIndicator(
        color: AppTema.primario
      ),
    );
  }
}