import 'package:flutter/material.dart';

late int imageNumber;

// ignore: must_be_immutable
class EndScreen extends StatelessWidget {
  EndScreen({super.key});

  static int count = 0;
  double mediaHeight(BuildContext context, double scale) =>
      MediaQuery.of(context).size.height * scale / 10;
  double mediaWidth(BuildContext context, double scale) =>
      MediaQuery.of(context).size.width * scale / 10;

  String comment = "점수를 보여주세요!! 소정의 상품을 드립니다~~!!";
  void determine() {
    switch (count) {
      case 0:
      case 1:
      case 2:
      case 3:
        imageNumber = 1;
        comment = "보안 공부를 조금이라도 해보시는것을 추천해요!!";
        break;
      case 4:
      case 5:
      case 6:
      case 7:
        imageNumber = 3;
        comment = "나쁘지않아요!! 점수를 보여주시면 소정의 상품을 드러요!!";
        break;
      case 8:
      case 9:
      case 10:
        imageNumber = 5;
        comment = "축하드려요!! 점수를 보여주시면 소정의 상품을 드러요!!";
        break;
      default:
        imageNumber = 5;
        comment = "축하드려요!! 점수를 보여주시면 소정의 상품을 드러요!!";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    determine();
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: mediaHeight(context, 1),
            horizontal: mediaWidth(context, 1)),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: mediaHeight(context, 1),
              ),
              Text(
                "본인의 점수는...??",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: mediaHeight(context, 0.2),
                ),
              ),
              SizedBox(
                height: mediaHeight(context, 0.3),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "$count",
                    style: TextStyle(
                      fontSize: mediaHeight(context, 1),
                    ),
                  ),
                  SizedBox(
                    width: mediaHeight(context, 0.05),
                  ),
                  Text(
                    "점",
                    style: TextStyle(
                        fontSize: mediaHeight(context, 0.2),
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              SizedBox(
                height: mediaHeight(context, 0.8),
              ),
              Image.asset(
                "asset/$imageNumber.png",
                height: mediaHeight(context, 3),
              ),
              SizedBox(
                height: mediaHeight(context, 0.1),
              ),
              Text(
                comment,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: mediaHeight(context, 0.2)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
