import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors.dart';
import 'package:flutter_application_1/menu/aglio.dart';
import 'package:flutter_application_1/menu/bleu.dart';

class HomeScreen extends StatelessWidget {
  List<String> categories = [
    "Popular Menu",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.notifications,
                      color: Colors.orange,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Unlock the Secrets of Delicious Cooking with Cookbook",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              margin: EdgeInsets.all(15),
              height: 55,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 236, 234, 234),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [   
                  Icon(
                    Icons.search,
                    color:  Colors.orange,
                    size: 35,
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.only(start: 10),
                    height: 55,
                    width: MediaQuery.of(context).size.width /1.5,
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Find your recipe...",
                          border: InputBorder.none,
                        ),
                      ),
                    ), 
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < categories.length; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        categories[i],
                        style: TextStyle(
                          color: i == 0 ? Colors.orange : colors.grayClr,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width /2.1,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 236, 234, 234),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          // Navigasi ke halaman yang sesuai saat Aglio Olio Pasta di-klik
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Aglio(),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          height: 180,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset("images/aglio.jpg",
                            fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Aglio Olio Pasta",
                          style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Italia",
                          style: TextStyle(
                          fontSize: 16,
                          color: Colors.black38,
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround, // Untuk membuat jarak antara elemen-elemen sepanjang row
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.alarm, // Ikon waktu (sesuaikan dengan ikon yang sesuai)
                                color: Colors.orange,
                                size: 20, // Warna ikon
                              ),
                              SizedBox(width: 5), // Jarak antara ikon dan teks
                              Text(
                                "30 Menit",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,  // Warna teks
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.bookmark_border, // Ikon untuk menyimpan (sesuaikan dengan ikon yang sesuai)
                            color: Colors.orange,
                            size: 20, // Warna ikon simpan
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    // Navigasi ke halaman yang sesuai saat Aglio Olio Pasta di-klik
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Bleu(),
                      ),
                    );
                  },
                  child: Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width /2.1,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 236, 234, 234),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(8),
                          height: 180,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset("images/bleu.jpg",
                            fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Chicken Cordon Bleu",
                            style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Prancis",
                            style: TextStyle(
                            fontSize: 16,
                            color: Colors.black38,
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround, // Untuk membuat jarak antara elemen-elemen sepanjang row
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.alarm, // Ikon waktu (sesuaikan dengan ikon yang sesuai)
                                  color: Colors.orange,
                                  size: 20, // Warna ikon
                                ),
                                SizedBox(width: 5), // Jarak antara ikon dan teks
                                Text(
                                  "40 Menit",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,  // Warna teks
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.bookmark_border, // Ikon untuk menyimpan (sesuaikan dengan ikon yang sesuai)
                              color: Colors.orange,
                              size: 20, // Warna ikon simpan
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
