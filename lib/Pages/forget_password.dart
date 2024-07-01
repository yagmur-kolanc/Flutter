import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  late TextEditingController controlMail;
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controlMail = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Şifremi unuttum"),
      ),
      body: Form(
        key: key,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Mail Giriniz", hintText: "Mail"),
                controller: controlMail,
                validator: (value) {
                  if (!validateEmail(value.toString())) {
                    return "lütfen email giriniz";
                  }
                },
              ),
              TextButton(
                  onPressed: () {
                    if (key.currentState!.validate()) {
                      FirebaseAuth.instance
                          .sendPasswordResetEmail(email: controlMail.text);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text("Şifre yenileme linki mailinize gönderildi!"),
                        backgroundColor: Colors.black,
                      ));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ));
                    }
                  },
                  child: Text("Yenileme Linki Gönder"))
            ],
          ),
        ),
      ),
    );
  }
}
