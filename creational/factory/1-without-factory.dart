class RegistrationForm {
  void display() {
    print('Displaying Registration Form...');
  }

}

class ContactForm {
  void display() {
    print('Displaying Contact Form...');
  }

}

void main() {
  RegistrationForm regForm = RegistrationForm();
  regForm.display();

  ContactForm contactForm = ContactForm();
  contactForm.display();
}
