import 'package:ecommerce_app/common/shared/base_usecase.dart';
import 'package:ecommerce_app/features/counter/data/models/counter_model.dart';

import '../repositories/counter_repository.dart';

class GetCounterUseCase
    implements BaseUseCase<CounterModel, Map<String, dynamic>> {
  final CounterRepository _counterRepository;
  GetCounterUseCase(this._counterRepository);

  @override
  Future<CounterModel> call(Map<String, dynamic> params) {
    return _counterRepository.getCounter();
  }
}
