class DatabaseConnection {
  DatabaseConnection() {
    print("ایجاد یک اتصال جدید به پایگاه داده");
  }

  void query(String sql) {
    print("اجرای کوئری: $sql");
  }
}

void main() {
  var db1 = DatabaseConnection();
  db1.query("SELECT * FROM users");

  var db2 = DatabaseConnection();
  db2.query("SELECT * FROM products");

  var db3 = DatabaseConnection();
  db3.query("SELECT * FROM orders");

}
