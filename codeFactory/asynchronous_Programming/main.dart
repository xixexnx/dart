import 'dart:async';

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
