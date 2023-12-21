import 'package:ctf/functions/questions.dart';
import 'package:ctf/screens/quiz_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  String comment3 = "문제는 총 ${Questions().questionsNum}문제입니다!!";
  double mediaHeight(BuildContext context, double scale) =>
      MediaQuery.of(context).size.height * scale / 10;
  double mediaWidth(BuildContext context, double scale) =>
      MediaQuery.of(context).size.width * scale / 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: mediaHeight(context, 1),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: mediaHeight(context, 1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'asset/security_quiz.png',
                    height: mediaHeight(context, 0.6),
                  ),
                ],
              ),
              SizedBox(
                height: mediaHeight(context, 2),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const QuizScreen()));
                },
                child: Icon(
                  Icons.play_circle_outline_rounded,
                  size: mediaHeight(context, 1.5),
                ),
              ),
              SizedBox(
                height: mediaHeight(context, 1.5),
              ),
              Text(
                comment3,
                style: TextStyle(
                    fontSize: mediaHeight(context, 0.3),
                    fontWeight: FontWeight.w600,
                    fontFamily: 'KCC'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
