import 'package:flutter/material.dart';

class Bleu extends StatelessWidget {
  const Bleu ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                image: AssetImage("images/bleu.jpg",
                ),
                fit: BoxFit.cover,
                opacity: 0.9,
              ),
            ),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
                child: Row(
                  children: [
                     InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                       child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new   ,
                          color: Colors.black,
                          size: 20,
                        ),
                                         ),
                     ),
                  ],
                ),
                ),
                Spacer(),
                Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white54,
                      borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Chicken Cordon Bleu",
                          style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Prancis",
                          style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 25,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "4.5",
                              style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Deskripsi :",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                 SizedBox(
                  height: 10,
                ),
                Text(
                  "Chicken Cordon Bleu adalah hidangan yang menggabungkan beberapa bahan berkualitas tinggi menjadi hidangan daging yang kaya dan lezat. Hidangan ini terdiri dari potongan daging ayam, yang seringkali adalah dada ayam, yang diisi dengan lapisan keju, biasanya keju Swiss, dan ham. Potongan daging ayam kemudian digulung untuk menyembunyikan isian tersebut, menciptakan struktur berlapis.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            ),
        ],
      ),
    );
  }
}