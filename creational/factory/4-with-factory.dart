abstract class User {
  void showDetails();
}

class RegularUser implements User {
  @override
  void showDetails() {
    print('Displaying Regular User details...');
  }
}

class AdminUser implements User {
  @override
  void showDetails() {
    print('Displaying Admin User details...');
  }
}

class UserFactory {
  User? getUser(String userType) {
    switch (userType) {
      case 'REGULAR':
        return RegularUser();
      case 'ADMIN':
        return AdminUser();
      default:
        return null;
    }
  }
}

void main() {
  UserFactory userFactory = UserFactory();

  User? regUser = userFactory.getUser('REGULAR');
  regUser?.showDetails();

  User? adminUser = userFactory.getUser('ADMIN');
  adminUser?.showDetails();
}
