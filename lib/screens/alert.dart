import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertView extends StatelessWidget {
   
  const AlertView({Key? key}) : super(key: key);

  void displayDialogStd(BuildContext context){
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context) {
        return AlertDialog(
          elevation: 10,
          title: const Text('Alerta'),
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Esta es una alerta'),
              SizedBox(height: 10),
              FlutterLogo( size: 100)
            ],
          ),
          actions: [

            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar')
            ),              

          ],
        );
      });
  }

  void displayDialogMac(BuildContext context){
    showCupertinoDialog(
      context: context, 
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Alerta'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Esta es una alerta de Mac/iOs'),
              SizedBox(height: 10),
              FlutterLogo( size: 100)
            ],
          ),
          actions: [

            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar', style: TextStyle( color: Colors.red),)
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Ok')
            ),              

          ],
        );
      }
  );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alerta'),
      ),
      body: Center(
         child: ElevatedButton(
          onPressed: () => 
            Platform.isWindows||Platform.isAndroid ? 
            displayDialogStd(context) :
            displayDialogMac(context),
          child: const Text('Alerta'))
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.close ),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}