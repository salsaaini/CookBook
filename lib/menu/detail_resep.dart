import 'package:flutter/material.dart';
import 'package:flutter_application_1/makanan/recipe.dart';

class DetailResep extends StatelessWidget {
  final Resep resep;

  DetailResep({required this.resep});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      title: Text(
        resep.nama,
        style: TextStyle(
          color: Colors.black, // Mengatur warna teks menjadi hitam
        ),
      ),
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black), // Mengatur warna ikon AppBar menjadi hitam
    ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                resep.gambar,
                width: 500, // Ganti ukuran sesuai yang Anda inginkan
                height: 350, // Ganti ukuran sesuai yang Anda inginkan
                fit: BoxFit.fill, // Sesuaikan dengan jenis tampilan yang Anda inginkan
              ),
              SizedBox(height: 20),
              Text(
                '${resep.asal}',
                style: TextStyle(
                  color: Colors.black45, // Mengatur warna teks menjadi hitam
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.alarm,
                    color: Colors.orange,
                  ),
                  SizedBox(width: 4),
                  Text(resep.waktu),
                ],
              ),
              SizedBox(height: 10),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text(
                    resep.ket,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
               ),
            ],
          ),
        ),
      ),
    );
  }
}
