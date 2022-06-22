import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    Key? key,
    required this.formValues, 
    required this.formProperty,
  }) : super(key: key);

  final String formProperty;
  final Map<String, dynamic> formValues;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      items: const [
        DropdownMenuItem(
          value: 'Admin',
          alignment: Alignment.center,
          child: Text('Admin'),
        ),
        DropdownMenuItem(
          value: 'User',
          alignment: Alignment.center,
          child: Text('User')
        ),
        DropdownMenuItem(
          value: 'Root',
          alignment: Alignment.center,
          child: Text('Root')
        ),
      ],
      onChanged: (value) => 
        formValues[formProperty] = value,
        validator: (value) {
        if ( value == null ) return 'Campo requerido';
        return null;
          // return value.length < 3 ? 'Mínimo 3 caracteres' : null;
      },
    );
  }
}