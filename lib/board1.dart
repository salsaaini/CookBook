import 'package:flutter/material.dart';
import 'package:flutter_application_1/board2.dart';

class OnBoarding1 extends StatefulWidget {
  const OnBoarding1({Key? key}) : super(key: key);

  @override
  State<OnBoarding1> createState() => _OnBoarding1State();
}

class _OnBoarding1State extends State<OnBoarding1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(0),
                  bottomLeft: Radius.circular(0),
                ),
                image: DecorationImage(
                  image: AssetImage('images/pasta.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.9,
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: 75,
              height: 66,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/Search.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            // Displaying an image from assets

            SizedBox(height: 50),
            // Wrap both Container and Column in another widget (e.g., Expanded)
            SizedBox(
              width: 253,
              height: 82,
              child: Text(
                'Check various recipe ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontFamily: 'AbhayaLibre',
                  fontWeight: FontWeight.w800,
                  height: 0,
                ),
              ),
            ),
            SizedBox(height: 68),
            GestureDetector(
              onTap: () {
                // Navigate to OnBoarding2 when the button is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OnBoarding2()),
                );
              },
              child: Container(
                width: 155,
                height: 47,
                decoration: ShapeDecoration(
                  color: Color(0xFFFDC022),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'AbhayaLibre',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
