import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/category_service.dart';
import 'package:flutter_application_1/model/food.dart';
import 'package:flutter_application_1/menu/profile.dart';
//import 'package:flutter_application_1/colors.dart';

//import 'package:flutter_application_1/menu/aglio.dart';
//import 'package:flutter_application_1/menu/bleu.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(254, 193, 35, 1.0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        // Navigasi ke halaman profil
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Profile()),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.person,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.notifications,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Unlock the Series of Delicious \nCooking with CookBook',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Abhaya Libre ExtraBold',
                          fontWeight: FontWeight.w800,
                          height: 1.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.all(25),
                height: 50,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  color: const Color.fromARGB(255, 236, 234, 234),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search_sharp,
                      color: Colors.black,
                      size: 30,
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(start: 10),
                      height: 55,
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: Center(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Find your recipe...",
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontFamily: 'Abhaya Libre ExtraBold',
                              fontWeight: FontWeight.w800,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 1000,
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
                        fontSize: 15,
                        fontFamily: 'Abhaya Libre ExtraBold',
                        fontWeight: FontWeight.w800,
                        height: 0,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              // GridView.builder(
              //   itemCount: _foodCategories
              //       .length, // Make sure _foodCategories is defined
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //     childAspectRatio: 2 / 3,
              //   ),
              //   itemBuilder: (BuildContext context, int index) {
              //     return Card(
              //       margin: EdgeInsets.all(20),
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: <Widget>[
              //           Icon(Icons.fastfood, size: 50),
              //           SizedBox(height: 10),
              //           Text(
              //             // Assuming _foodCategories is a list of categories
              //             foodToJson(data)[index],
              //             style: TextStyle(fontSize: 16),
              //             textAlign: TextAlign.center,
              //           ),
              //         ],
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
