import '../models/counter_model.dart';

class CounterDatasource {
  Future<CounterModel> getCounter() async {
    return await CounterModel(count: 5);
  }
}
