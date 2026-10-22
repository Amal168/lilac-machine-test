
import 'package:flutter/material.dart';
import 'package:lilac_machine_test/screens/onbparding.dart';
import 'package:lilac_machine_test/widgets/colors.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    splashDelay();
  }

  Future<void> splashDelay() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Onbparding(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Text(
          'Expenzia',
          style: TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.bold,
            color: textcolor,
          ),
        ),
      ),
    );
  }
}
