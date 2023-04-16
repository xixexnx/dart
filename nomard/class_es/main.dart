class QuickRunner{
  void run(){
    print('run!');
  }
}

abstract class Human {
  final String name;
  Human(this.name);

  void walk() {
    print('Human walking...');
  }
}

enum Team { red, blue }

class Player extends Human with QuickRunner {
  // final String name;
  int xp;
  Team team;
  int age;

  Player({
    // required this.name,
    required String name,
    required this.xp,
    required this.team,
    required this.age,
  }): super(name);

  Player.createBluePlayer({
    required String name,
    required int age,
  })  : age = age,
        // name = name,
        team = Team.blue,
        xp = 0,
        super(name);

  Player.createRedPlayer(String name, int age)
      : this.age = age,
        // this.name = name,
        this.team = Team.red,
        this.xp = 0,
        super(name);

  void sayHello() {
    print("Hi, my name is $name, team: $team, age: $age, xp: $xp");
  }

  @override
  void walk() {
    super.walk();
    print("$name walking...");
  }
}

void main() {
  var player = Player(name: 'sy', xp: 1400, team: Team.red, age: 12);
  player.sayHello();
  var player2 = Player(name: 'gj', xp: 2400, team: Team.blue, age: 19);
  player2.sayHello();

  var player3 = Player.createBluePlayer(name: 'sy', age: 25);
  player3.sayHello();
  var player4 = Player.createRedPlayer('ki', 22);
  player4.sayHello();
  player4.walk();
  player4.run();
}
