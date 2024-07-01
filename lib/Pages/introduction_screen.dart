import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'login_page.dart';


class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0,),
      body: IntroductionScreen(

        showNextButton: true,
        showDoneButton: true,
        onDone: () {
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>LoginPage()));
      },
        pages: [
          PageViewModel(
              image: Image.asset("assets/login.png"),
              title: "Sevgi'nin Mutfağı",
              body: "Hoşgeldiniz",
          ),
          PageViewModel(
              image: Image.asset("assets/sevgi.jpg"),
              title: "Hadi Başlayalım",
              body: "Uygulamayı kullanmak için en az 6"
                  " karakterli şifre oluşturak kayıt oluşturmanız gerekmektedir."
                  "Kayıt oluşturduktan sonra elinizde bulunan malzemeler ile yapabileceğiniz tarifler için Malzemeden Bul seçeneğini "
                  "yada yapmak istediğiniz yemeğin kategorisini seçmek içinde Kategoriden Bul seçeneğini seçerek tariflere ulaşabilirsiniz. ",
          ),


        ],
        globalBackgroundColor: Colors.white,
        done: Text("Anladım!",style: Theme.of(context).textTheme.bodySmall,),
        next: Text("Sıradaki!",style: Theme.of(context).textTheme.bodySmall,),
      ),
    );
  }
}
