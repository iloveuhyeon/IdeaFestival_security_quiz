import 'package:ctf/screens/quiz/quiz_screen1.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String comment1 = "";
  String comment2 = "";
  String comment3 = "";
  double mediaHeight(BuildContext context, double scale) =>
      MediaQuery.of(context).size.height * scale / 10;
  double mediaWidth(BuildContext context, double scale) =>
      MediaQuery.of(context).size.width * scale / 10;

  void changeComment() {
    setState(() {
      comment1 = "삐빅 틀렸습니다 ";
      comment2 = "(Hint : 한번만 눌러서 들어가려고?)";
      comment3 = "문제는 총 5문제입니다!!";
    });
  }

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
                onTap: changeComment,
                onDoubleTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const QuizScreen1()));
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
                comment1,
                style: TextStyle(
                  fontSize: mediaHeight(context, 0.4),
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                comment3,
                style: TextStyle(
                  fontSize: mediaHeight(context, 0.2),
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                comment2,
                style: TextStyle(
                  fontSize: mediaHeight(context, 0.2),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
