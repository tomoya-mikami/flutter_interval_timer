import 'dart:async';

class CounterBloc {
  final _counterController = StreamController<int>();
  int counter = 0;
  Timer? timer;

  Stream<int> get onCountDown => _counterController.stream;
  void stop() {
    timer?.cancel();
  }
  void restart() {
    startTimer();
  }

  CounterBloc() {
    counter = 60;
    startTimer();
  }

  void startTimer () {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      counter--;
      if (counter == 0) {
        counter = 60;
      }
      _counterController.sink.add(counter);
    });
  }

  void dispose() {
    _counterController.close();
  }
}
