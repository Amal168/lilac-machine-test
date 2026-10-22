
import 'package:flutter/material.dart';
import 'package:lilac_machine_test/main.dart';
import 'package:lilac_machine_test/screens/homepage.dart';
import 'package:lilac_machine_test/screens/transtion.dart';


class Mainnavebar extends StatefulWidget {
  const Mainnavebar({super.key});

  @override
  State<Mainnavebar> createState() =>
      _MainnavebarState();
}

class _MainnavebarState extends State<Mainnavebar> {
  int selectedIndex = 0;

  final Color teal = const Color(0xFF438883);
  final Color darkTeal = const Color(0xFF285F5C);

  // 1. Define all pages here
  final List<Widget> pages = [
     HomeScreen(),
    const Center(child: Text('History Page')),
    const Center(child: Text('Wallet Page')),
    const Center(child: Text('Profile Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 2. Show the selected page
      body: pages[selectedIndex],

      // 3. Custom bottom navigation design
      bottomNavigationBar: SizedBox(
        height: 88,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 72,
                color: teal,
                child: Row(
                  children: [
                    navItem(Icons.home_outlined, 0),
                    navItem(Icons.history, 1),
                    const SizedBox(width: 76),
                    navItem(
                      Icons.account_balance_wallet_outlined,
                      2,
                    ),
                    navItem(Icons.person_outline, 3),
                  ],
                ),
              ),
            ),

            // Raised center + button
            Positioned(
              top: -1,
              child: Container(
                width: 80,
                height: 80,
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Color(0xFFE8F2F1),
                  shape: BoxShape.circle,
                ),
                child: FloatingActionButton(
                  heroTag: 'addExpenseButton',
                  elevation: 4,
                  backgroundColor: teal,
                  foregroundColor: Colors.white,
                  shape: const CircleBorder(),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const Transtion(),
                      ),
                    );
                  },
                  child: const Icon(Icons.add, size: 30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 4. Reusable navigation item
  Widget navItem(IconData icon, int index) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: SizedBox(
          height: 72,
          child: Center(
            child: Icon(
              icon,
              size: 29,
              color: selectedIndex == index
                  ? Colors.white
                  : darkTeal,
            ),
          ),
        ),
      ),
    );
  }
}
