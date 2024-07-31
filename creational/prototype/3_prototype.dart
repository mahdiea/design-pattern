abstract class Cloneable {
  Cloneable clone();
}

class Enemy implements Cloneable {
  String type;
  int health;
  int attackPower;

  Enemy(this.type, this.health, this.attackPower);

  @override
  Enemy clone() {
    return Enemy(type, health, attackPower);
  }

  @override
  String toString() {
    return 'Enemy(type: $type, health: $health, attackPower: $attackPower)';
  }
}

void main() {
  Enemy originalEnemy = Enemy('Goblin', 100, 15);

  Enemy clonedEnemy = originalEnemy.clone();

  clonedEnemy.health = 80;
  clonedEnemy.attackPower = 20;

  print('Original Enemy: $originalEnemy');
  print('Cloned Enemy: $clonedEnemy');
}
