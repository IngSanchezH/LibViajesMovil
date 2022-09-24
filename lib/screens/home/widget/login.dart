import 'dart:convert';
import 'dart:io';

import 'package:comida/constants/colors.dart';
import 'package:comida/screens/detail/detail.dart';
import 'package:comida/screens/home/widget/db.dart';
import 'package:comida/screens/home/widget/usuario.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class login extends StatefulWidget {
  @override
  State<login> createState() => _Login();
}

class _Login extends State<login> {
  final _formKey = GlobalKey<FormState>();
  String _usuario = "";
  String _clave = "";
  bool _ocultarPassword = true;
  Icon _iconoOjo = Icon(Icons.visibility_off);

  TextEditingController _txtController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackground,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 70, horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _txtController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  label: Text('Email:'), helperText: 'Tu dirección de correo'),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0),
              title: TextField(
                controller: _passController,
                keyboardType: TextInputType.text,
                obscureText: _ocultarPassword,
                decoration: InputDecoration(
                    label: Text('Contraseña:'),
                    helperText: 'Tu contraseña de usuario'),
              ),
              trailing: IconButton(
                icon: _iconoOjo,
                onPressed: () {
                  setState(() {
                    _ocultarPassword = !_ocultarPassword;
                    _iconoOjo = _ocultarPassword
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility);
                  });
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ConstrainedBox(
              constraints:
                  const BoxConstraints.tightFor(width: 300, height: 50),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(kPrimaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ))),
                onPressed: () async {
                  String r = await Usuario.valida(
                      _txtController.value.text, _passController.value.text);
                  var json = jsonDecode(r);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(json['respuesta'])));

                  if (json['respuesta'] == 'Bienvenido') {
                    Datos.registraToken(json['token']);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => DetailPage()));
                  }
                },
                child: const Text(
                  "Iniciar Sesión",
                  style: TextStyle(
                    color: TextPrimaryColor,
                  ),
                ),
              ),
            )
            /*
            const Text(
              'Iniciar Sesión',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: TextPrimaryColor,
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                label: Text('Ingrese su Correo:'),
                //helperText: 'Tu dirección de correo'
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 0),
              title: TextField(
                keyboardType: TextInputType.text,
                obscureText: _ocultarPassword,
                decoration: const InputDecoration(
                  label: Text('Ingrese su Contraseña:'),
                  //helperText: 'Tu contraseña de usuario'
                ),
              ),
              trailing: IconButton(
                icon: _iconoOjo,
                onPressed: () {
                  setState(() {
                    _ocultarPassword = !_ocultarPassword;
                    _iconoOjo = _ocultarPassword
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility);
                  });
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              widthFactor: 4,
              //child: botonLogin(),
            ),
            const SizedBox(height: 20),
            ConstrainedBox(
              constraints:
                  const BoxConstraints.tightFor(width: 300, height: 50),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(kPrimaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ))),
                onPressed: () async {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => DetailPage()));

                  //finaliza la verificaion del usuaio
                },
                child: const Text(
                  "Iniciar Sesión",
                  style: TextStyle(
                    color: TextPrimaryColor,
                  ),
                ),
              ),
            )
            */
          ],
        ),
      ),
    );
  }
}
