class DatabaseConnection {
  static final DatabaseConnection _instance = DatabaseConnection._internal();

  DatabaseConnection._internal() {
    print("ایجاد یک اتصال جدید به پایگاه داده");
  }

  static DatabaseConnection get instance => _instance;

  void query(String sql) {
    print("اجرای کوئری: $sql");
  }
}

void main() {
  var db1 = DatabaseConnection.instance;
  db1.query("SELECT * FROM users");

  var db2 = DatabaseConnection.instance;
  db2.query("SELECT * FROM products");

  var db3 = DatabaseConnection.instance;
  db3.query("SELECT * FROM orders");
}
