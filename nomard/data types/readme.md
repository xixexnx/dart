# 기본 자료형

대부분의 자료형들은 object로 이루어져있다.
부모 클래스를 상속받아 사용된다.

```dart
  String name = 'siyeong';
  bool alive = true;
  int age = 12;
  double money = 9.99;
```

대표적으로 `num Class`에서 `int Class`와 `double Class`가 파생된다.
만약, 숫자를 선언하고 싶을 때 int일지 double일지 모른다면 num으로 선언하자.

```dart
    int age = 12;
    double money = 9.99;

    num x = 12;
    x = 9.12;
```

# List

```dart
  var numbers = [1, 2, 3, 4]; // List<int>
  List<int> numbers1 = [1, 2, 3, 4];
```

# Collection if

조건에 따라 element를 추가할 수 있는 기능을 제공한다.

```dart
  var giveMeFive = true;
  var numbers = [
    1,
    2,
    3,
    4,
    if (giveMeFive) 5,
  ];
```

해당 코드는 `if(giveMeFive) numbers.add(5)`와 동일하다.

# Collection for

#### String interpolation

String interpolation이란, text에 변수를 추가하는 방법이다.
단순한 변수 사용법: `$변수명`
계산이 필요한 변수 사용법: `${변수및계산}`

```dart
  var name = 'a';
  var age = 12;
  var greeting = "hello, $name and ${age + 2}";

  print(greeting);  // hello, a and 14
```

이제 collection for 에 대해 알아보자.

```dart
  var oldF = ['a', 'b'];
  var newF = ['c', 'd', for (var f in oldF) "💖 $f"];
  print(newF);  // [c, d, 💖 a, 💖 b]
```

# map

map은 key value 쌍으로 이루어져있다.
만약 List<Map<String, Object>>와 같은 형태의 object를 생성할 때, 특정 형태를 지니고 있다면 Map 보다는 class를 생성하여 사용하기를 권장한다.

```dart
var player = {
    'name': 'a',
    'xp': 40,
    'super': false,
  };
```

# set

set과 list의 차이?
set의 elements는 유니크하지만 list의 elements는 중복이 가능하다.

```dart
 var numbers = {1, 2, 3, 4};
```
