import 'package:flutter/material.dart';
import '../my_firestore.dart';

import '../turkish_to_english.dart';
import 'category_result.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title:  Text("Kategoriler",style: TextStyle(color: Colors.black),),
      leading: IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: Icon(Icons.arrow_back_ios_new_sharp,color: Colors.black,)),
    ),
        body: FutureBuilder(
          future: FirestoreDB.getCategories(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: ((context, index) {
                var category = snapshot.data![index];

                return Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color:Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                       image: AssetImage(
                          "assets/kategoriler/${donustur(category.isim)}.jpg"
                     ),
                      colorFilter:  ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),

 fit:BoxFit.fitWidth

                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all( 10),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return CategoryResult(kategori: category);
                          },
                        ),
                      );
                    },

                    child: Text(
                      category.isim,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
                    ),
                  ),
                );
              }),
            );
          },
        ));
  }
}