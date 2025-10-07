import '../../domain/entities/counter_entity.dart';

class CounterModel extends CounterEntity {
  CounterModel({required super.count});

  //parse data toJson fromJson
  factory CounterModel.fromJson(Map<String, dynamic> json) {
    return CounterModel(count: json['count']);
  }
}
