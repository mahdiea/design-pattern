import 'dart:math';

//ConcreteFlyweight
class SoldierType {
  final String uniformColor;
  final String weapon;

  SoldierType(this.uniformColor, this.weapon);

  void draw(double x, double y) {
    print(
        'Drawing a soldier at ($x, $y) with uniform color $uniformColor and weapon $weapon');
  }
}

//FlyweightFactory
class SoldierFactory {
  static   Map<String, SoldierType> soldierTypes = {};

  static SoldierType getSoldierType(String uniformColor, String weapon) {
    final key = '$uniformColor-$weapon';
    if (!soldierTypes.containsKey(key)) {
      soldierTypes[key] = SoldierType(uniformColor, weapon);
      print(soldierTypes);
    }
    return soldierTypes[key]!;
  }
}

//Client
class Soldier {
  final double x;
  final double y;
  final SoldierType type;

  Soldier(this.x, this.y, this.type);

  void draw() {
    type.draw(x, y);
  }
}

//Client
class Army {
  final List<Soldier> soldiers = [];

  void addSoldier(double x, double y, String uniformColor, String weapon) {
    final type = SoldierFactory.getSoldierType(uniformColor, weapon);
    final soldier = Soldier(x, y, type);
    soldiers.add(soldier);
  }

  void draw() {
    for (var soldier in soldiers) {
      soldier.draw();
    }
  }
}

//Client
void main() {
  final army = Army();
  final random = Random();
  final colors = ['Green', 'Red', 'Blue', 'Yellow'];
  final weapons = ['Rifle', 'Pistol', 'Shotgun', 'Sniper'];
  for (int i = 0; i < 100000; i++) {
    double x = random.nextDouble() * 100;
    double y = random.nextDouble() * 100;
    String uniformColor = colors[random.nextInt(colors.length)];
    String weapon = weapons[random.nextInt(weapons.length)];

    army.addSoldier(x, y, uniformColor, weapon);
  }

  army.draw();
}
