import 'package:ctf/functions/questions.dart';
import 'package:ctf/screens/end_screen.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  String selectO = "O";
  String selectX = "X";
  bool tapOne = false;
  bool choice = false;
  bool answerSelect = false;
  static int count = 1;
  bool? answer = Questions().answer[Questions.myOrder[count - 1]];

  double mediaHeight(BuildContext context, double value) =>
      MediaQuery.of(context).size.height * value / 10;
  double mediaWidth(BuildContext context, double value) =>
      MediaQuery.of(context).size.width * value / 10;

  void onTap(bool select) {
    setState(() {
      if (choice) return;
      selectO = select ? "O(color)" : "O";
      selectX = select ? "X" : "X(color)";
      tapOne = true;
    });
  }

  void doubleTap(bool determine) {
    setState(
      () {
        if (choice) return;
        if (determine == answer) {
          EndScreen.count++;
          answerSelect = true;
        }
        choice = true;
        selectO = determine ? "O(color)" : "O";
        selectX = determine ? "X" : "X(color)";
        tapOne = false;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(Image.asset('asset/O(color).png').image, context);
    precacheImage(Image.asset('asset/X(color).png').image, context);
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Padding(
        padding: EdgeInsets.only(
          top: mediaHeight(context, 0.8),
          left: mediaWidth(context, 0.5),
          right: mediaWidth(context, 0.5),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: mediaHeight(context, 0.5)),
              Text(
                "$count번 문제!!",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: mediaHeight(context, 0.6),
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: mediaHeight(context, 0.2)),
              Text(
                "${Questions().question[Questions.myOrder[count - 1]]}",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: mediaHeight(context, 0.28),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: mediaHeight(context, 0.3)),
              Text(
                choice
                    ? answerSelect
                        ? "정답입니다!!"
                        : "오답입니다ㅜㅜ"
                    : "",
                style: TextStyle(
                  fontSize: mediaHeight(context, 0.4),
                  color: answerSelect ? Colors.blue : Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: mediaHeight(context, 0.2)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      onTap(true);
                    },
                    onDoubleTap: () {
                      doubleTap(true);
                    },
                    child: Image.asset(
                      'asset/$selectO.png',
                      height: mediaHeight(context, 1.8),
                    ),
                  ),
                  SizedBox(width: mediaWidth(context, 0.3)),
                  Container(
                    color: Colors.black,
                    width: mediaWidth(context, 0.08),
                    height: mediaHeight(context, 3.5),
                  ),
                  SizedBox(width: mediaWidth(context, 0.3)),
                  GestureDetector(
                    onTap: () {
                      onTap(false);
                    },
                    onDoubleTap: () {
                      doubleTap(false);
                    },
                    child: Image.asset(
                      'asset/$selectX.png',
                      height: mediaHeight(context, 1.8),
                    ),
                  ),
                ],
              ),
              SizedBox(height: mediaHeight(context, 0.3)),
              if (tapOne)
                Text(
                  "정답을 선택하시려면 더블탭하세요..!!",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: mediaHeight(context, 0.2),
                  ),
                  textAlign: TextAlign.center,
                ),
              SizedBox(height: mediaHeight(context, 0.5)),
              if (choice)
                InkWell(
                  onTap: () {
                    if (count == Questions().questionsNum) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EndScreen(),
                        ),
                      );
                    } else {
                      count++;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const QuizScreen(),
                        ),
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: mediaWidth(context, 7),
                    height: mediaHeight(context, 0.8),
                    child: Center(
                      child: Text(
                        "다음",
                        style: TextStyle(
                          fontSize: mediaHeight(context, 0.3),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
