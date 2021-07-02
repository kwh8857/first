import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int count = 0;
  int step = 1;
  int get _step => step;
  add() {
    count++;
  }

  stepupdate() {
    step++;
    notifyListeners();
  }

  stepchange() {
    step--;
    notifyListeners();
  }
}
