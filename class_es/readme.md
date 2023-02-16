# Class

class의 property는 타입을 명시해주어야한다.

## 생성

```dart
class Player {
  final String name = 'sy';
  int xp = 1000;
}

void main() {
  var player = Player();

}
```

main에서 player 객체를 생성할 때 `new`를 굳이 안써도 된다.

## method 생성

```dart
class Player {
  final String name = 'sy';
  int xp = 1000;

  void sayHello() {
    print("Hi, my name is $name");  // this 미사용
  }
}
```

Class method 내에서 `this`를 사용하지 않는 것이 권장된다.
다만, method내에 `name`이라는 변수가 있는 경우 class의 `name`에 접근하기 위해서는 `this.name`을 사용해야한다.

## Named Constructor Parameters

```dart
Player(String name, int xp){
    this.name = name;
    this.xp = xp;
}
```

처럼 작성하는 것을 조금 더 간결하게 작성해보자.

```dart
Player(this.name, this.xp);
```

이 방법은 위치가 중요하다. 마치 `positional parameters`방식과 유사하다.
하지만 이런 방법은 클래스가 큰 경우 통제하기 힘들 수 있다.

이 방법은 named parameters와 유사하게 만드려면 어떻게 할까?
똑같다.

1. 생성자의 매개변수를 중괄호로 감싼다.
2. null satefy를 위해 기본 값을 지정해주거나 파라미터에 `required`를 작성한다.

## Named Constructors

만약 xp값이 0인 블루팀의 플레이어를 생성하고자 한다면 아래와 같이 생성자 메서드를 작성할 수 있다.
`:`는 Player 클래스를 초기화한다.

```dart
  Player.createBluePlayer({
    required String name,
    required int age,
  })  : this.age = age,
        this.name = name,
        this.team = 'blue',
        this.xp = 0;
```

## Cascade Notation

```dart
var player = Player(name: 'sy', xp: 1200, team: 'red')
..name = 'gj';
```

`..name`은 `player.name`과 같다.
즉, `.`은 위에 선언된 객체를 의미한다.
앞으로 플러터를 사용하면서 자주 만나게 될 문법이다.

## Enums

개발자들의 실수를 줄여줄 수 있다는 장점을 지닌다.

```dart
enum Team { red, blue }
```

팀에 대해 열거형을 사용한다면, 위에 작성하였던 객체의 `String team`을 `Team team`으로 수정하고 선언할 때에도 `Team.blue`와 같은 형태로 작성하여야한다.


## Abstract Classes
```dart
abstract class Human {
  void walk();
}

```

만약 추상화 클래스의 메소드에서 내용이 작성되지 않았다면 해당 클래스를 상속받는 자식 클래스는 해당 메소드를 무조건 구현하여야한다.

추상 클래스에서 메소드 내용이 구현되어있다면 자식 클래스에서 구현하지 않아도 되지만 다시 재정의가 가능하다.



## 상속
자식 클래스에서 부모 클래스의 프로퍼티나 메소드를 사용하기 위해서는 `super`키워드를 사용할 수 있다.
```dart
abstract class Human {
  void walk() {
    print('Human walking...');
  }
}
```
부모 클래스에서 `walk()`라는 메소드를 정의하였다. 

```dart
  @override
  void walk() {
    super.walk();
    print("$name walking...");
  }
```
자식 클래스에서 `walk()`클래스를 재정의한 것이다. 부모 클래스에서 구현된 내용을 갈아엎는 것이 아닌 추가하는 것이기 때문에 `super.walk()`를 작성하여 부모 클래스에 구현된 코드를 실행할 수 있다.


## Mixin
**생성자가 없는 클래스**를 의미한다.
`extends`가 아닌 `with`로 선언한다.
만약 상속받는 클래스가 있다면 `with`를 뒤에 작성해주어야한다.
여러 클래스에서 재사용할 수 있다는 장점을 지닌다.
프로퍼티나 메소드를 단순하게 추가하는 기능으로 자주 사용된다.