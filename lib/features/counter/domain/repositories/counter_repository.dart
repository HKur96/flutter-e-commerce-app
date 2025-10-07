import 'package:ecommerce_app/features/counter/data/models/counter_model.dart';

abstract class CounterRepository {
  Future<CounterModel> getCounter();
}
