import 'package:flutter/material.dart';
import '../my_firestore.dart';
import 'recipe_detail_page.dart';

class CategoryResult extends StatefulWidget {
  final Category kategori;
  const CategoryResult({Key? key, required this.kategori}) : super(key: key);

  @override
  State<CategoryResult> createState() => _CategoryResultState();
}

class _CategoryResultState extends State<CategoryResult> {
  Future<List<Recipe>> getRecipes() async => widget.kategori.tarifler;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("Seçtiğiniz Kategorideki yemekler",style: TextStyle(color: Colors.black),),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new_sharp,color: Colors.black,)),
      ),
      body: FutureBuilder(
        future: getRecipes(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var recipe = snapshot.data![index];

              return Container(
                height: 120,
                decoration: BoxDecoration(
                  color:Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                   image: DecorationImage(
          image: NetworkImage(

              recipe.resim.toString()),
            fit:BoxFit.fitWidth,
                       colorFilter:  ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),


        ),
                ),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all( 10),
                child: Center(
                  child: ListTile(
                    title: Text(recipe.isim,style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),),
                    subtitle: Text(widget.kategori.isim,style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return RecipeDetailPage(recipe: recipe);
                          },
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
