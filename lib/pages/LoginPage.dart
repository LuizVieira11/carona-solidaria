import 'package:carona_solidaria/utils/colors.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _formKey = GlobalKey<FormState>();
  bool viewPasswordText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(32, 50, 0, 50),
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
                  color: Color.fromARGB(255, 87, 99, 108),
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 32, 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      floatingLabelStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Colors.grey[275],
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: green, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                      ),
                    ),
                    maxLines: 1,
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 32, 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                      suffixIcon: (viewPasswordText)
                          ? IconButton(
                              icon: const Icon(Icons.remove_red_eye_outlined),
                              onPressed: () {
                                setState(() {
                                  viewPasswordText = !viewPasswordText;
                                });
                              })
                          : IconButton(
                              icon: const Icon(Icons.visibility_off_outlined),
                              onPressed: () {
                                setState(() {
                                  viewPasswordText = !viewPasswordText;
                                });
                              }),
                      labelText: 'Senha',
                      floatingLabelStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Colors.grey[275],
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: green, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                      ),
                    ),
                    obscureText: viewPasswordText,
                    maxLines: 1,
                  )),
            ],
          ),
        ),
      ),
    ));
  }
}
