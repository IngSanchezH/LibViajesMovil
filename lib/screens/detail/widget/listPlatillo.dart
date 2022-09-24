import 'package:comida/constants/colors.dart';
import 'package:flutter/material.dart';

class ListaPlatillo extends StatefulWidget {
  @override
  State<ListaPlatillo> createState() => _ListaPlatillo();
}

class _ListaPlatillo extends State<ListaPlatillo> {
  bool _ocultarPassword = true;
  Icon _iconoOjo = Icon(Icons.visibility_off);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackground,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Lista de platillos',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: TextPrimaryColor,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Bienvenido a la aplicacion de Comida Express \n Este es una prueba de la aplicacion \n toda la inforacion del menu va en este lugar de la aplicacion :)',
              style: TextStyle(
                fontSize: 12,
                color: TextPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
