void main() {
  // 변수
  // 1. var 키워드 사용
  var num = 1;

  // 2. 타입 명시
  int number = 1;

  // 상수
  final finalNum = 'a';

  // dynamic Type
  dynamic dynamicType;
  dynamicType = 1;
  dynamicType = 'a';

  // 사용 시 꼭 타입 확인 필요
  if (dynamicType is int) {
    // ...
  }

  // const
  const constNum = 1;

  // Null saftly
  String? nullableNum = 'null';
  nullableNum = null;

  if (nullableNum != null) {
    // ...
  }
  // or
  nullableNum?.isEmpty;
}
