import 'package:flutter/material.dart';
import 'dart:ui';
import 'welcome_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  void goToWelcome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const WelcomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          SizedBox.expand(
            child: Image.asset(
              'assets/images/SP001.jpg',
              fit: BoxFit.cover,
            ),
          ),
          
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              child: Container(
                color: Colors.black.withOpacity(0), 
              ),
            ),
          ),
          
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.1),
                  Colors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.signpost,
                    color: Colors.orangeAccent,
                    size: 50,
                  ),
                ),
                const SizedBox(height: 20),
                
                const Text(
                  "Calculate Travel Costs",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.black26,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                const Text(
                  "How wonderful would it be if you just focus on\n"
                  "yourself and try the best that you can do. ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    
                    shadows: [
                      Shadow(
                        blurRadius: 20,
                        color: Colors.black26,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                
                OutlinedButton(
                  onPressed: () => goToWelcome(context),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(112, 255, 255, 255),
                    foregroundColor: Colors.purple,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 6,
                  ),
                  child: const Text(
                    "Let the journey begin.",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
