class Food {
  final String name;
  final String image;
  final String description;

  Food({required this.name, required this.image, required this.description});

  get length => null;

  static List<Food> getFoods() {
    return [
      Food(
          name: 'Sayuran',
          image: 'images/sayuran.jpg',
          description:
              "Sayur-sayuran termasuk dalam jenis makanan sehat karena mengandung banyak nutrisi penting, seperti serat, vitamin A, vitamin C, vitamin K, magnesium, kalsium, zat besi, folat, dan kalium, yang sangat baik untuk kesehatan.\n"
              "Selain itu, sayuran juga kaya akan antioksidan yang dapat melindungi tubuh dari kerusakan akibat radikal bebas dan mengurangi berbagai risiko penyakit kronis, seperti penyakit jantung koroner, diabetes tipe 2, dan kanker.\n"
              "Oleh karena itu, adalah penting untuk mencampurkan berbagai jenis sayuran dalam diet harian anda untuk memastikan anda mendapat berbagai nutrien yang diperlukan oleh tubuh anda. Pastikan anda memasukkan sayuran hijau, sayuran berwarna-warni, dan sayuran jenis lain dalam pemakanan harian anda."),
      Food(
          name: 'Buah-Buahan',
          image: 'images/buah.jpg',
          description:
              "Buah-buahan boleh dimakan sehari-hari karena mereka kaya akan nutrisi seperti vitamin, mineral, serat, dan antioksidan yang baik untuk kesehatan tubuh. Mengonsumsi buah-buahan secara teratur dapat meningkatkan sistem kekebalan, menjaga keseimbangan gula darah, dan membantu menjaga berat badan yang sehat."),
      Food(
          name: 'Daging dan Telur',
          image: 'images/daging.jpg',
          description:
              "Daging adalah salah satu sumber protein hewani yang penting dalam diet manusia. Daging mengandung berbagai nutrisi penting seperti protein, zat besi, zinc, vitamin B kompleks, dan asam amino esensial yang dibutuhkan oleh tubuh untuk menjalankan berbagai fungsi penting.\n"
              "Namun, penting untuk mencatat bahwa konsumsi daging sehari-hari harus seimbang dan disertai dengan diet yang sehat secara keseluruhan. Terlalu banyak konsumsi daging merah, misalnya, telah dikaitkan dengan risiko penyakit tertentu, termasuk penyakit jantung dan kanker. Oleh karena itu, penting untuk menjaga keseimbangan dalam diet Anda dan memasukkan berbagai jenis makanan lainnya, seperti buah-buahan, sayuran, biji-bijian, dan produk susu, untuk memastikan Anda mendapatkan semua nutrisi yang diperlukan untuk kesehatan yang optimal."),
      Food(
          name: 'Kacang-kacangan dan Biji-bijian',
          image: 'images/kacang.jpg',
          description:
              "Kacang adalah makanan yang sehat dan dapat dimakan sehari-hari karena mengandung berbagai manfaat kesehatan seperti sumber protein, serat, nutrisi, lemak sehat, antioksidan, dan menurunkan resiko penyakit.\n"
              "Namun, seperti dengan makanan lainnya, penting untuk mengonsumsi kacang dengan bijak dan dalam jumlah yang sesuai. Beberapa orang mungkin memiliki alergi terhadap kacang, jadi mereka harus menghindarinya. Selain itu, kacang mengandung kalori, jadi jika Anda mencoba untuk menjaga berat badan atau memiliki masalah dengan kelebihan berat badan, penting untuk mengonsumsinya dalam jumlah yang sesuai dengan kebutuhan kalori harian Anda."
              "Juga, kacang yang diasinkan atau diberi rasa mungkin mengandung tambahan garam atau gula, jadi penting untuk membaca label nutrisi dengan cermat jika Anda memilih produk-produk tersebut."),
    ];
  }
}
