import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/detail.dart';
import 'package:flutter_application_1/services/category_service.dart';

class DetailRecipe extends StatefulWidget {
  final String idMeal;

  const DetailRecipe({Key? key, required this.idMeal}) : super(key: key);

  @override
  _DetailRecipeState createState() => _DetailRecipeState();
}

class _DetailRecipeState extends State<DetailRecipe> {
  Category_service categoryService = Category_service();
  Detail? data;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    categoryService.getRecipeDetail(widget.idMeal).then((value) {
      setState(() {
        data = value;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 1.7,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(data!.meals![0].strMealThumb),
                        fit: BoxFit.cover,
                        opacity: 0.9,
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(254, 193, 35, 1.0),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                ),
                              ),
                              // Container(
                              //   padding: EdgeInsets.all(8),
                              //   decoration: BoxDecoration(
                              //     color: Colors.white,
                              //     borderRadius: BorderRadius.circular(15),
                              //   ),
                              //   child: Icon(
                              //     Icons.bookmark_outlined,
                              //     color: Colors.orange,
                              //     size: 25,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 117,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                data!.meals![0].strMeal,
                                style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontFamily: 'AbhayaLibre',
                                  fontWeight: FontWeight.w800,
                                  // letterSpacing: 1,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                data!.meals![0].strArea,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'AbhayaLibre',
                                  //letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ingredients :',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'AbhayaLibre',
                            fontWeight: FontWeight.w800,
                            height: 1.0,
                          ),
                        ),
                        SizedBox(height: 10),
                        // Display Ingredients and Measures
                        _buildIngredientsList(data!.meals![0]),

                        SizedBox(height: 20),
                        Text(
                          "Instructions : ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'AbhayaLibre',
                            fontWeight: FontWeight.w800,
                            height: 1.0,
                          ),
                        ),
                        SizedBox(height: 20),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _buildInstructionParagraphs(
                              data!.meals![0].strInstructions),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  // Your other functions/widgets from the previous DetailRecipe page
  // Example:
  Widget _buildIngredientsList(Meal meal) {
    List<Widget> ingredientsList = [];

    for (int i = 1; i <= 20; i++) {
      String ingredientKey = 'strIngredient$i';
      String measureKey = 'strMeasure$i';

      if (meal.toJson()[ingredientKey] != null) {
        String ingredient = meal.toJson()[ingredientKey];
        String measure = meal.toJson()[measureKey] ?? '';

        if (measure.isNotEmpty && ingredient.isNotEmpty) {
          ingredientsList.add(
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.orange,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      Icons.circle,
                      color: Colors.transparent, // Transparent icon color
                      size: 20,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ), // Adjust the spacing between circle and measure
                  Text(
                    '$measure',
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily:
                          'AbhayaLibre', // Gantilah 'NamaFont' dengan nama font yang ingin Anda gunakan
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    width: 5,
                  ), // Adjust the spacing between measure and ingredient
                  Expanded(
                    child: Text(
                      '$ingredient',
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily:
                            'AbhayaLibre', // Gantilah 'NamaFont' dengan nama font yang ingin Anda gunakan
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }
    }

    return Column(children: ingredientsList);
  }

  List<Widget> _buildInstructionParagraphs(String instructions) {
    List<Widget> paragraphs = [];

    if (instructions != null && instructions.isNotEmpty) {
      List<String> instructionList = instructions.split('\r\n');

      for (int i = 0; i < instructionList.length; i++) {
        String paragraph = instructionList[i].trim();

        if (paragraph.isNotEmpty) {
          paragraphs.add(
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 1, vertical: 5),
              leading: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.orange,
                    width: 2,
                  ),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 3,
                ),
              ),
              title: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'AbhayaLibre',
                  ),
                  children: [
                    TextSpan(
                      text: paragraph,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      }
    }

    // Wrap the list of paragraphs in a Column widget
    return paragraphs;
  }

  void main() {
    runApp(DetailRecipe(idMeal: 'idMeal'));
  }
}
