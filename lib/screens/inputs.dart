import 'dart:io';

import 'package:fl_componentes/widgets/dropdown.dart';
import 'package:fl_componentes/widgets/widgets.dart';
import 'package:flutter/material.dart';

class InputsView extends StatelessWidget {
   
  const InputsView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'nombre': 'Ricardo',
      'apellido': 'Ramírez',
      'email': 'ricardo@correo.com',
      'pass': '123456',
      'role': 'Admin'
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs y Forms')
      ),
      body: SingleChildScrollView(
         child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20, vertical: 20
          ),
          child: Form(
            key: myFormKey,
            child: Column(
              children: [
                CustomInputField(
                  labelText: 'Nombre',
                  hintText: 'Nombre usuario',
                  keyboardType: TextInputType.name, 
                  formProperty: 'nombre', 
                  formValues: formValues,
                ),
                const SizedBox( height: 30),
                CustomInputField(
                  labelText: 'Apellido',
                  hintText: 'Apellido usuario',
                  keyboardType: TextInputType.name,
                  formProperty: 'apellido', 
                  formValues: formValues,
                ),
                const SizedBox( height: 30),
                CustomInputField(
                  labelText: 'Correo',
                  hintText: 'Correo usuario',
                  keyboardType: TextInputType.emailAddress,
                  formProperty: 'email', 
                  formValues: formValues,
                ),
                const SizedBox( height: 30),
                CustomInputField(
                  labelText: 'Contraseña',
                  hintText: 'Contraseña usuario',
                  keyboardType: TextInputType.visiblePassword,
                  formProperty: 'pass', 
                  formValues: formValues,
                  obscureText: true,
                ),
                const SizedBox( height: 30),

                CustomDropDown(
                  formProperty: 'role', 
                  formValues: formValues,
                ),

                const SizedBox( height: 30),

                ElevatedButton(
                  onPressed: () {

                    if (Platform.isIOS || Platform.isAndroid){
                      FocusScope.of(context).requestFocus( FocusNode());
                    }

                    if( !myFormKey.currentState!.validate() ){
                      // print('Formulario no válido');
                      return;
                    }
                    // * Imprimir formulario
                    // print(formValues);
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Datos ingresados'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cerrar'))
                          ],
                          // ignore: prefer_interpolation_to_compose_strings
                          content: Text('Nombre: ' + formValues['nombre'].toString() + '\n\n' +
                              'Apellido: ' + formValues['apellido'].toString() + '\n\n' +
                              'Email: ' + formValues['email'].toString() + '\n\n' +
                              'Contraseña: ' + formValues['pass'].toString() + '\n\n' +
                              'Rol: ' + formValues['role'].toString()),
                        ),
                      );          
                  }, 
                  child: const SizedBox (
                    width: double.infinity,
                    child: Center(
                      child: Text('Guardar')),
                  )
                ),
                const SizedBox( height: 30),
              ],
            ),
          ),
          ),
      ),
    );
  }
}



