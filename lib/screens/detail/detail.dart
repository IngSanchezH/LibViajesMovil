import 'package:comida/constants/colors.dart';
import 'package:comida/screens/detail/widget/banner.dart';
import 'package:comida/screens/detail/widget/bienvenida.dart';
import 'package:comida/screens/detail/widget/listPlatillo.dart';
import 'package:comida/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  //final Food food;
  //DetailPage(this.food);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              CustomAppBar(
                Icons.arrow_back,
                Icons.shopping_cart,
                leftCallback: () => Navigator.of(context).pop(),
              ),
              //espacion y contenido
              const SizedBox(height: 30),
              const Text(
                'Bienvenido a Comida Express',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: TextPrimaryColor,
                ),
              ),
              Pruebainfo(),
              ListaPlatillo()
            ]),
      ),
    );
  }
}
