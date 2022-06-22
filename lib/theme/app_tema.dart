

import 'package:flutter/material.dart';

class AppTema {

  static const Color primario = Color.fromARGB(255, 10, 129, 158);

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
        primaryColor: primario,
        appBarTheme: const AppBarTheme(
          color: primario,
          elevation: 10
          ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom( primary: primario )
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primario
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: primario,
            shape: const StadiumBorder(),
            elevation: 1
          )
        ),
        inputDecorationTheme: const InputDecorationTheme(
          floatingLabelStyle: TextStyle( color: primario ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide( color: primario),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10)
            )
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10)
            )
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10)
            )
          )
        )
      );

}