import 'package:flutter/material.dart';
import 'package:flutter_application_1/makanan/food.dart';

class DetailPage extends StatelessWidget {
  final Food food;

  DetailPage({required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(food.name),
      ),
      body: SingleChildScrollView( // Menggunakan SingleChildScrollView
        child: Center(
          child: Column(
            children: [
              Image.asset(
                food.image,
                width: 500,
                height: 350,
              ),
              SizedBox(height: 20),
              Text(food.description),
            ],
          ),
        ),
      ),
    );
  }
}
