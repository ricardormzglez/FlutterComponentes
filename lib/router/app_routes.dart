import 'package:fl_componentes/models/models.dart';
import 'package:fl_componentes/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  
  static const initialRoute = 'home';

  static final menuOpt = <Menu>[
    // ignore: todo
    // TODO: Borrar home
    Menu(route: 'alerta', icon: Icons.warning, nombre: 'Alerta', screen: const AlertView()),
    // Menu(route: 'home', icon: Icons.home, nombre: 'Home', screen: HomeView()),
    Menu(route: 'listview1', icon: Icons.list, nombre: 'Lista Simple', screen: const ListView1()),
    Menu(route: 'listview2', icon: Icons.list_alt, nombre: 'Lista SnackBar', screen: const ListView2()),
    Menu(route: 'card', icon: Icons.calendar_view_month_outlined, nombre: 'Card', screen: const CardView()),
    Menu(route: 'avatar', icon: Icons.supervised_user_circle_outlined, nombre: 'Avatar', screen: const AvatarView()),
    Menu(route: 'animacion', icon: Icons.animation_outlined, nombre: 'Animación', screen: const AnimacionView()),
    Menu(route: 'input', icon: Icons.input, nombre: 'Inputs', screen: const InputsView()),
    Menu(route: 'slider', icon: Icons.slideshow_sharp, nombre: 'Slider', screen: const SliderView()),
    Menu(route: 'listviewbuilder', icon: Icons.build, nombre: 'Lista (InfiniteScroll & PullRefresh)', screen: const ListViewBuilder()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {

    Map<String, Widget Function(BuildContext)> appRoutes = {};

    appRoutes.addAll({'home': (BuildContext context) => 
        const HomeView()});

    menuOpt.sort((a, b) => a.nombre.compareTo(b.nombre));
    
    for (final option in menuOpt) {
      appRoutes.addAll({option.route: (BuildContext context) => 
        option.screen});
    }

    return appRoutes;

    // 'home': (BuildContext context) => const HomeView(),
    // 'listview1': (BuildContext context) => const ListView1(),
    // 'listview2': (BuildContext context) => const ListView2(),
    // 'alert': (BuildContext context) => const AlertView(),
    // 'card': (BuildContext context) => const CardView(),
  }

  static Route<dynamic> onGenerateRoute (RouteSettings settings){
        return MaterialPageRoute(builder: (context) => 
         const HomeView());
  }

}