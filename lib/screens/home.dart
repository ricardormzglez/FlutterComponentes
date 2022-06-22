import 'package:fl_componentes/router/app_routes.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {

  const HomeView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final menuOpts = AppRoutes.menuOpt;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        elevation: 10,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationIcon: const FlutterLogo(),
                applicationName: 'Aplicación de componentes',
                applicationVersion: '3.0',
                applicationLegalese: '\u{a9} 2022 Ricardo Ramírez',
              );
          },
        ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 10),
        child: ListView.separated(
          itemBuilder: (context, index) => 
            ListTile(
              leading: Icon(menuOpts[index].icon, color: const Color.fromARGB(255, 10, 129, 158)),
              title: Text(menuOpts[index].nombre),
              subtitle: Text(menuOpts[index].route),
              trailing: const Icon(Icons.arrow_forward_ios_rounded, color: Color.fromARGB(255, 10, 129, 158)),
              onTap: () {
                // ScaffoldMessenger.of(context).removeCurrentSnackBar();
                // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //   content: Text(menuOpts[index].nombre),
                //   backgroundColor: const Color.fromARGB(255, 10, 129, 158),
                // ));
                Navigator.pushNamed(context, menuOpts[index].route);
              },
            ),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: menuOpts.length,
        ),
      ),
    );
  }
}