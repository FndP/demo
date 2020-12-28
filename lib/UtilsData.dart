import 'package:flutter/cupertino.dart';

class UtilsData with ChangeNotifier {
  int _counterValue = 0;

  int get counterValue => _counterValue;

  set counterValue(int val) {
    _counterValue = val;
    notifyListeners();
  }

  int _counterValue2 = 0;

  int get counterValue2 => _counterValue2;

  set counterValue2(int val) {
    _counterValue2 = val;
    notifyListeners();
  }

  int _counterValue3 = 0;

  int get counterValue3 => _counterValue3;

  set counterValue3(int val) {
    _counterValue3 = val;
    notifyListeners();
  }
}