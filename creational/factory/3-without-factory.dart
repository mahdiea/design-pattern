class RegularUser {
  void showDetails() {
    print('Displaying Regular User details...');
  }
}

class AdminUser {
  void showDetails() {
    print('Displaying Admin User details...');
  }
}

void main() {
  RegularUser regUser = RegularUser();
  regUser.showDetails();

  AdminUser adminUser = AdminUser();
  adminUser.showDetails();
}
