import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/menu/Detailbook.dart';
import 'package:flutter_application_1/menu/detail_resep.dart';
import 'package:flutter_application_1/services/category_service.dart';

class ListResep extends StatefulWidget {
  @override
  State<ListResep> createState() => _ListResepState();
}

class _ListResepState extends State<ListResep> {
  final Category_service categoryService = Category_service();

  String getCurrentUserUid() {
    // Use FirebaseAuth to get the current user
    User? user = FirebaseAuth.instance.currentUser;

    // Check if the user is not null and return the UID
    if (user != null) {
      return user.uid;
    } else {
      // Handle the case when the user is not authenticated
      // You can return a default value or throw an exception
      throw Exception("User not authenticated");
    }
  }

  @override
  Widget build(BuildContext context) {
    String uid = getCurrentUserUid();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(254, 193, 35, 1.0),
          title: Text(
            'Your Recipe',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'AbhayaLibre',
              fontSize: 26,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StreamBuilder<List<DocumentSnapshot>>(
                  stream: categoryService.getBookmark(uid),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    List<DocumentSnapshot> bookmarks = snapshot.data!;

                    return Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: bookmarks.length,
                          itemBuilder: (context, index) {
                            var bookmarkData =
                                bookmarks[index].data() as Map<String, dynamic>;
                            String idMeal = bookmarkData['idMeals'];

                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailRecipe(idMeal: idMeal),
                                  ),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                child: Material(
                                  elevation: 1,
                                  color: Color(0xFFD9D9D9),
                                  borderRadius: BorderRadius.circular(11.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            bookmarkData['gambar'],
                                            width: 90,
                                            height: 90,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                bookmarkData['strMeal'],
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 18,
                                                  fontFamily: 'AbhayaLibre',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.delete),
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text("Delete Recipe"),
                                                  content: Text(
                                                      "Are you sure you want to delete this recipe?"),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("Cancel"),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        categoryService
                                                            .deleteBookmark(
                                                                bookmarks[index]
                                                                    .id);
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("Delete"),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(ListResep());
}
