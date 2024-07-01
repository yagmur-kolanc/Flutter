// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_typing_uninitialized_variables
import 'dart:developer';

import 'package:final_projem/Pages/register_screen.dart';
import 'package:final_projem/Pages/forget_password.dart';
import 'package:final_projem/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text kutucukların yazılarını almak için kontrol değişkeni
  late TextEditingController controlMail;
  late TextEditingController controlSifre;
  @override
  void dispose() {
    super.dispose();
    controlMail.dispose();
    controlSifre.dispose();
  }

  @override
  void initState() {
    super.initState();
    controlMail = TextEditingController();
    controlSifre = TextEditingController();
  }

  GlobalKey<FormState> formLoginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Giriş yap"),
        ),
        body: Form(
          //form register key bununla anahtar doğrulama yaparız
          key: formLoginKey,
          child: Container(

            child: Center(
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 50),
                  Padding(
                    // Kullanıcı adı girişi
                    padding: EdgeInsets.all(30.0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        //validate email ile tanımla eğer email doğru ise hata vermesin
                        if (!validateEmail(value.toString())) {
                          return "Lütfen E-Postanızı giriniz";
                        }
                        return null;
                      },
                      controller: controlMail,
                      decoration: InputDecoration(
                        fillColor: Colors.white30,
                        filled: true,
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(color: Colors.black),
                        hintStyle: TextStyle(color: Colors.black),
                        labelText: 'E-Posta',
                        hintText: 'E-Postanızı Girin',
                      ),
                    ),
                  ),
                  Padding(
                    // Parola Girişi
                    padding: EdgeInsets.all(30.0),
                    child: TextFormField(
                      //şartlandırma eğer 6 karakteri geçmezse hata
                      validator: (value) {
                        if (value!.length < 6) {
                          return "Lütfen en az 6 karakterli giriniz";
                        }
                        return null;
                      },
                      controller: controlSifre,
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.white30,
                        filled: true,
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(color: Colors.black),
                        hintStyle: TextStyle(color: Colors.black),
                        labelText: 'Parola',
                        hintText: 'Parolanızı girin',
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                  ),
                  Container(
                    color: Colors.white30,
                    child: TextButton(
                      onPressed: () {
                        // TODO kullanıcı adı ve şifre onayı al

                        //bütün validator'ları doğrula true ise işleme geç
                        if (formLoginKey.currentState!.validate()) {
                          girisYap(controlMail.text.toLowerCase().trim(),
                                  controlSifre.text)
                              .then((value) {
                            if (value) {
                              //giriş başarılı snackbar göstermesi
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Giriş Başarılı!"),
                                backgroundColor: Colors.green,
                              ));
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const MainPage(),
                                ),
                              );
                            } else {
                              //giriş başarısız
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content:
                                    Text("Kulanıcı adı veya şifre yanlıştır!"),
                                backgroundColor: Colors.red,
                              ));
                            }
                          });
                        }
                      },
                      child: const Text(
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          'Giriş'),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    color: Colors.white30,
                    child: TextButton(
                      onPressed: () {
                        // TODO kullanıcı adı ve şifre onayı al

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      child: const Text(
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          'Kayıt Ol'),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    color: Colors.white30,
                    child: TextButton(
                      onPressed: () {
                        // TODO şifremi unuttum

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ForgetPasswordScreen(),
                          ),
                        );
                      },
                      child: const Text(
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          'Şifremi unuttum'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

bool validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern.toString());
  return (!regex.hasMatch(value)) ? false : true;
}

Future<bool> girisYap(String email, String sifre) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: sifre);
    return true;
  } on FirebaseAuthException catch (error) {
    log(error.code);
    if (error.code == 'user-not-found') {
      print("BÖyle bir kullanıcı bulunmamaktadır.");
    }

    return false;
  }
}
