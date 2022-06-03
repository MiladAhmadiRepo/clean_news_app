import '../../domain/entities/source.dart';

class SourceModel extends Source {
  const SourceModel({
    required String id,
    required String name,
  }) : super(id: id, name: name);

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      id: json['id'] ??'0'as String,
      name: json['name']??'' as String,
    );
  }
}
