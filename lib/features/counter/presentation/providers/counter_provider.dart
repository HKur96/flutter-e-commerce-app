import 'package:ecommerce_app/features/counter/data/models/counter_model.dart';
import 'package:flutter/foundation.dart';

class CounterProvider extends ChangeNotifier {
  CounterProvider();

  //initial state
  CounterModel _counterModel = CounterModel(count: 0);

  //getter
  CounterModel get counterModel => _counterModel;

  //fetch counter value
  Future<void> fetchCounter() async {
    // final count = getCounterUseCase.execute();

    // _counterModel = CounterModel(count: count.count);
    notifyListeners();
  }

  void incrementCounter() {
    int newCount = _counterModel.count + 1;
    //update initial state with the new count
    _counterModel = CounterModel(count: newCount);
    notifyListeners();
  }

  void decrementCounter() {
    int newCount = _counterModel.count - 1;
    //update initial state with the new count
    _counterModel = CounterModel(count: newCount);
    notifyListeners();
  }
}
