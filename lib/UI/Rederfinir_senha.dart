import 'package:base_inicial/styles/colors_styles.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class Redefinir_Senha extends StatefulWidget {
  const Redefinir_Senha({Key? key}) : super(key: key);

  @override
  State<Redefinir_Senha> createState() => _Redefinir_SenhaState();
}

class _Redefinir_SenhaState extends State<Redefinir_Senha> {
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
        elevation: 0,
      ),

      //SingleChildScrollView
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Form(
          key: _chavkey,
          //for keys
          child: ListView(
            children: [
              Center(
                child: Text(
                  'Esqueci minha senha',
                  style: TextStyle(fontSize: 25),
                ),
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
                      'E-mail cadastrado',
                    ),
                    labelStyle: TextStyle()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Digite seu email';
                  }
                },
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
                  child: Text(
                    'Recuperar conta',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
