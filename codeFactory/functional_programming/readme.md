# Functional Programming

functional Programming을 하는 이유?

- 코드의 간결성
- 코드 체이닝

주의해야할 점

- 가독성

## Iterable

List <-> Map <-> Set 간의 형변환에 유동적인 형식

## List

## Map

### `List.map()`

List to Map

```dart
void main() {
  List<String> blackPink = ['리사', '제니'];

  print(blackPink.map((x) {
    return '블랙핑크 $x';
  }));

  print(blackPink.map((x) => '블랙핑크 $x'));
}
```

`.map()` 메서드는 함수를 인자로 필요로하며, 그 함수는 하나의 인자를 필요로한다.
인자는 List의 요소가 차례로 들어오고, `return` 값은 해당 요소의 순번에 맞게 저장된다.

List 자체가 변경되는 것이 아닌 `새로운 List`를 반환한다는 점을 유의해야한다.

```dart
void main() {
  String number = '13579';

  final parsed = number.split('').map((e) => '$e.jpg');

  print(parsed.toList()); //[1.jpg, 3.jpg, 5.jpg, 7.jpg, 9.jpg]
}
```

### `.map()`

Map to Map
`MapEntry`

```dart
void main() {
  Map<String, String> person = {
    '홍길동': '서울',
    '홍길순': '부산',
    '전우치': '김해',
  };

  print(person.map(
    (key, value) => MapEntry('사람이름 $key', '지역 $value'),
  ));
    //{사람이름 홍길동: 지역 서울, 사람이름 홍길순: 지역 부산, 사람이름 전우치: 지역 김해}
}
```

키 값만 리스트로 만들어보기

```dart
final keys = person.keys.map(
    (e) => '사람이름 $e',
  ).toList();

  print(keys);
```

## Set

중복 제거

Set to Set

```dart
void main() {
  Set blackPinkSet = {'로제', '지수'};

  final newSet = blackPinkSet
      .map(
        (e) => '블랙핑크 $e',
      )
      .toSet();
  print(newSet);    //{블랙핑크 로제, 블랙핑크 지수}
}

```

### List / Map / Set 간의 형변환

```dart
void main() {
  List<String> blackPink = ['리사', '제니'];

  print(blackPink);         //[리사, 제니]
  print(blackPink.asMap()); //{0: 리사, 1: 제니}
  print(blackPink.toSet()); //{리사, 제니}

  Map blackPinkMap = blackPink.asMap();
  print(blackPinkMap.keys.toList());    //[0, 1]
  print(blackPinkMap.values.toList());  //[리사, 제니]

  //Set blackPinkSet = blackPink.toSet();
  Set blackPinkSet = Set.from(blackPink);
  print(blackPinkSet.toList()); //[리사, 제니]
}
```

---

## .where()

`.where()`은 함수를 인자로 받으며 해당 함수는 하나의 인자를 필요로 한다.
리스트의 각 요소에 접근하며 조건문에 따라 true일 경우 저장, false일 경우 삭제하여 새로운 리스트를 생성한다.

```dart
void main() {
  List<Map<String, String>> people = [
    {
      'name': '지수',
      'group': '블랙핑크',
    },
    {
      'name': '로제',
      'group': '블랙핑크',
    },
    {
      'name': 'RM',
      'group': 'BTS',
    },
  ];

  print(people);
    //[{name: 지수, group: 블랙핑크}, {name: 로제, group: 블랙핑크}, {name: RM, group: BTS}]
  print(people.where((e) => e['group'] == '블랙핑크'));
    //({name: 지수, group: 블랙핑크}, {name: 로제, group: 블랙핑크})
}
```

---

## .reduce()

```dart
void main() {
  List<int> numbers = [1, 3, 5, 7, 9];

  numbers.reduce((prev, next) {
    print('====');
    print('prev : $prev');
    print('next : $next');
    print('total : ${prev + next}');
    return prev + next;
  });
}
```

```
====
prev : 1
next : 3
total : 4
====
prev : 4
next : 5
total : 9
====
```

이전 loop의 return 값을 다음 loop의 첫번째 인자(prev)로 활용하는 함수

`.reduce()`를 사용하지 못하는 경우
return 되는 값이 기본 값을 가져오는 형식과 동일해야한다.

---

## .fold()

`.reduce()`와 유사하나 단점을 보완한 기능

```dart
void main() {
  List<int> numbers = [1, 3, 5, 7, 9];

  final sum = numbers.fold<int>(0, (prev, next) => prev + next);
  print(sum);
}
```

List<String>의 요소들의 글자 길이를 더하는 경우 reduce()로는 불가능하지만 fold로는 가능하다.

---

## Cascading Operator

`...`

```dart
void main() {
  List<int> even = [2, 4, 6, 8];
  List<int> odd = [1, 3, 5, 7];

  print([even, odd]);
    // [[2, 4, 6, 8], [1, 3, 5, 7]]
  print([...even, ...odd]);
    // [2, 4, 6, 8, 1, 3, 5, 7]
}
```
