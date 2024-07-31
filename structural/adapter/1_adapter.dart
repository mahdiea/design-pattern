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

void main() {
  RestPaymentGateway restGateway = RestPaymentGateway();
  restGateway.processPayment("account123", 100.0);

  SoapPaymentGateway soapGateway = SoapPaymentGateway();
  soapGateway.makePayment("account123", 100.0);
}
