import 'package:flutter/material.dart';
import 'package:flutter_application_1/menu/recipe.dart';
import 'package:flutter_application_1/model/foodlist.dart';
import 'package:flutter_application_1/services/category_service.dart';

class RecipeListScreen extends StatefulWidget {
  final String category;

  RecipeListScreen({required this.category});

  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  Category_service salsa = Category_service();
  FoodList? data;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    salsa.getFoodListByCategory(widget.category).then((value) {
      setState(() {
        data = value;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.category}',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'AbhayaLibre',
            fontSize: 26,
          ),
        ),
        backgroundColor: const Color.fromRGBO(254, 193, 35, 1.0),
        iconTheme: IconThemeData(
          color: Colors.black, // Mengatur warna ikon panah kembali
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            // Fungsi yang akan dijalankan ketika tombol kembali ditekan
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<FoodList>(
        future: salsa.getFoodListByCategory(widget.category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<Meal> meals = snapshot.data!.meals;

            return ListView.builder(
              itemCount: meals.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Handle tap on recipe item
                    // Example:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RecipeDetailScreen(id: data!.meals[index].idMeal),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9), // Warna D9D9D9
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image:
                                      NetworkImage(meals[index].strMealThumb),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 2, // Nilai flex yang lebih tinggi untuk teks
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      meals[index].strMeal,
                                      style: TextStyle(
                                          fontFamily: 'AbhayaLibre',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
