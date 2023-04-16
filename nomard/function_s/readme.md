# 함수

만약 return 값이 있고 복잡하지 않은 단순한 한 줄짜리의 함수가 있다면 람다식에서 사용되는 표현법을 사용하여 리턴을 수행할 수 있다.

```dart
String sayHello(String name) {
  return "Hello $name, nice to meet you!";
}

String sayHello1(String name) => "Hello $name, nice to meet you!";
```

좋은 예시로 두 숫자를 더하는 함수를 작성해보자.

```dart
num plus(num a, num b) => a + b;
```

## Named Parameters

여러 파라미터를 받아야하는 함수의 경우, 함수를 호출할 때 작성하는 파라미터의 순서가 헷갈릴 수 있다.
또한 파라미터가 의미하는 것을 파악하기 힘들다.
그러한 이유로 `sayHello2('sy', 26, 'kor')` 식으로 작성하는 것은 바람직하지 않다.

이러한 것을 개선하기 위해서 named parameters가 도움될 것이다.
named parameters는 단순히 순서를 기억하는 것이 아닌 인자들의 이름과 함께 값을 전달한다.
여기서 중요한 것은 각 값들의 타입일 뿐이다.

사용하기 위한 준비 단계가 있다.

- 해당 함수에 인자들을 중괄호로 감싸서 선언해야한다.
  `String sayHello2({String name, int age, String country})`
- Null Safety를 걱정하는 다트를 안심시켜야한다.
  1. 인자의 기본 값을 지정해준다.
  2. required 또는 modifier를 지정해준다. 이것은 해당 함수가 호출될 때 required 또는 modifier가 지정된 변수가 꼭 필요함을 알리는 도구이다.

```dart
// 1번째 방법
String sayHello2({String name = 'kim', int age = 99, String country = 'en'}) {
  return "Hello $name, you are $age, and you come from $country";
}

// 2번째 방법
String sayHello3({
  required String name,
  required int age,
  required String country
  }) {
  return "Hello $name, you are $age, and you come from $country";
}

void main() {
  print(sayHello2(
    age: 12,
    name: 'sy',
    country: 'kor'
  ));
  print(sayHello3(age: 12));
  /*
    Hello sy, you are 12, and you come from kor
    Hello @sy, you are 12, and you come from kor
  */
}
```

## Optional Positional Parameters

positional parameter는 순서에 맞춰서 입력해야한다.
named parameter는 인자 명을 함께 작성해야한다.

optional positional parameter는 named parameter 방식을 사용하면서 부분적으로 인자를 입력하고 싶을 때 사용하는 방식이다.

```dart
String sayHello4(String name, int age, [String? country = 'en']) => "Hello $name, you are $age and $country";

void main(){
    print(sayHello4('sy', 12)); // Hello sy, you are 12 and en
}
```

옵션으로 사용하고 싶은 인자를 `대괄호`로 감싸고 null일 수도 있음을 표현하는 `?`를 붙여주고 `기본 값`을 설정해준다.

**만약 기본 값을 설정하지 않는다면 ?**
`Hello sy, you are 12 and null`이 출력된다.

## QQ Operator

`??` : 좌항이 null 일 경우, 우항을 반환, 그렇지 않다면 좌항을 반환함.
`??=` : 좌항이 null 일 경우, 우항을 좌항에 대입한다.
사용자가 함수의 인자에 null을 보내게 하고 싶다면 null 체크를 수행해야한다.
입력받은 인자를 `.toUpperCase()`를 사용해 리턴하는 함수가 있다고 생각하자.
이것은 삼항연산자를 사용하여 `name != null ? name.toUpperCase() : 'ANON';`와 같이 표현할 수 있다.

이것을 qq operator를 사용하면 더 짧아질 수 있다.
`name?.toUpperCase() ?? 'ANON`

## typedef
자료형이 헷갈릴 때 별칭 생성
그러나 구조화된 형식을 지정할 땐 class 생성하는 것을 추천한다.
```dart
typedef ListOfInts = List<int>;
ListOfInts reserseListOfNumbers(ListOfInts list) {
  var reversed = list.reversed; // 역순
  return reversed.toList();
}
void main(){
    print(reserseListOfNumbers([1,2,3]));   //[3, 2, 1]
}
```
