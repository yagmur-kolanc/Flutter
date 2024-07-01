import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDB {
  static final FirebaseFirestore _instance = FirebaseFirestore.instance;

  /// Gets all available [Category] objects from database.
  static Future<List<Category>> getCategories() async {
    var query = await _instance.collection('kategori').get();

    return query.docs.map((doc) => Category.fromMap(doc.data())).toList();
  }

  /// Gets a single [Category] object from database with the given id. Returns null if doesn't exist.
  static Future<Category?> getCategoryById(String id) async {
    var query = await _instance
        .collection('kategori')
        .where("id", isEqualTo: id)
        .limit(1)
        .get();

    if (query.docs.isEmpty) {
      return null;
    }

    return Category.fromMap(query.docs.first.data());
  }

  /// Gets all available [Ingredient] objects from database.
  static Future<List<Ingredient>> getIngredients() async {
    var query = await _instance.collection('malzemeler').get();

    return query.docs.map((doc) => Ingredient.fromMap(doc.data())).toList();
  }

  /// Gets all available [Ingredient] objects from database with given ids.
  static Future<List<Ingredient>> getIngredientsByIds(List<String> ids) async {
    var query = await _instance
        .collection('malzemeler')
        .where('id', whereIn: ids)
        .get();

    return query.docs.map((doc) => Ingredient.fromMap(doc.data())).toList();
  }

  /// Gets all available [Ingredient] objects from database which have relationship with given [Recipe].
  static Future<List<Ingredient>> getIngredientsByRecipe(Recipe recipe) async {
    var relationships = await _instance.collection('malzemeler-tarifler').get();

    var ingredientIds = relationships.docs
        .map((doc) => doc.data()['malzeme'].toString())
        .toList();
    return await getIngredientsByIds(ingredientIds);
  }

  /// Gets a single [Ingredient] object from database with the given id. Returns null if doesn't exist.
  static Future<Ingredient?> getIngredientById(String id) async {
    var query = await _instance
        .collection('malzemeler')
        .where("id", isEqualTo: id)
        .limit(1)
        .get();

    if (query.docs.isEmpty) {
      return null;
    }

    return Ingredient.fromMap(query.docs.first.data());
  }

  /// Gets all available [Recipe] objects from database.
  static Future<List<Recipe>> getRecipes() async {
    var query = await _instance.collection('tarifler').get();

    return query.docs.map((doc) => Recipe.fromMap(doc.data())).toList();
  }

  /// Gets all available [Recipe] objects from database with given ids.
  static Future<List<Recipe>> getRecipesByIds(List<String> ids) async {
    var query =
        await _instance.collection('tarifler').where('id', whereIn: ids).get();

    return query.docs.map((doc) => Recipe.fromMap(doc.data())).toList();
  }

  /// Gets all available [Recipe] objects from database which have relationship with given [Ingredient].
  static Future<List<Recipe>> getRecipesByIngredient(
      Ingredient ingredient) async {
    var relationships = await _instance
        .collection('malzemeler-tarifler')
        .where("malzeme", isEqualTo: ingredient.id)
        .get();

    var recipeIds = relationships.docs
        .map((doc) => doc.data()['tarif'].toString())
        .toList();
    return await getRecipesByIds(recipeIds);
  }

  /// Gets all available [Recipe] objects from database which have relationship with given [Category].
  static Future<List<Recipe>> getRecipesByCategory(Category category) async {
    var query = await _instance
        .collection('tarifler')
        .where('kategori', isEqualTo: category.id)
        .get();

    return query.docs.map((doc) => Recipe.fromMap(doc.data())).toList();
  }

  /// Gets a single [Recipe] object from database with the given id. Returns null if doesn't exist.
  static Future<Recipe?> getRecipeById(String id) async {
    var query = await _instance
        .collection('tarifler')
        .where("id", isEqualTo: id)
        .limit(1)
        .get();

    if (query.docs.isEmpty) {
      return null;
    }

    return Recipe.fromMap(query.docs.first.data());
  }
}

class Category {
  final String id;
  final String isim;
  const Category({required this.id, required this.isim, });

  static Category fromMap(Map data) {
    return Category(
      id: data['id'].trim(),
      isim: data['isim'],

    );
  }

  Future<List<Recipe>> get tarifler => FirestoreDB.getRecipesByCategory(this);

  @override
  String toString() => isim;
}

class Ingredient {
  final String id;
  final String isim;

  const Ingredient({required this.id, required this.isim});

  static Ingredient fromMap(Map data) {
    return Ingredient(
      id: data['id'].trim(),
      isim: data['isim'],
    );
  }

  Future<List<Recipe>> get tarifler => FirestoreDB.getRecipesByIngredient(this);

  @override
  String toString() => isim;
}

class Recipe {
  final String id;
  final String isim;
  final String kategoriId;
  final String malzemeAciklamasi;
  final String resim;
  final String tarif;

  const Recipe({
    required this.id,
    required this.isim,
    required this.kategoriId,
    required this.malzemeAciklamasi,
    required this.resim,
    required this.tarif,
  });

  static Recipe fromMap(Map data) {
    return Recipe(
      id: data['id'].trim(),
      isim: data['isim'],
      kategoriId: data['kategori'],
      malzemeAciklamasi: data['malzemeler'],
      resim: data['url'],
      tarif: data['tarif'],
    );
  }

  Future<Category?> get kategori => FirestoreDB.getCategoryById(kategoriId);
  Future<List<Ingredient>> get malzemeler =>
      FirestoreDB.getIngredientsByRecipe(this);

  @override
  String toString() => isim;
}
