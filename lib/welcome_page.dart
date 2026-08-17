import 'package:flutter/material.dart';
import 'main.dart';
import 'main2.dart';


class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  void goToCalculator(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const MyHomePage(title: 'Calculate Travel Costs')),
    );
  }

  void goToFormula(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const FormulaPage(title: '',)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculate Travel Costs"),
        backgroundColor: const Color.fromARGB(255, 3, 247, 251),
        centerTitle: true,
      ),
      body:
       Container(
        color: const Color.fromARGB(255, 208, 240, 240),
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Image.asset(
              'assets/images/SP004.jpg',
              width: 300,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => goToCalculator(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(170, 255, 255, 255),
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text("คำนวณค่าใช้จ่ายในการเดินทางด้วยรถน้ำมัน 🚗",
              style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => goToFormula(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(170, 255, 255, 255),
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text("คำนวณค่าใช้จ่ายในการเดินทางด้วยรถไฟฟ้า 🚄",
              style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),),
            ),
          ],
        ),
      ),
    );
  }
}
