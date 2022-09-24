import 'package:comida/constants/colors.dart';
import 'package:comida/screens/home/widget/login.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  bool _ocultarPassword = true;
  Icon _iconoOjo = Icon(Icons.visibility_off);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //CustomAppBar(
          //  Icons.arrow_back,
          //  Icons.shopping_cart,
          //),
          login(),
        ],
      ),
    );
  }
}
