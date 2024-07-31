class RestPaymentGateway {
  void processPayment(String account, double amount) {
    print("Processing payment of $amount for account $account using REST.");
  }
}

class SoapPaymentGateway {
  void makePayment(String account, double amount) {
    print("Processing payment of $amount for account $account using SOAP.");
  }
}

abstract class PaymentGateway {
  void processPayment(String account, double amount);
}

class RestPaymentAdapter implements PaymentGateway {
  final RestPaymentGateway _restGateway = RestPaymentGateway();

  @override
  void processPayment(String account, double amount) {
    _restGateway.processPayment(account, amount);
  }
}

class SoapPaymentAdapter implements PaymentGateway {
  final SoapPaymentGateway _soapGateway = SoapPaymentGateway();

  @override
  void processPayment(String account, double amount) {
    _soapGateway.makePayment(account, amount);
  }
}



void main() {
  PaymentGateway restAdapter = RestPaymentAdapter();
  restAdapter.processPayment("account123", 100.0);

  PaymentGateway soapAdapter = SoapPaymentAdapter();
  soapAdapter.processPayment("account123", 100.0);

}
