import 'dart:async';

void main() {
  // Execute code after a delay
  Timer(Duration(seconds: 2), () {
    print('Timer completed after 2 seconds');
  });

  // Alternative syntax using Timer.run
  Timer.run(() {
    print('Executes as soon as possible');
  });

  // Create a periodic timer that fires every second
  Timer.periodic(Duration(seconds: 1), (timer) {
    print('Timer tick: ${timer.tick}');

    // Cancel after 5 ticks
    if (timer.tick >= 5) {
      timer.cancel();
    }
  });
}
