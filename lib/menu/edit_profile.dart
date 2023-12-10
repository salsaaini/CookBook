import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/menu/profile.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  //TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    User? currentUser = _auth.currentUser;

    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser?.uid)
        .get();

    if (snapshot.exists) {
      var userData = snapshot.data() as Map<String, dynamic>;
      nameController.text = userData['fullname'] ?? '';
      phoneController.text = userData['nomor'] ?? '';
      //emailController.text = userData['email'] ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    User? currentUser = _auth.currentUser;

    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser?.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return Center(child: Text('No Data Available'));
          }

          var userData = snapshot.data!.data() as Map<String, dynamic>;

          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(254, 193, 35, 1.0),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(254, 193, 35, 1.0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Icon(Icons.arrow_back_ios_new),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "Edit Profile",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'AbhayaLibre',
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  await saveUserData();
                                  Navigator.pop(
                                      context); // Close the EditProfile page
                                  // Navigate to the Profile page
                                  Navigator.pushReplacementNamed(
                                      context, Profile() as String);
                                },
                                icon: Icon(
                                  Icons.check_rounded,
                                  color: Colors.black,
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        CircleAvatar(
                          radius: 70,
                          child: Icon(
                            Icons.person,
                            size: 70,
                            color: Colors.white,
                          ),
                          backgroundColor: Color(
                              0xFFD9D9D9), // Gunakan nilai hex untuk warna D9D9D9
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 20, right: 20),
                  child: Container(
                    padding: const EdgeInsets.all(20), // Add padding here
                    height: 130,
                    width: 800,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 5),
                          color: Colors.deepPurple.withOpacity(.2),
                          spreadRadius: 2,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'AbhayaLibre',
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(height: 5),
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: 'Enter your name',
                            hintStyle: TextStyle(
                                fontFamily: 'AbhayaLibre', fontSize: 17),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 20, right: 20),
                  child: Container(
                    padding: const EdgeInsets.all(20), // Add padding here
                    height: 130,
                    width: 800,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 5),
                          color: Colors.deepPurple.withOpacity(.2),
                          spreadRadius: 2,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Phone",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'AbhayaLibre',
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(height: 5),
                        TextField(
                          controller: phoneController,
                          decoration: InputDecoration(
                            hintText: 'Enter your phone number',
                            hintStyle: TextStyle(
                                fontFamily: 'AbhayaLibre', fontSize: 17),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 20, right: 20),
                  child: Container(
                    padding: const EdgeInsets.all(20), // Add padding here
                    height: 130,
                    width: 800,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 5),
                          color: Colors.deepPurple.withOpacity(.2),
                          spreadRadius: 2,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'AbhayaLibre',
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          userData['email'] ?? 'Email not available',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'AbhayaLibre',
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> saveUserData() async {
    User? currentUser = _auth.currentUser;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser?.uid)
        .update({
      'fullname': nameController.text,
      'nomor': phoneController.text,
      //'email': emailController.text,
    });

    // Optional: Show a success message or navigate to another page
  }
}
