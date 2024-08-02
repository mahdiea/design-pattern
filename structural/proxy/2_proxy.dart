abstract class Cinema {
  void buyTicket(DateTime currentTime);
}

class RealCinema implements Cinema {
  @override
  void buyTicket(DateTime currentTime) {
    print('Ticket purchased successfully.');
  }
}

class CinemaProxy implements Cinema {
  final RealCinema _realCinema;
  final DateTime _startAccessTime;
  final DateTime _endAccessTime;

  CinemaProxy(this._realCinema, this._startAccessTime, this._endAccessTime);

  bool _isAccessAllowed(DateTime currentTime) {
    return currentTime.isAfter(_startAccessTime) && currentTime.isBefore(_endAccessTime);
  }

  @override
  void buyTicket(DateTime currentTime) {
    if (_isAccessAllowed(currentTime)) {
      _realCinema.buyTicket(currentTime);
    } else {
      print('Cinema is closed. Please come back during business hours.');
    }
  }
}

void main() {

  final startAccessTime = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 9);
  final endAccessTime = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 17);

  final realCinema = RealCinema();
  final cinemaProxy = CinemaProxy(realCinema, startAccessTime, endAccessTime);


  final currentTimeDuringBusinessHours = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 10);
  cinemaProxy.buyTicket(currentTimeDuringBusinessHours);


  final currentTimeOutsideBusinessHours = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 18);
  cinemaProxy.buyTicket(currentTimeOutsideBusinessHours);
}
