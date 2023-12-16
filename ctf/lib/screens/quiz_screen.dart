import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  String selectO = "O";
  String selectX = "X";
  String answer = "";
  bool choice = false;
  bool oSelected = false;
  bool xSelected = false;
  bool tapOne = false;

  void changeOX({required bool determine}) {
    setState(() {
      if (!oSelected && !xSelected) {
        selectO = determine ? "O(color)" : "O";
        selectX = determine ? "X" : "X(color)";
        tapOne = true;
      }
    });
  }

  void answerOX({required bool wc}) {
    setState(() {
      if (oSelected || xSelected) {
        // 이미 선택된 경우 무시
        return;
      }

      selectO = "O(color)";
      selectX = "X";
      oSelected = true;
      xSelected = false;

      choice = true;
      answer = wc ? "정답입니다!!" : "오답입니다 ㅠㅠ";
      tapOne == false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Text(
                "첫번째 문제!!",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 50,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Zero-Day Exploit은 이미 알려진 취약점을 이용하는 공격 기술이다.",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              if (choice)
                Text(
                  answer,
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                )
              else
                const Text(""),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => changeOX(determine: true),
                    onDoubleTap: oSelected ? null : () => answerOX(wc: true),
                    child: Image.asset(
                      'asset/$selectO.png',
                      height: 150,
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.black,
                    ),
                    width: 5,
                    height: 300,
                  ),
                  GestureDetector(
                    onTap: () => changeOX(determine: false),
                    onDoubleTap: xSelected ? null : () => answerOX(wc: false),
                    child: Image.asset(
                      'asset/$selectX.png',
                      height: 150,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              if (tapOne == true)
                const Text(
                  "정답을 선택하시려면 더블탭하세요..!!",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              const SizedBox(height: 50),
              if (choice)
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    width: 200,
                    height: 50,
                    child: const Center(
                      child: Text(
                        "다음",
                        style: TextStyle(
                          fontSize: 20,
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
