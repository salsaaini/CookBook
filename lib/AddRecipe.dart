import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/firestore_service.dart';

class AddRecipeScreen extends StatefulWidget {
  @override
  _AddRecipeScreenState createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Recipe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Recipe Name'),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _imageController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Validate the form and add the recipe to Firestore
                _addRecipe();
              },
              child: Text('Add Recipe'),
            ),
          ],
        ),
      ),
    );
  }

  void _addRecipe() {
    String nama = _nameController.text.trim();
    String gambar = _imageController.text.trim();

    if (nama.isNotEmpty && gambar.isNotEmpty) {
      // Add the recipe to Firestore
      FirestoreService().addResep(gambar, nama);

      // Navigate back to the previous screen
      Navigator.pop(context);
    } else {
      // Show an error message if the form is not valid
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all fields.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
