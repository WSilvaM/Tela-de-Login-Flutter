import 'package:base_inicial/UI/Rederfinir_senha.dart';
import 'package:base_inicial/UI/cadastrar_Usuario.dart';
import 'package:base_inicial/helpers/loader.dart';
import 'package:base_inicial/helpers/messages.dart';
import 'package:base_inicial/styles/colors_styles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with Messages<HomePage>, Loader<HomePage> {
  final GlobalKey<FormState> _chavekey = GlobalKey<FormState>();
  bool _showsenha = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Form(
          key: _chavekey,
          child: ListView(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Já tem cadastro?',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text('Faça seu login.')
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.email_outlined),
                      labelText: 'E-mail',
                      hintText: 'exemplo@gmail.com'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Digite seu e-mail';
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock_outline,
                    ),
                    suffixIcon: GestureDetector(
                      child: Icon(
                        _showsenha == false
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                      onTap: (() {
                        setState(() {
                          _showsenha = !_showsenha;
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
                  obscureText: _showsenha == false ? true : false,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsApp.i.azulpetroleo,
                    ),
                    onPressed: () {
                      if (_chavekey.currentState!.validate()) {
                        showLoader();
                      }
                    },
                    child: Text(
                      'Entrar',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => Redefinir_Senha(),
                      ),
                    );
                  },
                  child: Text(
                    'Esqueci minha senha',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.red,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => CadastraUsuario()),
                    );
                  },
                  child: Text(
                    'Criar conta',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.green,
                        fontWeight: FontWeight.w700), //fonte em negrito
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
