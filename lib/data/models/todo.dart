import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
class TodoApiModel with _$TodoApiModel {
  factory TodoApiModel({
    required final String title,
    required final bool completed,
  }) = _Todo;

  factory TodoApiModel.fromJson(Map<String, Object?> json) =>
      _$TodoApiModelFromJson(json);
}
