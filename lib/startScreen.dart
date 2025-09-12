import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class startScreen extends StatelessWidget {
  const startScreen(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/quiz-logo.png', width: 280),
          SizedBox(height: 50),
          Text(
            'Belajar Flutter dengan mudah!',
            style: GoogleFonts.poppins(fontSize: 24, color: Colors.white),
          ),
          SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: switchScreen,
            label: Text('Mulai Quiz'),
            icon: Icon(Icons.arrow_circle_right_outlined),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
