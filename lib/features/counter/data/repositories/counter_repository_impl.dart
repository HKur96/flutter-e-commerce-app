import '../../domain/repositories/counter_repository.dart';
import '../datasources/counter_datasource.dart';
import '../models/counter_model.dart';

class CounterRepositoryImpl implements CounterRepository {
  final CounterDatasource counterDatasource;

  CounterRepositoryImpl(this.counterDatasource);

  @override
  Future<CounterModel> getCounter() {
    return counterDatasource.getCounter();
  }
}
