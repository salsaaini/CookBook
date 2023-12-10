import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/firestore_service.dart';

class EditRecipeScreen extends StatefulWidget {
  final String recipeId;

  EditRecipeScreen({required this.recipeId});

  @override
  _EditRecipeScreenState createState() => _EditRecipeScreenState();
}

class _EditRecipeScreenState extends State<EditRecipeScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _imageController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Fetch the current data using widget.recipeId
    _fetchRecipeData();
  }

  void _fetchRecipeData() async {
    try {
      // Retrieve the current data of the recipe
      var recipeData = await FirestoreService().getRecipeById(widget.recipeId);

      // Set the retrieved data to the controllers
      _nameController.text = recipeData['nama'] ?? '';
      _imageController.text = recipeData['gambar'] ?? '';
    } catch (error) {
      print('Error fetching recipe data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Recipe'),
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
                _updateRecipe();
              },
              child: Text('Update Recipe'),
            ),
          ],
        ),
      ),
    );
  }

  void _updateRecipe() {
    String nama = _nameController.text.trim();
    String gambar = _imageController.text.trim();

    if (nama.isNotEmpty && gambar.isNotEmpty) {
      FirestoreService().updateResep(widget.recipeId, gambar, nama);
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all fields.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
