class Singleton {
  static final Singleton _instance = Singleton._internal();

  Singleton._internal();

  static Singleton get instance => _instance;

  void methodA() {
    print('این یک متد در کلاس Singleton است');
  }
}

void main() {
  Singleton singleton1 = Singleton.instance;
  Singleton singleton2 = Singleton.instance;

  print(singleton1 == singleton2);

  singleton1.methodA();

}