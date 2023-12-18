import 'dart:math';

class Questions {
  int questionsNum =
      0; // 문제의 갯수를 조정하고싶으면 아래있는 questionsNum = question.length; 이것을 지우세요 그리고 이 변수에 직접 값을 적으세요
  static Set<int> uniqueNumbers = <int>{}; //
  static List<int> myOrder = [];
  Map<int, String> question = {
    1: "Zero-Day Exploit은 이미 알려진 취약점을 이용하는 공격 기술이다.",
    2: "4계층은 네트워크계층이다.",
    3: "10.252.42.122는 공인ip이다.",
    4: "리눅스 메모리에서 데이터는 동적할당되는 배열이 저장된다.",
    5: "카나리(Canary)는 DDoS을 막기위한 방법이 아니다.",
    6: "주은이는 사이버보안을 나간다.",
    7: "SFP의 크기는 6byte이다."
  };
  Map<int, bool> answer = {
    1: false,
    2: false,
    3: false,
    4: false,
    5: true,
    6: true,
    7: false,
  };

  Questions() {
    Order();
  }
  // ignore: non_constant_identifier_names
  void Order() {
    questionsNum = question.length; // 만약 문제의 갯수를 조정하고싶으면 이것을 지우세요
    while (uniqueNumbers.length < questionsNum) {
      int num = Random().nextInt(questionsNum) + 1;
      uniqueNumbers.add(num);
    }
    myOrder = uniqueNumbers.toList();
  }
}
