import 'package:fl_componentes/theme/app_tema.dart';
import 'package:flutter/material.dart';

class SliderView extends StatefulWidget {
   
  const SliderView({Key? key}) : super(key: key);

  @override
  State<SliderView> createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {

  double _sliderImage = 100;
  double _sliderValue = 100;
  double _sliderValue2 = 100;
  bool _sliderEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider, Switch y Check'),
      ),
      body: Column(
         children: [
          Slider.adaptive(
            activeColor: AppTema.primario,
            min: 1,
            max: 500,
            value: _sliderValue,
            onChanged: _sliderEnabled ? ( value ){
              _sliderValue = value;
              setState(() {
                _sliderImage = _sliderValue;
              });
            } : null,
          ),
          Slider.adaptive(
            activeColor: AppTema.primario,
            divisions: 10,
            min: 1,
            max: 500,
            value: _sliderValue2,
            onChanged: _sliderEnabled ? ( value ){
              _sliderValue2 = value;
              setState(() {
                _sliderImage = _sliderValue2;
              });
            } : null,
          ),

          // Checkbox(
          //   activeColor: AppTema.primario,
          //   value: _sliderEnabled, 
          //   onChanged: ( value ) {
          //     _sliderEnabled = value ?? true;
          //     setState(() {});
          //   }
          // ),

          CheckboxListTile(
            activeColor: AppTema.primario,
            title: const Text('Habilitar/Deshabilitar slider'),
            value: _sliderEnabled, 
            onChanged: ( value ) {
              _sliderEnabled = value ?? true;
              setState(() {});
            }
          ),

          // Switch(
          //   activeColor: AppTema.primario,
          //   value: _sliderEnabled, 
          //   onChanged: ( value ) {
          //     _sliderEnabled = value ?? true;
          //     setState(() {});
          //   }
          // ),

          SwitchListTile.adaptive(
            activeColor: AppTema.primario,
            title: const Text('Habilitar/Deshabilitar slider'),
            value: _sliderEnabled, 
            onChanged: ( value ) {
              _sliderEnabled = value;
              setState(() {});
            }
          ),

          // const AboutListTile(),

          const SizedBox( height: 50 ),
      
          Expanded(
            child: SingleChildScrollView(
              child: Image(
                image: const NetworkImage('https://static.wikia.nocookie.net/overwatch/images/4/4c/Widowmaker-portrait.png/revision/latest?cb=20210617212307&path-prefix=es'),
                fit: BoxFit.contain,
                width: _sliderImage,
              ),
            ),
          ),
          const SizedBox( height: 50 ),
      
         ],
      ),
    );
  }
}