// To parse this JSON data, do
//
//     final detail = detailFromJson(jsonString);

import 'dart:convert';

Detail detailFromJson(String str) => Detail.fromJson(json.decode(str));

String detailToJson(Detail data) => json.encode(data.toJson());

class Detail {
  List<Meal>? meals;

  Detail({
    required this.meals,
  });

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      meals: (json['meals'] as List<dynamic>?)
          ?.map((x) => Meal.fromJson(x))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        "meals": meals?.map((x) => x.toJson()).toList(),
      };
}

class Meal {
  String idMeal;
  String strMeal;
  String? strDrinkAlternate;
  String strCategory;
  String strArea;
  String strInstructions;
  String strMealThumb;
  String? strTags;
  String strYoutube;
  String? strIngredient1;
  String? strIngredient2;
  String? strIngredient3;
  String? strIngredient4;
  String? strIngredient5;
  String? strIngredient6;
  String? strIngredient7;
  String? strIngredient8;
  String? strIngredient9;
  String? strIngredient10;
  String? strIngredient11;
  String? strIngredient12;
  String? strIngredient13;
  String? strIngredient14;
  String? strIngredient15;
  String? strIngredient16;
  String? strIngredient17;
  String? strIngredient18;
  String? strIngredient19;
  String? strIngredient20;
  String? strMeasure1;
  String? strMeasure2;
  String? strMeasure3;
  String? strMeasure4;
  String? strMeasure5;
  String? strMeasure6;
  String? strMeasure7;
  String? strMeasure8;
  String? strMeasure9;
  String? strMeasure10;
  String? strMeasure11;
  String? strMeasure12;
  String? strMeasure13;
  String? strMeasure14;
  String? strMeasure15;
  String? strMeasure16;
  String? strMeasure17;
  String? strMeasure18;
  String? strMeasure19;
  String? strMeasure20;
  String? strSource;
  String? strImageSource;
  String? strCreativeCommonsConfirmed;
  String? dateModified;

  Meal({
    required this.idMeal,
    required this.strMeal,
    required this.strDrinkAlternate,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strMealThumb,
    required this.strTags,
    required this.strYoutube,
    required this.strIngredient1,
    required this.strIngredient2,
    required this.strIngredient3,
    required this.strIngredient4,
    required this.strIngredient5,
    required this.strIngredient6,
    required this.strIngredient7,
    required this.strIngredient8,
    required this.strIngredient9,
    required this.strIngredient10,
    required this.strIngredient11,
    required this.strIngredient12,
    required this.strIngredient13,
    required this.strIngredient14,
    required this.strIngredient15,
    required this.strIngredient16,
    required this.strIngredient17,
    required this.strIngredient18,
    required this.strIngredient19,
    required this.strIngredient20,
    required this.strMeasure1,
    required this.strMeasure2,
    required this.strMeasure3,
    required this.strMeasure4,
    required this.strMeasure5,
    required this.strMeasure6,
    required this.strMeasure7,
    required this.strMeasure8,
    required this.strMeasure9,
    required this.strMeasure10,
    required this.strMeasure11,
    required this.strMeasure12,
    required this.strMeasure13,
    required this.strMeasure14,
    required this.strMeasure15,
    required this.strMeasure16,
    required this.strMeasure17,
    required this.strMeasure18,
    required this.strMeasure19,
    required this.strMeasure20,
    required this.strSource,
    required this.strImageSource,
    required this.strCreativeCommonsConfirmed,
    required this.dateModified,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        idMeal: json["idMeal"],
        strMeal: json["strMeal"],
        strDrinkAlternate: json["strDrinkAlternate"],
        strCategory: json["strCategory"],
        strArea: json["strArea"],
        strInstructions: json["strInstructions"],
        strMealThumb: json["strMealThumb"],
        strTags: json["strTags"],
        strYoutube: json["strYoutube"],
        strIngredient1: json["strIngredient1"],
        strIngredient2: json["strIngredient2"],
        strIngredient3: json["strIngredient3"],
        strIngredient4: json["strIngredient4"],
        strIngredient5: json["strIngredient5"],
        strIngredient6: json["strIngredient6"],
        strIngredient7: json["strIngredient7"],
        strIngredient8: json["strIngredient8"],
        strIngredient9: json["strIngredient9"],
        strIngredient10: json["strIngredient10"],
        strIngredient11: json["strIngredient11"],
        strIngredient12: json["strIngredient12"],
        strIngredient13: json["strIngredient13"],
        strIngredient14: json["strIngredient14"],
        strIngredient15: json["strIngredient15"],
        strIngredient16: json["strIngredient16"],
        strIngredient17: json["strIngredient17"],
        strIngredient18: json["strIngredient18"],
        strIngredient19: json["strIngredient19"],
        strIngredient20: json["strIngredient20"],
        strMeasure1: json["strMeasure1"],
        strMeasure2: json["strMeasure2"],
        strMeasure3: json["strMeasure3"],
        strMeasure4: json["strMeasure4"],
        strMeasure5: json["strMeasure5"],
        strMeasure6: json["strMeasure6"],
        strMeasure7: json["strMeasure7"],
        strMeasure8: json["strMeasure8"],
        strMeasure9: json["strMeasure9"],
        strMeasure10: json["strMeasure10"],
        strMeasure11: json["strMeasure11"],
        strMeasure12: json["strMeasure12"],
        strMeasure13: json["strMeasure13"],
        strMeasure14: json["strMeasure14"],
        strMeasure15: json["strMeasure15"],
        strMeasure16: json["strMeasure16"],
        strMeasure17: json["strMeasure17"],
        strMeasure18: json["strMeasure18"],
        strMeasure19: json["strMeasure19"],
        strMeasure20: json["strMeasure20"],
        strSource: json["strSource"],
        strImageSource: json["strImageSource"],
        strCreativeCommonsConfirmed: json["strCreativeCommonsConfirmed"],
        dateModified: json["dateModified"],
      );

  Map<String, dynamic> toJson() => {
        "idMeal": idMeal,
        "strMeal": strMeal,
        "strDrinkAlternate": strDrinkAlternate,
        "strCategory": strCategory,
        "strArea": strArea,
        "strInstructions": strInstructions,
        "strMealThumb": strMealThumb,
        "strTags": strTags,
        "strYoutube": strYoutube,
        "strIngredient1": strIngredient1,
        "strIngredient2": strIngredient2,
        "strIngredient3": strIngredient3,
        "strIngredient4": strIngredient4,
        "strIngredient5": strIngredient5,
        "strIngredient6": strIngredient6,
        "strIngredient7": strIngredient7,
        "strIngredient8": strIngredient8,
        "strIngredient9": strIngredient9,
        "strIngredient10": strIngredient10,
        "strIngredient11": strIngredient11,
        "strIngredient12": strIngredient12,
        "strIngredient13": strIngredient13,
        "strIngredient14": strIngredient14,
        "strIngredient15": strIngredient15,
        "strIngredient16": strIngredient16,
        "strIngredient17": strIngredient17,
        "strIngredient18": strIngredient18,
        "strIngredient19": strIngredient19,
        "strIngredient20": strIngredient20,
        "strMeasure1": strMeasure1,
        "strMeasure2": strMeasure2,
        "strMeasure3": strMeasure3,
        "strMeasure4": strMeasure4,
        "strMeasure5": strMeasure5,
        "strMeasure6": strMeasure6,
        "strMeasure7": strMeasure7,
        "strMeasure8": strMeasure8,
        "strMeasure9": strMeasure9,
        "strMeasure10": strMeasure10,
        "strMeasure11": strMeasure11,
        "strMeasure12": strMeasure12,
        "strMeasure13": strMeasure13,
        "strMeasure14": strMeasure14,
        "strMeasure15": strMeasure15,
        "strMeasure16": strMeasure16,
        "strMeasure17": strMeasure17,
        "strMeasure18": strMeasure18,
        "strMeasure19": strMeasure19,
        "strMeasure20": strMeasure20,
        "strSource": strSource,
        "strImageSource": strImageSource,
        "strCreativeCommonsConfirmed": strCreativeCommonsConfirmed,
        "dateModified": dateModified,
      };
}
