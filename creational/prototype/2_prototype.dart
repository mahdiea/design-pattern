abstract class Cloneable {
  Cloneable clone();
}

class Car implements Cloneable {
  String model;
  String color;
  double price;

  Car(this.model, this.color, this.price);

  @override
  Car clone() {
    return Car(model, color, price);
  }

  @override
  String toString() {
    return 'Car(model: $model, color: $color, price: $price)';
  }
}

void main() {
  Car originalCar = Car('Pride Model 111', 'white', 3000);

  Car clonedCar = originalCar.clone();

  clonedCar.color = 'Blue';

  print('Original Car: $originalCar');
  print('Cloned Car: $clonedCar');
}
