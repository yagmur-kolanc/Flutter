import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'category_page.dart';
import 'recipe_choose_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title:  Text("Hoşgeldiniz!",style: TextStyle(color: Colors.black),),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: const Text(
                            "Çıkış yapmak istediğinizden emin misiniz?"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                FirebaseAuth.instance.signOut();

                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const MyApp(),
                                    ));
                              },
                              child: const Text("Evet")),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Hayır"))
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.exit_to_app,color: Colors.black,))
          ],
        ),
        body:  Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const RecipeChoose(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color:Colors.black,
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/malzeme.jpg"
                        ),  fit:BoxFit.fitHeight,
                        colorFilter:  ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),


                      ),

                    ),
                    padding: EdgeInsets.all(10),
                    child: Center(
                        child: Text(
                          "Malzemeden bul",
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
                        )),
                  ),
                ),
              ),
              SizedBox(height: 10,)
,              Expanded( child:  InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CategoryPage(),
                    ),
                  );
                },
                child:Container(
                  decoration: BoxDecoration(
                    color:Colors.black,
                    image: DecorationImage(
                      image: AssetImage(
"assets/kategori.jpg"
                      ),  fit:BoxFit.fitHeight,
                      colorFilter:  ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),


                    ),

                  ),
                  padding: EdgeInsets.all(10),
                  child: Center(
                      child: Text(
                        "Kategoriden bul",
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
                      )),
                ),
              ),)
            ],
          ),



    );
  }
}
