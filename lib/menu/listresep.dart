import 'package:flutter/material.dart';
import 'package:flutter_application_1/makanan/recipe.dart';
import 'package:flutter_application_1/menu/detail_resep.dart';

class ListResep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(10),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 236, 234, 234),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Cari resep...",
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: ListFood.length,
          itemBuilder: (context, index) {
            final resep = ListFood[index];
            return Card(
              elevation: 8.0,
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 13, vertical: 10), // Melebarkan item
                title: Row(
                  children: [
                    Container(
                      width: 90, // Lebar gambar
                      height: 95, // Tinggi gambar
                      child: Image.asset(
                        resep.gambar,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 16), // Jarak antara gambar dan teks
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            resep.nama,
                            style: TextStyle(
                              fontSize: 18, // Ganti ukuran font sesuai kebutuhan
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            resep.asal,
                            style: TextStyle(
                              fontSize: 15, // Ganti ukuran font sesuai kebutuhan
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.alarm,
                                color:  Colors.orange,
                                size: 20,
                              ),
                              SizedBox(width: 4), // Menambahkan jarak
                              Text(resep.waktu),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailResep(resep: resep),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(ListResep());
}
