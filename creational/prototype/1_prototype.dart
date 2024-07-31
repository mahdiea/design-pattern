class Car {
  String model;
  String color;
  double price;

  Car(this.model, this.color, this.price);

  @override
  String toString() {
    return 'Car(model: $model, color: $color, price: $price)';
  }
}

void main() {

  Car originalCar = Car('Pride Model 111', 'white', 3000);

  Car clonedCar = Car(originalCar.model, 'Blue', originalCar.price);

  print('Original Car: $originalCar');
  print('Cloned Car: $clonedCar');
}
