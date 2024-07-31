// 1. تعریف Subject (کاربر)
class User {
  String name;
  List<Follower> _followers = [];

  User(this.name);

  void addFollower(Follower follower) {
    _followers.add(follower);
  }

  void removeFollower(Follower follower) {
    _followers.remove(follower);
  }

  void post(String message) {
    print("$name پست جدیدی گذاشت: $message");
    notifyFollowers(message);
  }

  void notifyFollowers(String message) {
    for (var follower in _followers) {
      follower.update(message);
    }
  }
}

// 2. تعریف Observer (دنبال‌کننده)
abstract class Follower {
  void update(String message);
}

// 3. یک دنبال‌کننده خاص
class ConcreteFollower implements Follower {
  String name;

  ConcreteFollower(this.name);

  @override
  void update(String message) {
    print("$name: اطلاعیه جدید - $message");
  }
}

void main() {
  // ساختن کاربران
  var user = User("کاربر A");

  // ساختن دنبال‌کنندگان
  var follower1 = ConcreteFollower("دنبال‌کننده 1");
  var follower2 = ConcreteFollower("دنبال‌کننده 2");

  // اضافه کردن دنبال‌کنندگان به کاربر
  user.addFollower(follower1);
  user.addFollower(follower2);

  // پست جدید
  user.post("این اولین پست من است!");

  // حذف یکی از دنبال‌کنندگان
  user.removeFollower(follower2);

  // پست جدید
  user.post("این دومین پست من است!");
}
