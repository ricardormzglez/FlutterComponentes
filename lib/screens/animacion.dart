import 'dart:math' show Random;
import 'package:flutter/material.dart';

class AnimacionView extends StatefulWidget {
   
  const AnimacionView({Key? key}) : super(key: key);

  @override
  State<AnimacionView> createState() => _AnimacionViewState();
}

class _AnimacionViewState extends State<AnimacionView> {

  final random = Random();
  double _width = 50;
  double _heigth = 50;
  Color _color = const Color.fromARGB(255, 255, 255, 255);
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(20);

  void cambiarFigura() {
    setState(() {
      _width = random.nextInt(255).toDouble() + 50;
      _heigth = random.nextInt(300).toDouble() + 50;
      _color = Color.fromARGB(
        255, 
        random.nextInt(255), 
        random.nextInt(255), 
        random.nextInt(255)
        );
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble()+1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animación'),
      ),
      body: Center(
         child: AnimatedContainer(
          duration: const Duration( milliseconds: 500 ),
          curve: Curves.easeOutCubic,
          width: _width,
          height: _heigth,
          // color: Colors.cyanAccent,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius
          ),
         )
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.play_circle_outline, size: 50, ),
        onPressed: () => cambiarFigura(),
      ),
    );
  }
}