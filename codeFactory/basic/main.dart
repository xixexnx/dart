void main() {
  s operation = add;

  print(operation(1, 30));
}

typedef s = int Function(int x, int y);

int add(int x, int y) => x + y;
