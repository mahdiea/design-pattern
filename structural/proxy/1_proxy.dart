class Cinema {
  final DateTime startAccessTime;
  final DateTime endAccessTime;

  Cinema(this.startAccessTime, this.endAccessTime);

  bool _isAccessAllowed(DateTime currentTime) {
    return currentTime.isAfter(startAccessTime) && currentTime.isBefore(endAccessTime);
  }


  void buyTicket(DateTime currentTime) {
    if (_isAccessAllowed(currentTime)) {
      print('Ticket purchased successfully.');
    } else {
      print('Cinema is closed. Please come back during business hours.');
    }
  }
}

void main() {

  final startAccessTime = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 9);
  final endAccessTime = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 17);

  final cinema = Cinema(startAccessTime, endAccessTime);


  final currentTimeDuringBusinessHours = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 10);
  cinema.buyTicket(currentTimeDuringBusinessHours);


  final currentTimeOutsideBusinessHours = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 18);
  cinema.buyTicket(currentTimeOutsideBusinessHours);
}
