import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 247, 153, 12),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Profile Account"),
            ],
          ),
        ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('images/orangjpg.jpg'),
            ),
            const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
            height: 80,
            width: 800,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 5),
                      color: Colors.deepPurple.withOpacity(.2),
                      spreadRadius: 2,
                      blurRadius: 10
                  )
                ]
            ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                      fontSize: 12),
                  ),
                  SizedBox(height: 5),
                  Text("Salsabila Ramadanti Nuraini",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontSize: 12),),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
              height: 80,
              width: 800,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 5),
                        color: Colors.deepPurple.withOpacity(.2),
                        spreadRadius: 2,
                        blurRadius: 10
                    )
                  ]
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Phone",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                        fontSize: 12),
                  ),
                  SizedBox(height: 5),
                  Text("081234567890",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontSize: 12),),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
              height: 80,
              width: 800,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 5),
                        color: Colors.deepPurple.withOpacity(.2),
                        spreadRadius: 2,
                        blurRadius: 10
                    )
                  ]
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                        fontSize: 12),
                  ),
                  SizedBox(height: 5),
                  Text("example@gmail.com",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontSize: 12),),
                ],
              ),
            ),
            const SizedBox(height: 20),





            // itemProfile('Name', 'Ahad Hashmi', CupertinoIcons.person),
            // const SizedBox(height: 10),
            // itemProfile('Phone', '03107085816', CupertinoIcons.phone),
            // const SizedBox(height: 10),
            // itemProfile('Address', 'abc address, xyz city', CupertinoIcons.location),
            // const SizedBox(height: 10),
            // itemProfile('Email', 'ahadhashmideveloper@gmail.com', CupertinoIcons.mail),
            // const SizedBox(height: 20,),
            // SizedBox(
            //   width: double.infinity,
            //   child: ElevatedButton(
            //       onPressed: () {},
            //       style: ElevatedButton.styleFrom(
            //         padding: const EdgeInsets.all(15),
            //       ),
            //       child: const Text('Edit Profile')
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(Profile());
}
