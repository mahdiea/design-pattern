class User {
  String firstName;
  String lastName;
  String email;
  int age;

  User(this.firstName, this.lastName, this.email, this.age);
}

void main() {


  User user = User('john', 'Doe', 'john.doe@example.com', 32);
  print(
      'User details: FirstName: ${user.firstName}, LastName: ${user.lastName}, Email: ${user.email}, Age: ${user.age}');
}
