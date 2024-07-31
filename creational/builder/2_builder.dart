class User {
  String? firstName;
  String? lastName;
  String? email;
  int? age;

  User._builder(UserBuilder builder) {
    firstName = builder.firstName;
    lastName = builder.lastName;
    email = builder.email;
    age = builder.age;
  }
}

class UserBuilder {
  String? firstName;
  String? lastName;
  String? email;
  int? age;

  UserBuilder setFirstName(String firstName) {
    this.firstName = firstName;

    return this;
  }

  UserBuilder setLastName(String lastName) {
    this.lastName = lastName;
    return this;
  }

  UserBuilder setEmail(String email) {
    this.email = email;
    return this;
  }

  UserBuilder setAge(int age) {
    this.age = age;
    return this;
  }

  User build() {
    return User._builder(this);
  }
}

void main() {
  UserBuilder builder = UserBuilder();
  User user = builder
      .setFirstName('John')
      .setLastName('Doe')
      .setEmail('john.doe@example.com')
      .setAge(30)
      .build();

  print(
      'User details: FirstName: ${user.firstName}, LastName: ${user.lastName}, Email: ${user.email}, Age: ${user.age}');
}
