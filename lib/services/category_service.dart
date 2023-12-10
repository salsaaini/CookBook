import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

import 'package:flutter_application_1/model/food.dart';
import 'package:flutter_application_1/model/foodlist.dart';
import 'package:flutter_application_1/model/detail.dart';

class Category_service {
  final CollectionReference bookmark =
      FirebaseFirestore.instance.collection('bookmark');

  // Stream<QuerySnapshot> getBookmark() {
  //   final resepStream = bookmark.snapshots();
  //   return resepStream;
  // }

  Stream<List<DocumentSnapshot>> getBookmark() {
    return bookmark.snapshots().map((snapshot) => snapshot.docs);
  }

  Future<void> deleteBookmark(String id) async {
    bookmark.doc(id).delete();
  }

  Future<bool> isRecipeBookmarked(String userId, String recipeId) async {
    try {
      DocumentSnapshot document = await FirebaseFirestore.instance
          .collection('bookmarks')
          .doc(userId)
          .collection('user_bookmarks')
          .doc(recipeId)
          .get();

      return document.exists;
    } catch (error) {
      print('Error checking bookmark status: $error');
      throw error;
    }
  }

  Future<void> removeBookmark(String userId, String recipeId) async {
    try {
      await FirebaseFirestore.instance
          .collection('bookmarks')
          .doc(userId)
          .collection('user_bookmarks')
          .doc(recipeId)
          .delete();
    } catch (error) {
      print('Error removing bookmark: $error');
      throw error;
    }
  }

  Future<Food> getFoods() async {
    Response response = await Dio()
        .get('https://www.themealdb.com/api/json/v1/1/categories.php');
    String data = response.toString();
    print(data); // logging
    return foodFromJson(data);
  }

  Future<FoodList> getFoodListByCategory(String Category) async {
    Response response = await Dio()
        .get('https://www.themealdb.com/api/json/v1/1/filter.php?c=$Category');
    String data = response.toString();
    print(data); // logging
    return foodListFromJson(data);
  }

  Future<void> addBookmark(
      String uid, String gambar, String strMeal, String idMeals) async {
    bookmark.add(
        {'uid': uid, 'gambar': gambar, 'strMeal': strMeal, 'idMeals': idMeals});
  }

  Future<Detail> getRecipeDetail(String id) async {
    Response response = await Dio()
        .get('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id');
    String data = response.toString();
    print(data); // logging
    return detailFromJson(data);
  }

  Future<List<String>> getBookmarkedRecipeIds(String userId) async {
    try {
      // Reference to the bookmarks collection for the user
      CollectionReference bookmarksCollection = FirebaseFirestore.instance
          .collection('bookmark')
          .doc(userId)
          .collection('recipes');

      // Fetch all documents from the bookmarks collection
      QuerySnapshot snapshot = await bookmarksCollection.get();

      // Extract the recipe IDs from the documents
      List<String> recipeIds =
          snapshot.docs.map((DocumentSnapshot doc) => doc.id).toList();

      return recipeIds;
    } catch (error) {
      print('Error fetching bookmarked recipe IDs: $error');
      throw error;
    }
  }
}
