import 'package:flutter/material.dart';

class ListView2 extends StatelessWidget {

  final options = const [
    'Megaman',
    'Metal Gear Solid',
    'Super Smash Bros',
    'Final Fantasy'
  ];
   
  const ListView2({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista SnackBar'),
        elevation: 5,
        backgroundColor: const Color.fromARGB(255, 10, 129, 158),
        shadowColor: const Color.fromARGB(82, 0, 140, 255),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => 
          ListTile(
            leading: const Icon(Icons.star, color: Color.fromARGB(255, 10, 129, 158)),
            title: Text(options[index]),
            subtitle: Text(options[index]),
            trailing: const Icon(Icons.arrow_forward_ios_rounded, color: Color.fromARGB(255, 10, 129, 158)),
            onTap: () {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(options[index]),
                backgroundColor: const Color.fromARGB(255, 10, 129, 158),
              ));
            },
          ),
        separatorBuilder: (_, __) =>
          const Divider(),
        itemCount: options.length)
    );
  }
}