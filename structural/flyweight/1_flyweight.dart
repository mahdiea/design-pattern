import 'dart:math';

class Soldier {
  final double x;
  final double y;
  final String uniformColor;
  final String weapon;

  Soldier(this.x, this.y, this.uniformColor, this.weapon);

  void draw() {
    print('Drawing a soldier at ($x, $y) with uniform color $uniformColor and weapon $weapon');
  }
}


class Army {
  final List<Soldier> soldiers = [];

  void addSoldier(double x, double y, String uniformColor, String weapon) {
    final soldier = Soldier(x, y, uniformColor, weapon);
    soldiers.add(soldier);
  }

  void draw() {
    for (var soldier in soldiers) {
      soldier.draw();
    }
  }
}


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

  print('Soldiers created: ${army.soldiers.length}');
  army.draw();
}

