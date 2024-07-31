// 1. تعریف معلم (موضوع)
class Teacher {
  List<Student> _students = [];

  void addStudent(Student student) {
    _students.add(student);
  }

  void removeStudent(Student student) {
    _students.remove(student);
  }

  void announceResults(String results) {
    for (var student in _students) {
      student.update(results);
    }
  }
}

// 2. تعریف دانش‌آموزان (مشترکین)
abstract class Student {
  void update(String results);
}

// 3. یک دانش‌آموز خاص
class ConcreteStudent implements Student {
  final String name;

  ConcreteStudent(this.name);

  @override
  void update(String results) {
    print("$name: نتایج را دریافت کردم - $results");
  }
}

// استفاده از الگوی Observer در کد
void main() {
  var teacher = Teacher();

  var studentA = ConcreteStudent("دانش‌آموز A");
  var studentB = ConcreteStudent("دانش‌آموز B");

  // اضافه کردن دانش‌آموزان به لیست معلم
  teacher.addStudent(studentA);
  teacher.addStudent(studentB);

  // اعلام نتایج
  teacher.announceResults("نتایج مسابقه نقاشی: نفر اول دانش‌آموز A");

  // حذف یکی از دانش‌آموزان
  teacher.removeStudent(studentB);

  // دوباره اعلام نتایج
  teacher.announceResults("نتایج جدید مسابقه: نفر اول دانش‌آموز A");
}
