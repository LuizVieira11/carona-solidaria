import '../utils/styles.dart';

import '../utils/colors.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _formKey = GlobalKey<FormState>();
  bool viewPasswordText = false;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 50, 32, 50),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 70, 0, 70),
                  child: Text(
                    'Icone',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  'Bem vindo!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Vamos começar',
                  style: TextStyle(
                    color: secondLayerText,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 8),
                  child: TextFormField(
                    decoration: textFieldDecoration(label: 'Email'),
                    validator: (value) {
                      if (value == null) {
                        return 'Este campo deve ser preenchido';
                      } else if (!value.contains('@')) {
                        return 'Insira um email válido';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) => email = value,
                    maxLines: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 16),
                  child: TextFormField(
                    decoration: textFieldDecoration(
                      label: 'Senha',
                      isPassword: true,
                      isPasswordVisible: viewPasswordText,
                      togglePasswordVisibility: () {
                        setState(() {
                          viewPasswordText = !viewPasswordText;
                        });
                      },
                    ),
                    validator: (value) {
                      if (value == null) {
                        return 'Este campo deve ser preenchido';
                      } else if (!value.contains(RegExp('[a-z]')) ||
                          !value.contains(RegExp('[0-9]'))) {
                        return 'A senha deve ser composta por letras e números';
                      } else if (value.length < 8) {
                        return 'A senha deve ter no mínimo 8 caracteres';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) => password = value,
                    obscureText: !viewPasswordText,
                    maxLines: 1,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Entrando...')),
                            );
                          }
                        },
                        style: buttonStyle(),
                        child: const Text(
                          'Entrar',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(' Não tem uma conta?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup_page');
                        },
                        child: const Text(
                          'Criar uma conta',
                          style: TextStyle(
                            shadows: [
                              Shadow(color: green, offset: Offset(0, -1))
                            ],
                            color: Colors.transparent,
                            decoration: TextDecoration.underline,
                            decorationColor: green,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
