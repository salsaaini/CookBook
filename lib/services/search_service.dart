// import 'dart:convert';
// import 'package:dio/dio.dart';
// import 'package:flutter_application_1/model/detail.dart';

// class FetchDetailList {
//   var data = [];
//   List<Detail> results = [];
//   String urlList = 'https://www.themealdb.com/api/json/v1/1/search.php?s=';

//   Future<List<Detail>> getDetailList({String? query}) async {
//     try {
//       var dio = Dio();
//       var response = await dio.get(urlList);

//       if (response.statusCode == 200) {
//         // Decode the JSON response
//         Map<String, dynamic> responseBody = json.decode(response.toString());

//         // Extract details list from the response
//         List details = responseBody['meals'];

//         // Map each detail to a Detail object
//         results = details.map((e) => Detail.fromJson(e)).toList();

//         // Filter details based on the query
//         if (query != null) {
//           results = results
//               .where((detail) =>
//                   detail.strMeal.toLowerCase().contains(query.toLowerCase()))
//               .toList();
//         }
//       } else {
//         print("fetch error");
//       }
//     } on DioError catch (e) {
//       print('error: $e');
//     }
//     return results;
//   }
// }
