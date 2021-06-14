import 'dart:async';

class ThorottleStringHelper {
  String? _passText;

  final int maxTimerValue = 5;
  int timerValue = 0;
  ThorottleStringHelper() {
    onSetMaxValue();
  }

  void onDelayTouch(String text, Function(String text) onComplete) {
    _passText = text;
    if (timerValue == maxTimerValue) {
      Timer.periodic(Duration(milliseconds: 100), (timer) {
        timerValue--;

        if (timerValue == 0) {
          onComplete(_passText!);
          timer.cancel();
          onSetMaxValue();
        }
      });
    } else {
      onSetMaxNearValue();
    }
  }

  void onSetMaxValue() {
    timerValue = maxTimerValue;
  }

  void onSetMaxNearValue() {
    timerValue = maxTimerValue - 1;
  }
}
