class Resep{
  final String nama;
  final String asal;
  final String gambar;
  final String waktu;
  final String ket;

  Resep({required this.nama, required this.asal, required this.gambar, required this.waktu, required this.ket});
}

var ListFood = [
Resep(
nama: 'Rendang',
asal: 'Minangkabau, Sumatra Barat',
gambar: 'images/rendang1.jpg',
waktu: '30 Menit',
ket: "Bahan :\n"
"600g daging sapi bagian sengkel, potong kotak 5 cm\n"
"3 lembar daun jeruk\n"
"2 batang serai, memarkan\n"
"2 lembar daun salam\n"
"1 lembar daun kunyit\n"
"5 sdt pala bubuk\n"
"2.5 L air\n"
"130 ml santan instan\n"
"1 sdm Royco Kaldu Sapi\n"
"2.5 sdm garam\n"
"5 sdm minyak, untuk menumis\n\n"
"Langkah-langkah:\n"
"1. Panaskan minyak, tumis bumbu halus bersama daun jeruk, serai, daun salam, daun kunyit, dan pala hingga harum.\n"
"2. Masukkan daging, aduk rata. Tuang air, masak hingga mendidih.\n"
"3. Tambahkan santan, Royco Kaldu Sapi, dan garam.\n"
"4. Masak sambil diaduk hingga airnya terserap habis dan minyaknya keluar. Angkat. Sajikan."
), 

Resep(nama: 'Cah Kangkung Cumi', 
asal: 'Jambi', 
gambar: 'images/kangkung1.jpg', 
waktu: '15 menit', 
ket: "Bahan:\n"
"1 ikat kangkung\n"
"1 ekor cumi\n"
"1/2 sdm fibercreme\n"
"Bumbu Uleg Kasar:\n"
"4 siung bawang putih\n"
"1 butir kemiri\n"
"10 buah cabai rawit\n\n"
"Langkah-langkah :\n"
"1. Siangi kangkung lalu cuci bersih dan tiriskan. Cuci juga cumi, lalu potong cincin.\n"
"2. Panaskan minyak lalu goreng cumi sampai matang, angkat dan sisihkan.\n"
"3. Tumis bumbu uleg sampai wangi lalu masukkan kangkung dan cumi. Lalu masukkan penyedap rasa secukupnya. Aduk rata\n"
"4. Aduk rata fibercreme dengan sedikit air hangat lalu tuang ke tumisan.\n"
"5. Koreksi rasa, bila sudah pas, bisa diangkat dan disajikan."),

Resep(nama: "Oseng Teri Kentang", 
asal: "Indonesia", 
gambar: "images/kentang1.jpg", 
waktu: '15 menit', 
ket: "Bahan :\n"
"3 buah kentang\n"
"150 gram ikan teri asin\n"
"Garam, gula, dan kaldu bubuk secukupnya\n\n"
"Bumbu Iris\n"
"7 siung bawang merah\n"
"3 siung bawang putih\n"
"5 buah cabai merah\n"
"8 buah cabai rawit merah\n"
"2 batang daun bawang\n\n"
"Langkah-langkah : \n"
"1. Kupas kentang, lalu potong dadu dan goreng.\n"
"2. Bilas ikan teri dan goreng.\n"
"3. Panaskan sedikit minyak, lalu tumis bawang merah, bawang putih, dan cabai hingga harum.\n"
"4. Masukkan kentang, teri, dan daun bawang. Bumbui dengan garam, gula, dan kaldu bubuk secukupnya. Aduk rata.\n"
"5. Jangan lupa koreksi rasa, jika sudah pas, boleh diangkat dan siap disajikan."),
];
