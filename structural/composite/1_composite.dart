class MenuItem {
  String name;
  double price;

  MenuItem(this.name, this.price);
}

class MenuCategory {
  String name;
  List<MenuItem> items = [];
  List<MenuCategory> subcategories = [];

  MenuCategory(this.name);

  void addItem(MenuItem item) {
    items.add(item);
  }

  void addSubcategory(MenuCategory category) {
    subcategories.add(category);
  }

  void display(String indent) {
    print('$indent+ Category: $name');
    for (var item in items) {
      print('$indent  - Item: ${item.name}, Price: \$${item.price}');
    }
    for (var subcategory in subcategories) {
      subcategory.display('$indent  ');
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
  hotDrinks.addItem(coffee);
  hotDrinks.addItem(tea);
  drinks.addSubcategory(hotDrinks);
  drinks.addSubcategory(coldDrinks);
  mainCourses.addItem(pizza);
  desserts.addItem(cake);

  // نمایش منو
  drinks.display('');
  mainCourses.display('');
  desserts.display('');
}
