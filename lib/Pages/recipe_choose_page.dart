import 'package:flutter/material.dart';

import '../my_firestore.dart';

import '../turkish_to_english.dart';
import 'recipe_result_page.dart';

class RecipeChoose extends StatefulWidget {
  const RecipeChoose({Key? key}) : super(key: key);

  @override
  State<RecipeChoose> createState() => _RecipeChooseState();
}

class _RecipeChooseState extends State<RecipeChoose> {
  List<Ingredient> secilenMalzemeler = [];



  void onChanged(Ingredient malzeme, bool state) {
    if (state) {
      secilenMalzemeler.add(malzeme);
    } else {
      secilenMalzemeler.remove(malzeme);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return RecipeResult(malzemeler: secilenMalzemeler);
                },
              ),
            );
          },
          child: const Icon(Icons.send)),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title:  Text("Malzeme Seç!",style: TextStyle(color: Colors.black),),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new_sharp,color: Colors.black,)),
      ),
      body: FutureBuilder(
        future: FirestoreDB.getIngredients(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          return Center(
            child: GridView.builder(
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
                  itemBuilder:(context,index){
                return   IngredientCheckBox(

                  malzeme: snapshot.data![index],
                  onChanged: onChanged,
                );
                  }



            ),
          );
        },
      ),
    );
  }
}

class IngredientCheckBox extends StatefulWidget {
  final Ingredient malzeme;
  final void Function(Ingredient, bool) onChanged;
  const IngredientCheckBox({
    super.key,
    required this.malzeme,
    required this.onChanged,
  });

  @override
  State<IngredientCheckBox> createState() => _IngredientCheckBoxState();
}

class _IngredientCheckBoxState extends State<IngredientCheckBox> {
  bool checked = false;

  @override
  Widget build(BuildContext context) => InkWell(

    child: Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color:Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(20)),
         image: DecorationImage(
           image: AssetImage(
                "assets/malzemeler/${donustur(widget.malzeme.isim)}.jpg"
            ),
             colorFilter:  ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),

          fit:BoxFit.fitWidth

        ),
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all( 10),
      child: Center(
        child: CheckboxListTile(
              title: Text(widget.malzeme.isim,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),),
              value: checked,
              onChanged: (newValue) {
                setState(() => checked = !checked);
                widget.onChanged(widget.malzeme, checked);
              },
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            ),
      ),
    ),
  );
}
