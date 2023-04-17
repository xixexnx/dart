# 객체 지향 프로그래밍
모든 클래스의 최상위 부모는 `Object` 클래스이다.
클래스를 생성할 때 `extends Object`가 생략된 것과 같기 때문에 빈 메서드를 생성해도 `runtimeType`과 같은 메서드를 사용할 수 있다.

---

## const

빌드 시점에 값을 알고 있는 경우 사용 가능
추후에 값 수정 불가능
값이 완벽하게 동일한 인스턴스 2개 생성 시 `const`일 경우, 같은 인스턴스로 취급

---

## constructor

### 기본 생성자

```dart
 Idol(this.name, this.members);
```

### positional parameter 방식

```dart
positional parameter
  Idol(String name, List<String> members)
      : this.name = name,
        this.members = members;
```

### named parameter 방식

```dart
Idol({
    required this.name,
    required this.membersCnt,
  });
```

```dart
Idol.fromList(List values)
      : this.members = values[0],
        this.name = values[1];
```

## getter / setter

### getter

값을 가져오는 용도

```dart
// 사용법
blackPink.firstMember;

// 선언
String get firstMember {
    return this.members[0];
}
```

### setter

값을 세팅하는 용도
그러나 List의 경우 `final`로 선언되었다고 해도 그 안의 요소를 바꿀 수 있다는 점에서 현대에서 잘 사용되지 않음.

```dart
// 사용법
blackPink.firstMember = '지슈';

// 선언
void set firstMember(String name) {
    this.members[0] = name;
}
```

---

## private

사용법: `_변수명`
private가 선언된 파일 내에서만 해당 요소를 사용할 수 있음.

---

## inheritance, 상속

부모 클래스의 모든 속성을 자식 클래스가 상속받음.

### extends

```dart
class BoyGroup extends Idol {
  BoyGroup(
    String name,
    int membersCnt,
  ) : super(
          name: name,
          membersCnt: membersCnt,
        );
}
```

자식 클래스에 사용하는 문법
`class 자식 클래스명 extends 부모 클래스명`
자식 클래스의 생성자를 생성할 때는 부모 클래스의 규격을 맞춰 작성해줘야하며 `super`키워드를 사용하여 부모 클래스의 생성자를 가르킨다.

부모 클래스에 선언되어있는 메서드를 자식 클래스에서 사용할 수 있다.

자식 클래스에만 존재하는 단독 메서드 사용 가능하다.

### Type Comparison

```dart
bts is Idol;    // true
```

---

## Method Overriding

상속받은 메서드를 새로 정의하는 행위
단, 메서드의 이름이 동일해야한다.

### 부모 클래스의 메서드를 살리면서 새로운 기능 추가하기

```dart
@override
int calculate(){
    return super.calculate * 2;
    // 부모 메서드의 calculate()함수를 실행한 결과에 곱하기 2 수행
}
```

---

## static

`static`은 `인스턴스`에 귀속되지 않고 `클래스`에 귀속된다.

```dart
    static String? building;
    String name;
```

에서 `name`은 `인스턴스`에 귀속되며,
`building`은 `클래스`에 귀속된다.

---

## interface

메서드를 구현하지 않고 자식 클래스에서 해당 메서드를 구현하도록 강제하는 역할을 함.

## abstract

추상화 라는 의미.
특정 인터페이스 앞에 `abstract`를 선언한 경우, 해당 클래스를 선언하여 사용할 수 없음.
또한 메서드를 구현하도록 강제하는 코드에서 `{}`를 제외해도 됨.

---

## generic

타입을 외부에서 받을 때 사용

```dart
void main() {
  Lecture<String> lecture1 = Lecture('id', 'name');
  lecture1.printType(); // String
  Lecture<int> lecture2 = Lecture(123, 'name');
  lecture2.printType(); // int
}

class Lecture<T> {  // 개수는 상관없음.
  final T id;
  final String name;

  Lecture(this.id, this.name);

  void printType() {
    print(id.runtimeType);
  }
}
```

---
