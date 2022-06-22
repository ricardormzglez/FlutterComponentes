import 'package:flutter/material.dart';

class CardTipo1 extends StatelessWidget {
  const CardTipo1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.pets_outlined),
            title: Text('Título'),
            subtitle: Text('Texto para la descripción'),
          ),
          Padding(
            padding: const EdgeInsets.only( right: 8.0, bottom: 5 ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () {
                },
                child: const Text('Cancel')
                ),
                TextButton(onPressed: () {
                },
                child: const Text('Ok')),
              ],
            ),
          )
        ],
      ),
    );
  }
}