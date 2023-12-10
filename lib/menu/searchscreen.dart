import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          SearchForm(
              // Berikan parameter yang dibutuhkan oleh SearchForm
              ),
        ],
      ),
    );
  }
}

class SearchForm extends StatefulWidget {
  @override
  _SearchFormState createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(21.0),
              border:
                  Border.all(color: Colors.black38), // Tambahkan garis pinggir
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: "Find your recipe...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      // Handle search button click
                      String query = _searchController.text;
                      // Perform search logic, e.g., fetch data based on the query
                      // You may want to navigate to a new page with search results
                      // For simplicity, let's print the query for now
                      print("Performing search for: $query");
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 16),
          // ElevatedButton with transparent background
        ],
      ),
    );
  }
}
