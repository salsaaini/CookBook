import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/category_service.dart';
import 'package:flutter_application_1/model/food.dart';
import 'package:flutter_application_1/List_category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Category_service salsa = Category_service();
  Food? data;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    salsa.getFoods().then((value) {
      setState(() {
        data = value;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDC022),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 70,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Unlock the Series of Delicious \nCooking with CookBook',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontFamily: 'AbhayaLibre',
                        fontWeight: FontWeight.w800,
                        height: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 65),
              Container(
                height: 1400,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Category",
                      style: TextStyle(
                        color: const Color.fromRGBO(254, 193, 35, 1.0),
                        fontSize: 23,
                        fontFamily: 'AbhayaLibre',
                        fontWeight: FontWeight.w800,
                        height: 0,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    if (data != null && !isLoading)
                      Expanded(
                        child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.8,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 5.0,
                          ),
                          itemCount: data!.categories.length,
                          itemBuilder: (BuildContext context, int index) {
                            Category category = data!.categories[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RecipeListScreen(
                                      category: category.strCategory,
                                    ),
                                  ),
                                );
                              },
                              child: Card(
                                color: Color(0xFFD9D9D9),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(21),
                                ),
                                margin: EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(21),
                                          bottom: Radius.circular(21),
                                        ),
                                        child: Image.network(
                                          category.strCategoryThumb,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            category.strCategory,
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w800,
                                              fontFamily: 'AbhayaLibre',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                    // Show a loading indicator while data is being fetched
                    if (isLoading)
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
