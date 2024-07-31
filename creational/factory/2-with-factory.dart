abstract class Form {
  void display();
}

class RegistrationForm implements Form {
  @override
  void display() {
    print('Displaying Registration Form ...');
  }
}

class ContactForm implements Form {
  @override
  void display() {
    print('Displaying Contact Form...');
  }
}

class FormFactory {
  Form? getForm(String formType) {
    switch (formType) {
      case 'REGISTRATION':
        return RegistrationForm();
      case 'CONTACT':
        return ContactForm();
      default:
        return null;
    }
  }
}

void main() {
  FormFactory formFactory = FormFactory();

  Form? regForm = formFactory.getForm('boss');
  regForm?.display();

  Form? contactForm = formFactory.getForm('npc');
  contactForm?.display();
}
