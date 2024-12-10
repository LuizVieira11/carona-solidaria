import 'package:carona_solidaria/utils/colors.dart';
import 'package:carona_solidaria/utils/courses_list.dart';
import 'package:carona_solidaria/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_mask/easy_mask.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? ra;
  String? phone;
  String? email;
  String? password;
  String dropDownValue = coursesList.first;
  bool viewPasswordText = false;
  bool viewConfirmPasswordText = false;

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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 8),
                  child: Text(
                    'Crie sua conta',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                const Text(
                  ' Vamos começar',
                  style: TextStyle(
                    color: secondLayerText,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 8),
                  child: TextFormField(
                    decoration: textFieldDecoration(label: 'Nome'),
                    onChanged: (value) => name = value,
                    validator: (value) {
                      final regex = RegExp(r'^[a-zA-Z\s]+$');
                      if (value == null || value == '') {
                        return 'Este campo deve ser preenchido';
                      } else if (!regex.hasMatch(value)) {
                        return 'Nome não pode conter simbolos ou números';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: TextFormField(
                    decoration: textFieldDecoration(label: 'RA'),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    maxLength: 8,
                    buildCounter: removeLimitShow,
                    onChanged: (value) => ra = value,
                    validator: (value) {
                      if (value == null || value == '') {
                        return 'Este campo deve ser preenchido';
                      } else if (value.length != 8) {
                        return 'Digite um RA válido';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: TextFormField(
                    decoration: textFieldDecoration(label: 'Telefone'),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      TextInputMask(mask: '(99) 99999-9999'),
                    ],
                    onChanged: (value) => phone = value,
                    validator: (value) {
                      if (value == null || value == '') {
                        return 'Este campo deve ser preenchido';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: DropdownButtonFormField<String>(
                    decoration: textFieldDecoration(label: ''),
                    isExpanded: true,
                    value: dropDownValue,
                    items: coursesList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropDownValue = newValue!;
                      });
                    },
                    validator: (value) {
                      if (value == null || value == '') {
                        return 'Este campo deve ser preenchido';
                      } else if (value.toLowerCase() == 'curso') {
                        return 'Escolha o seu curso atual';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: TextFormField(
                    decoration: textFieldDecoration(label: 'Email'),
                    onChanged: (value) => email = value,
                    validator: (value) {
                      if (value == null || value == '') {
                        return 'Este campo deve ser preenchido';
                      } else if (!value.contains('@')) {
                        return 'Digite um email válido';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
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
                    obscureText: !viewPasswordText,
                    onChanged: (value) => password = value,
                    validator: (value) {
                      if (value == null || value == '') {
                        return 'Este campo deve ser preenchido';
                      } else if (!value.contains(RegExp(r'[0-9]')) ||
                          !value.contains(RegExp(r'[a-z]'))) {
                        return 'A senha deve conter letras e números';
                      } else if (value.length < 8) {
                        return 'A senha deve conter pelo menos 8 caracteres';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 22),
                  child: TextFormField(
                    decoration: textFieldDecoration(
                      label: 'Confirme sua senha',
                      isPassword: true,
                      isPasswordVisible: viewConfirmPasswordText,
                      togglePasswordVisibility: () {
                        setState(() {
                          viewConfirmPasswordText = !viewConfirmPasswordText;
                        });
                      },
                    ),
                    obscureText: !viewConfirmPasswordText,
                    validator: (value) {
                      if (value == null || value == '') {
                        return 'Este campo deve ser preenchido';
                      } else if (!value.contains(RegExp(r'[0-9]')) ||
                          !value.contains(RegExp(r'[a-z]'))) {
                        return 'A senha deve conter letras e números';
                      } else if (value != password) {
                        return 'As senhas não conferem';
                      } else if (value.length < 8) {
                        return 'A senha deve conter pelo menos 8 caracteres';
                      } else {
                        return null;
                      }
                    },
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
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(' Já tem uma conta?'),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Acessar conta',
                          style: textButtonStyle(),
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

  Widget? removeLimitShow(
    _, {
    required currentLength,
    required isFocused,
    maxLength,
  }) =>
      null;
}
