
// ignore_for_file: prefer_const_constructors, camel_case_types

import 'dart:developer';

import 'package:final_projem/Pages/introduction_screen.dart';
import 'package:final_projem/my_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


import 'Pages/welcome_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
 // runApp(const MyApp2());
}

//class MyApp2 extends StatelessWidget {
  //const MyApp2({super.key});

 // @override
 // Widget build(BuildContext context) {
   // return MaterialApp(
     // home: Scaffold(
      //  body: Center(
         // child: ElevatedButton(
            //onPressed: () async {
              //var malzemeler = await FirestoreDB.getIngredients();
              //for (var malzeme in malzemeler) {
               // log("${malzeme.isim} -> ${(await malzeme.tarifler).length}");
             // }
           // },
           // child: Text("Tikla"),
         // ),
        //),
      //),
   // );
  //}
//}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return WelcomePage();
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          return IntroductionPage();
        }
      },
      stream: FirebaseAuth.instance.authStateChanges(),
    );
  }
}