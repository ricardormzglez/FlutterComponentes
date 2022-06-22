import 'package:flutter/material.dart';

class ListView1 extends StatelessWidget {

  final options = const [
    'Megaman',
    'Metal Gear Solid',
    'Super Smash Bros',
    'Final Fantasy'
  ];
   
  const ListView1({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista Simple'),
      ),
      body: ListView(
        children: [
          
          ...options.map(
              (game) => 
                ListTile(
                  leading: const Icon(Icons.data_usage_sharp),
                  title: Text(game),
                  subtitle: Text(game),
                  // trailing: const Icon(Icons.arrow_forward_ios_sharp),
                ),
              ).toList(),

        ],
      )
    );
  }
}