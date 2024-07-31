// Component
abstract class MenuComponent {
  String getName();
  double getPrice();
  void display(String indent);
}

// Leaf
class MenuItem extends MenuComponent {
  String _name;
  double _price;

  MenuItem(this._name, this._price);

  @override
  String getName() => _name;

  @override
  double getPrice() => _price;

  @override
  void display(String indent) {
    print('$indent- Item: $_name, Price: \$$_price');
  }
}

// Composite
class MenuCategory extends MenuComponent {
  String _name;
  List<MenuComponent> _children = [];

  MenuCategory(this._name);

  void add(MenuComponent component) {
    _children.add(component);
  }

  void remove(MenuComponent component) {
    _children.remove(component);
  }

  @override
  String getName() => _name;

  @override
  double getPrice() {
    double total = 0.0;
    for (var child in _children) {
      total += child.getPrice();
    }
    return total;
  }

  @override
  void display(String indent) {
    print('$indent+ Category: $_name');
    for (var child in _children) {
      child.display('$indent  ');
    }
  }
}

void main() {
  // ساخت آیتم‌های منو
  MenuItem coffee = MenuItem('Coffee', 3.0);
  MenuItem tea = MenuItem('Tea', 2.5);
  MenuItem pizza = MenuItem('Pizza', 12.0);
  MenuItem cake = MenuItem('Cake', 4.5);

  // ساخت دسته‌بندی‌ها
  MenuCategory drinks = MenuCategory('Drinks');
  MenuCategory hotDrinks = MenuCategory('Hot Drinks');
  MenuCategory coldDrinks = MenuCategory('Cold Drinks');
  MenuCategory mainCourses = MenuCategory('Main Courses');
  MenuCategory desserts = MenuCategory('Desserts');

  // اضافه کردن آیتم‌ها به دسته‌بندی‌ها
  hotDrinks.add(coffee);
  hotDrinks.add(tea);
  drinks.add(hotDrinks);
  drinks.add(coldDrinks);
  mainCourses.add(pizza);
  desserts.add(cake);

  // نمایش منو
  drinks.display('');
  mainCourses.display('');
  desserts.display('');
}
