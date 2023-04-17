# variable

## var

```dart
var name = '홍길동';
```

## int

```dart
int num = 10;
```

## double

```dart
double num = 2.5;
```

## boolean

```dart
bool isTrue = false;
```

## String

```dart
String str = '안녕하세요';
```

## var와 String의 차이?

`var`는 `=`의 오른쪽의 값을 통해서 형식을 유추한다.

## dynamic

어떤 타입이든 넣을 수 있음.

```dart
  dynamic name = '홍길동';
  print(name.runtimeType);  // String
```

## var와 dynamic의 차이?

```dart
  dynamic name = '홍길동';
  print(name.runtimeType);  // String
  name = 2;
  print(name.runtimeType);  // int

  var num = 1;
  print(name.runtimeType);  // int
  num = '2'; >> error
```

`var`는 처음 선언된 형식으로 형식이 고정되므로 추후에 다른 형식으로의 변환이 불가능하다.

`dynamic`은 형식에 상관없이 값이 변환될 수 있다.

---

# Nullalbe / Non-Nullable

## Nullalbe

Null일 가능성이 있다.
변수 명 뒤에 `?`를 작성하면 해당 변수가 Null이 될 수 있음을 명시하는 것이다.

메소드의 인자로 변수를 전달할 때 변수 명 뒤에 `!`를 작성하면 현재 전달하고자하는 변수가 Null이 아니라는 것을 명시하는 것이다.

## Non-Nullable

Null이 될 수 없다.

### Null이란?

아무런 값도 가지고 있지 않는 값.

```dart
  String name = '홍길동';
  name = null;  >> error

  String? name2 = '홍길순';
  name2 = null;
```

---

# final / const

## final와 const의 공통점

선언한 변수는 추후에 값 변경이 불가하다.
변수 타입을 지정하지 않아도 된다. (`var`역할 수행)

## final와 const의 차이점

`const`는 빌드 타임의 값을 알고 있어야한다.
`final`는 빌드 타임의 값을 알지 않아도 된다.

### 빌드타임이란?

프로그램이 빌드될 때의 시간

---

# Operation

## `??=`

변수의 값이 Null인 경우 오른쪽 값을 할당하고 Null이 아닌 경우 기존 값을 유지

## `is`

```dart
  print('a' is String);     // true
  print('a' is! String);    // false
```

---

# List

```dart
List<String> list = [];
```

순서가 있고 중복이 가능한 값들의 집합

## index

```dart
list[0];
```

# Map

키 : 값 쌍으로 이루어진 값들의 집합

## HashMap

순서가 없음.

## LinkedHashMap

순서가 있음.

# Set

순서가 있고 중복이 불가능한 값들의 집합

---

# function

## positional parameter

순서가 중요한 파라미터

## optional parameter

있어도 되고 없어도 되는 파라미터

```dart
addNum(int x, [int y = 0]){
    int sum = x + y;
}
```

optional 로 선언된 인자가 전달되지 않는 경우 빨간 줄이 생긴다.

해결법 1. `[int? y]`로 선언하기.
-> 그러나 `sum`을 계산할 때 숫자 + null 이 불가능하므로 에러 발생

해결법 2. `[int y = 0]`으로 기본값 부여하기.

## Named Parameter

순서가 중요하지 않은 파라미터

```dart
void main() {
  addNumbers(x: 1, y: 3);
}

addNumbers({required int x, required int y}) {
  print(x + y);
}

```

Named Parameter에서 인자에 `required`를 빼고 기본 값을 할당해주면 optional 하게 사용할 수 있다.

## arrow Function

`=>`을 사용하여 표현하는 방식

## typedef

```dart
typedef Operation = double Function(int x, int y);
```

리턴 타입과 인자 형식[시그니처]이 완전히 일치하는 경우

```dart
void main() {
  s operation = add;

  print(operation(1, 30));
}

typedef s = int Function(int x, int y);

int add(int x, int y) => x + y;
```

사용 예) 계산기