// 1. تعریف کاربر
class User {
  String name;
  List<String> followers = [];

  User(this.name);

  void addFollower(String follower) {
    followers.add(follower);
  }

  void removeFollower(String follower) {
    followers.remove(follower);
  }

  void post(String message) {
    print("$name پست جدیدی گذاشت: $message");
    notifyFollowers(message);
  }

  void notifyFollowers(String message) {
    for (var follower in followers) {
      print("$follower: اطلاعیه جدید - $message");
    }
  }
}

void main() {
  // ساختن کاربر
  var user = User("کاربر A");

  // اضافه کردن دنبال‌کنندگان به کاربر
  user.addFollower("دنبال‌کننده 1");
  user.addFollower("دنبال‌کننده 2");
 
  // پست جدید
  user.post("این اولین پست من است!");

  // حذف یکی از دنبال‌کنندگان
  user.removeFollower("دنبال‌کننده 2");

  // پست جدید
  user.post("این دومین پست من است!");
}
