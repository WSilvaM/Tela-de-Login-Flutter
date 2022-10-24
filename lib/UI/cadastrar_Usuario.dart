import 'package:base_inicial/styles/colors_styles.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class CadastraUsuario extends StatefulWidget {
  const CadastraUsuario({Key? key}) : super(key: key);

  @override
  State<CadastraUsuario> createState() => _CadastraUsuarioState();
}

class _CadastraUsuarioState extends State<CadastraUsuario> {
  final GlobalKey<FormState> _chavkey = GlobalKey<FormState>();
  bool _showsenh = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          color: context.colors.black,
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        backgroundColor: context.colors.white,
        elevation: 0, //sombra
      ),

      //SingleChildScrollView
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _chavkey,
          //for keys
          child: ListView(
            children: [
              Center(
                child: Text(
                  'Criar minha conta',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.person_outlined,
                      size: 30,
                    ),
                    label: Text(
                      'Nome Completo',
                    ),
                    labelStyle: TextStyle(fontSize: 20)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Digite seu nome completo';
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.email_outlined,
                    ),
                    label: Text(
                      'E-mail',
                    ),
                    hintText: 'seu-melhor@email.com',
                    labelStyle: TextStyle()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Digite seu e-mail';
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock_outline,
                  ),
                  suffixIcon: GestureDetector(
                    child: Icon(
                      _showsenh == false
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    onTap: (() {
                      setState(() {
                        _showsenh = !_showsenh;
                      });
                    }),
                  ),
                  labelText: 'password',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Digite sua senha';
                  }
                },
                obscureText: _showsenh == false ? true : false,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsApp.i.azulpetroleo),
                  onPressed: () {
                    if (_chavkey.currentState!.validate()) {}
                  },
                  child: Text('Criar conta')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Text('Fazer login.',
                      style: TextStyle(
                        color: context.colors.green,
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
