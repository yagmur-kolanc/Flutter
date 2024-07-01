import 'package:flutter/material.dart';
import '../my_firestore.dart';

class RecipeDetailPage extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetailPage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title:  Text(recipe.isim.toString(),style: TextStyle(color: Colors.black),),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new_sharp,color: Colors.black,)),
      ),
      body: Column(
        children: [

          Expanded(child: Image.network(recipe.resim)),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start
                  ,
                  children: [


                    Text("Malzemeler",style: Theme.of(context).textTheme.headlineMedium,),

                    Text(recipe.malzemeAciklamasi),
                    const SizedBox(height: 10),


                     Text("Tarif",style: Theme.of(context).textTheme.headlineMedium,),
                    Text(recipe.tarif),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
