# 플러터가 다트를 선택한 이유?

- just-in-time 컴파일과 ahead-of-time 컴파일을 지원 -> 모바일 개발 환경에서 좋음
- 둘 다 구글이 만들었다. 최적화 하기 좋음. 플러터 맞춤형 다트

# Dart의 특징

객체 지향 언어
일부러 세미콜론을 작성하지 않는 경우가 있음

# 변수

변수 생성 방법

- var name = '아무개';
  다트에서 알아서 타입을 읽어옴.

- String name = '아무개';
  명시적으로 타입을 선언

두 생성 방법이 사용되는 지점의 차이는?

- var를 사용
  관습적으로 함수나 메소드 내부에 **지역 변수**를 선언

- 명시적 타입 지정
  class에서 변수나 property 선언

# dynamic 변수

변수를 선언할 때 값을 넣지 않고 `var name;` 또는 `dynamic name;`으로 선언한 경우
후에 다양한 타입의 값을 넣는 것이 가능하다.

#### 왜 필요할까?

- 변수가 어떤 타입인지 알기 어려운 경우
- dynamic으로 돌아가는 게 유용한 경우

#### dynamic 변수를 사용할 때 다트가 해주는 것

if문을 사용하여 dynamic 변수의 타입을 확인했다면 해당 블럭에서는 변수의 타입에 사용할 수 있는 메서드들을 불러와준다.

**dynamic 변수는 이상적으로 사용하는 것을 피해야하며 절대적으로 필요한 경우에만 사용해야한다.**

# Null 참조 방지
```dart
    String? name = 'a';
    name = null;
```
타입명 뒤에 `?`를 붙여 해당 변수가 Null일 수 있음을 명시

```dart
if(name != null){
    name.isNotEmpty;
}

name?.length;
```
null을 확인하는 절차를 거쳐야함.
`name?.length` 와 같이 `?`을 작성하면 null 체크 후 `.`뒤에 오는 메서드를 실행함. 

# final
한 번만 선언될 수 있는 상수이다. 
```dart
final name = '길동';
```

# late
`final`이나 `var`앞에 붙여줄 수 있는 수식어 
초기 데이터 없이 변수를 선언할 수 있게 한다.
`late`를 선언하면 dart에서 해당 변수에 값이 들어가기 전에는 해당 변수를 참조하지 못하게 한다.

# const
Dart에서의 const는 `compile-time constant`를 의미한다.
`final`과 동일하게 동작한다. 수정이 불가능하다.
그러나 const는 final과 다르게 **컴파일 당시 알고 있는 값을 사용하는 것**이다. 

const 사용 불가능 한 예
ex) API 로 통해 받아오는 불명확한 값, 사용자 입력 값 등

const 사용 가능 예
ex) max_allowed_price 