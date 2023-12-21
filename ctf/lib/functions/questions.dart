import 'dart:math';

class Questions {
  int questionsNum =
      10; // 문제의 갯수를 조정하고싶으면 아래있는 questionsNum = question.length; 이것을 지우세요 그리고 이 변수에 직접 값을 적으세요
  static Set<int> uniqueNumbers = <int>{}; //
  static List<int> myOrder = [];
  Map<int, String> question = {
    1: "Zero-Day Exploit은 이미 알려진 취약점을 이용하는 공격 기술이다.",
    2: "4계층은 네트워크계층이다.",
    3: "10.252.42.122는 공인ip이다.",
    4: "리눅스 메모리 구조 상 Date Sagment 영역에서는 동적할당되는 배열이 저장된다.",
    5: "카나리(Canary)는 DDoS를 막기위한 보호기법이다.",
    6: "brute foce는 무차별 대입 공격으로, 사용자가 입력할 수 있는 모든 값을 입력하는 것이다.",
    7: "SFP의 크기는 6byte이다.",
    8: "192.168.0.1/24 의 서브넷마스크 주소는 255.255.255.128이다.",
    9: "HTTPS는 데이터를 암호화한다.",
    10: "Malware 는 백신 소프트웨어를 의미한다.",
    11: "벨-라파듈라 모델은 오직 기밀성을 강조하는 군사용 보안 정책이다.",
    12: "보안의 3 요소는 무결성,가용성,기밀성 이다.",
    13: "친구 컴퓨터를 갑자기 꺼버리는 것은 해킹이라고 볼 수 있다.",
    14: "CSRF는 client side request forgery의 약자이다.",
    15: "설정된 버퍼의 공간을 침범하여 입력값을 받으면 버퍼 오버 플로우(buffer over flow)가 발생할 수 있다."
  };
  Map<int, bool> answer = {
    1: false,
    2: false,
    3: false,
    4: false,
    5: false,
    6: true,
    7: false,
    8: false,
    9: true,
    10: false,
    11: true,
    12: true,
    13: true,
    14: false,
    15: true,
  };

  Questions() {
    Order();
  }
  // ignore: non_constant_identifier_names
  void Order() {
    while (uniqueNumbers.length < questionsNum) {
      int num = Random().nextInt(questionsNum) + 1;
      uniqueNumbers.add(num);
    }
    myOrder = uniqueNumbers.toList();
  }
}
