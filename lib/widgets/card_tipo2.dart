import 'package:fl_componentes/theme/app_tema.dart';
import 'package:flutter/material.dart';

class CardTipo2 extends StatelessWidget {

  final String imageUrl;
  final String? name;

  const CardTipo2({Key? key, 
    required this.imageUrl, 
    this.name}
    ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      elevation: 10,
      shadowColor: AppTema.primario,
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage(imageUrl),
            placeholder: const AssetImage('assets/loadings/jar-loading.gif'),
            width: double.infinity,
            height: 260,
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 500),
          ),
          if (name != null)
          Container(
            alignment: AlignmentDirectional.centerEnd,
            padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
            child: Text(name ?? 'Smite'))
        ],
      ),
    );
  }
}