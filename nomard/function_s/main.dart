String sayHello(String name) {
  return "Hello $name, nice to meet you!";
}

String sayHello1(String name) => "Hello $name, nice to meet you!";

num plus(num a, num b) => a + b;

String sayHello2({String name = 'kim', int age = 99, String country = 'en'}) {
  return "Hello $name, you are $age, and you come from $country";
}

String sayHello3(
    {required String name, required int age, required String country}) {
  return "Hello $name, you are $age, and you come from $country";
}

String sayHello4(String name, int age, [String? country = 'en']) =>
    "Hello $name, you are $age and $country";

String capitalizeNmae(String? name) => name?.toUpperCase() ?? 'ANON';
// name != null ? name.toUpperCase() : 'ANON';

//typedef
typedef ListOfInts = List<int>;
ListOfInts reserseListOfNumbers(ListOfInts list) {
  var reversed = list.reversed; // 역순
  return reversed.toList();
}

void main() {
  print(sayHello1("sy")); //Hello sy, nice to meet you!

  print(sayHello2(
      age: 12, name: 'sy')); //Hello sy, you are 12, and you come from en

  print(sayHello3(
      age: 12,
      name: '@sy',
      country: 'kor')); //Hello @sy, you are 12, and you come from kor

  print(sayHello4('sy', 12)); //Hello sy, you are 12 and en

  capitalizeNmae('sy');
  capitalizeNmae(null);

  String? name1;
  name1 ??= 'notnull';
  print(name1);

  print(reserseListOfNumbers([1, 2, 3]));
}
