import 'package:fl_componentes/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
   
  const CardView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarjetas (Cards)'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric( 
          horizontal: 10,
          vertical: 10),
        children: const [
          CardTipo1(),
          SizedBox(height: 10),
          CardTipo2(
            name: 'Lancelot',
            imageUrl: 'https://fs-prod-cdn.nintendo-europe.com/media/images/10_share_images/games_15/nintendo_switch_download_software_1/H2x1_NSwitchDS_Smite_image1600w.jpg'),
          SizedBox(height: 10),
          CardTipo2(
            name: 'Slipknot',
            imageUrl: 'https://allgamersin.com/wp-content/uploads/2022/05/Smite-x-Slipknot.jpg'),
          SizedBox(height: 10),
          CardTipo2(imageUrl: 'https://cdn1.epicgames.com/076207fa2b5c4803a636af606c3c28b7/offer/Smite_EGS_UltimateGodPack_2560x1440-2560x1440-0b69e8c2cab5aea6b8620dd0077fc6ba.jpg'),
          SizedBox(height: 50),
      ],)
    );
  }
}

