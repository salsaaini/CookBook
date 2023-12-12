// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/menu/Detailbook.dart';
// import 'package:flutter_application_1/services/category_service.dart';

// class BookmarkList extends StatefulWidget {
//   @override
//   _BookmarkListState createState() => _BookmarkListState();
// }

// class _BookmarkListState extends State<BookmarkList> {
//   final Category_service categoryService = Category_service();

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<List<DocumentSnapshot>>(
//       stream: categoryService.getBookmark(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return CircularProgressIndicator();
//         }

//         List<DocumentSnapshot> bookmarks = snapshot.data!;

//         return ListView.builder(
//           itemCount: bookmarks.length,
//           itemBuilder: (context, index) {
//             var bookmarkData = bookmarks[index].data() as Map<String, dynamic>;
//             String idMeal = bookmarkData['idMeals'];

//             return ListTile(
//               title: Text(bookmarkData['strMeal']),
//               subtitle: Text('ID: $idMeal'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => DetailRecipe(idMeal: idMeal),
//                   ),
//                 );
//               },
//               trailing: IconButton(
//                 icon: Icon(Icons.delete),
//                 onPressed: () {
//                   categoryService.deleteBookmark(bookmarks[index].id);
//                 },
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
