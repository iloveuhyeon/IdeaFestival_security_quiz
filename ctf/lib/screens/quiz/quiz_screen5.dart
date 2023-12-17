import 'package:ctf/screens/end_screen.dart';
import 'package:flutter/material.dart';

class QuizScreen5 extends StatefulWidget {
  const QuizScreen5({Key? key}) : super(key: key);

  @override
  State<QuizScreen5> createState() => _QuizScreen5State();
}

class _QuizScreen5State extends State<QuizScreen5> {
  String selectO = "O";
  String selectX = "X";
  bool tapOne = false;
  bool choice = false;
  bool oSelected = false;
  bool xSelected = false;
  bool answer = false;
  Color redcolor = Colors.red;
  Color bluecolor = Colors.blue;

  double mediaHeight(BuildContext context, double scale) =>
      MediaQuery.of(context).size.height * scale / 10;
  double mediaWidth(BuildContext context, double scale) =>
      MediaQuery.of(context).size.width * scale / 10;

  void changeOX({required bool determine}) {
    setState(() {
      if (xSelected || oSelected) return;
      selectO = determine ? "O(color)" : "O";
      selectX = determine ? "X" : "X(color)";
      tapOne = true;
    });
  }

  void answerOX({required bool answer, determine}) {
    setState(() {
      selectO = determine ? "O(color)" : "O";
      selectX = determine ? "X" : "X(color)";
      answer ? EndScreen.count++ : null;
      this.answer = answer;
      oSelected = true;
      xSelected = false;
      choice = true;
      tapOne = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(Image.asset('asset/O(color).png').image, context);
    precacheImage(Image.asset('asset/X(color).png').image, context);
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: mediaHeight(context, 0.8),
          horizontal: mediaWidth(context, 0.5),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: mediaHeight(context, 0.5)),
              Text(
                "다섯번째 문제!!",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: mediaHeight(context, 0.6),
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: mediaHeight(context, 0.2)),
              Text(
                "카나리(Canary)는 DDoS을 막기위한 방법이 아니다.",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: mediaHeight(context, 0.28),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: mediaHeight(context, 0.3)),
              if (choice)
                Text(
                  answer ? "정답입니다!!" : "오답입니다ㅜㅜ",
                  style: TextStyle(
                    fontSize: mediaHeight(context, 0.4),
                    color: answer ? bluecolor : redcolor,
                    fontWeight: FontWeight.w600,
                  ),
                )
              else
                const Text(""),
              SizedBox(height: mediaHeight(context, 0.2)),
              OX(
                context,
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
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => EndScreen()));
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

  Row OX(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => changeOX(determine: true),
          onDoubleTap:
              oSelected ? null : () => answerOX(answer: true, determine: true),
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
          onTap: () => changeOX(determine: false),
          onDoubleTap: xSelected
              ? null
              : () => answerOX(answer: false, determine: false),
          child: Image.asset(
            'asset/$selectX.png',
            height: mediaHeight(context, 1.8),
          ),
        ),
      ],
    );
  }
}
