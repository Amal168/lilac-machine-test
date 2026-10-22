import 'package:flutter/material.dart';
import 'package:lilac_machine_test/screens/homepage.dart';
import 'package:lilac_machine_test/screens/mainnavebar.dart';
import 'package:lilac_machine_test/widgets/colors.dart';

class Onbparding extends StatefulWidget {
  const Onbparding({super.key});

  @override
  State<Onbparding> createState() => _OnbpardingState();
}

class _OnbpardingState extends State<Onbparding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/onboardingimg.png',
              fit: BoxFit.contain,
            ),
            Text(
              'Spend Smarter \n Save More',
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: maincolor),
            ),
            MaterialButton(
              minWidth: 300,
              elevation: 10,
              height: 50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              color: maincolor,
              onPressed: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Mainnavebar(),
                      ));
                });
              },
              child: Text(
                'Get Started',
                style: TextStyle(fontWeight: FontWeight.bold, color: textcolor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
