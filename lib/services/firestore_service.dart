import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference resep =
      FirebaseFirestore.instance.collection('resep');

  Stream<QuerySnapshot> getResep() {
    final resepStream = resep.snapshots();
    return resepStream;
  }

  Future<void> addResep(String gambar, String nama) async {
    resep.add({'gambar': gambar, 'nama': nama});
  }

  Future<void> updateResep(String id, String gambar, String nama) async {
    resep.doc(id).update({'gambar': gambar, 'nama': nama});
  }

  Future<Map<String, dynamic>> getRecipeById(String id) async {
    var snapshot = await resep.doc(id).get();
    return snapshot.data() as Map<String, dynamic>;
  }

  Future<void> deleteResep(String id) async {
    resep.doc(id).delete();
  }
}
