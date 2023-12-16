import 'package:ctf/screens/quiz_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String comment1 = "";
  String comment2 = "";

  void changeComment() {
    setState(() {
      comment1 = "삐빅 틀렸습니다 ";
      comment2 = "(Hint : 주은이가 배를 ** 누른다)";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'asset/security_quiz.png',
                    height: 50,
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Text(
                comment1,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                comment2,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  changeComment();
                },
                onLongPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuizScreen(),
                    ),
                  );
                },
                child: const Icon(
                  Icons.play_circle_filled_rounded,
                  size: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
