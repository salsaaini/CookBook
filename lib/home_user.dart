import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/firestore_service.dart';
import 'package:flutter_application_1/AddRecipe.dart';
import 'package:flutter_application_1/EditRecipe.dart';

class HomeUser extends StatefulWidget {
  const HomeUser({super.key});

  @override
  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("National Recipe"),
        actions: [
          // Icon button to navigate to the add recipe screen
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddRecipeScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              StreamBuilder<QuerySnapshot>(
                stream: FirestoreService().getResep(),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else {
                      List resepList = snapshot.data!.docs;
                      return Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: resepList.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot documentSnapshot =
                                  resepList[index];
                              Map<String, dynamic> data = documentSnapshot
                                  .data() as Map<String, dynamic>;

                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditRecipeScreen(
                                          recipeId: documentSnapshot.id),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Material(
                                    color: Colors.purple[50],
                                    elevation: 2,
                                    borderRadius: BorderRadius.circular(5),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.network(
                                            data['gambar'],
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  data['nama'],
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.edit),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditRecipeScreen(
                                                          recipeId:
                                                              documentSnapshot
                                                                  .id),
                                                ),
                                              );
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.delete),
                                            onPressed: () {
                                              // Implement code to delete recipe
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title:
                                                        Text("Delete Recipe"),
                                                    content: Text(
                                                        "Are you sure you want to delete this recipe?"),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text("Cancel"),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          // Implement code to delete recipe using the document ID
                                                          FirestoreService()
                                                              .deleteResep(
                                                                  documentSnapshot
                                                                      .id);
                                                          Navigator.pop(
                                                              context);
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
                    }
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
