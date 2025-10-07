import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int id;
  final String name;
  final String? iconUrl;
  final String? slug;

  const Category(
    {
      required this.id,
      required this.name,
      required this.iconUrl,
      required this.slug,
    }
  );

  @override
  List<Object?> get props => [id, name, iconUrl, slug];
}
