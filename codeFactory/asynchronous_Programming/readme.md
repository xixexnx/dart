# Asynchronous Programming

Dart는 기본적으로 비동기 프로그래밍으로 수행된다.

## 동기 프로그래밍

```dart
void main() {
  // sync
  addNumbers(1, 1);
  addNumbers(2, 2);
}

void addNumbers(int number1, int number2) {
  print('계산중: $number1 + $number2');
  print('계산완료: $number1 + $number2');
}
```

```
계산중: 1 + 1
계산완료: 1 + 1
계산중: 2 + 2
계산완료: 2 + 2
```

순서대로 진행.

---

## 비동기 프로그래밍

```dart
void main(){
    addNumbers(1,1);
}
void addNumbers(int num1, int num2) {
  print('계산 시작: $num1 + $num2');
  Future.delayed(Duration(seconds: 2), () {
    print('계산 완료: ${num1 + num2}');
  });
  print('함수 완료');
}
```

```
계산 시작: 1 + 1
함수 완료
계산 완료: 2
```

---

### Future

리턴 값으로 하나의 값만 받을 수 있음.

#### .delayed()

첫번째 인자 -> 지연할 기간 `Duration()`
두번째 인자 -> 지연 후 실행할 함수

---

### aysnc - await

비동기 프로그래밍 상에서 동기 프로그래밍을 구현할 수 있음.

#### `async`

선언된 함수의 파라미터와 바디 사이에 `async` 키워드를 작성하여 사용함.

#### `await`

return 값으로 Feture 형식을 지니는 함수 앞에만 작성이 가능하다.
만약 void라면 `Future<void>`로 사용 가능.
동기적으로 사용할 코드 앞에 `await`를 작성하여 해당 코드의 결과를 기다리도록 함.

```dart
void main() async {
  await addNumbers(1, 1);
  addNumbers(2, 2);
}

Future<void> addNumbers(int num1, int num2) async {
  print('계산 시작: $num1 + $num2');
  await Future.delayed(Duration(seconds: 2), () {
    print('계산 완료: $num1 + $num2 = ${num1 + num2}');
  });
  print('함수 완료: $num1 + $num2');
}
```

```
계산 시작: 1 + 1
계산 완료: 1 + 1 = 2
함수 완료: 1 + 1
계산 시작: 2 + 2
계산 완료: 2 + 2 = 4
함수 완료: 2 + 2
```

---

### Stream

리턴 값으로 여러 값을 받아낼 수 있음.

Stream은 다트에서 기본적으로 제공하지 않기때문에 다트가 기본적으로 제공하는 패키지를 통해서 사용해야한다.

#### 스트림 생성

```dart
    final controller = StreamController();
    final stream_1 = controller.stream;
    final stream = controller.stream.asBroadcastStream();
```

`.stream`은 기본적으로 한 번만 리스닝할 수 있는 리소스가 생성된다.
`.stream.asBroadcastStream()`은 여러 리스너를 생성할 수 있다.

#### 리스너 생성

```dart
  final streamListener1 = stream.listen((val) {
    print('Listener1: $val');
  });

  final streamListener2 = stream.listen((val) {
    print('Listener2: $val');
  });
```

### Stream await 하기

`yield*` 를 사용하면 해당 스트림의 모든 값을 다 가져올 때까지 대기한다.

```dart
void main() {
  // calculate(1).listen((e) {
  //   print(e);
  // });

  palyAllStream().listen((val) => print(val));
}

Stream<int> palyAllStream() async* {
  yield* calculate(1);
  yield* calculate(1000);
}

Stream<int> calculate(int number) async* {
  for (int i = 0; i < 5; i++) {
    yield number * i;

    await Future.delayed(
      Duration(seconds: 1),
    );
  }
}
```

```
3
4
0
1000
2000
3000
4000
```
