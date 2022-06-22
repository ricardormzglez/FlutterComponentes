import 'package:flutter/material.dart';

class Menu {

  final String route;
  final IconData icon;
  final String nombre;
  final Widget screen;

  Menu({
    required this.route, 
    required this.icon, 
    required this.nombre, 
    required this.screen});

}