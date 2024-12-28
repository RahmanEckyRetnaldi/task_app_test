import 'package:common_dependency/common_dependency.dart';
import 'package:task/src/domain/entitiy/entitiy.dart';

part 'task_data_model.freezed.dart';
part 'task_data_model.g.dart';

@freezed
class TaskDataModel with _$TaskDataModel {
  const TaskDataModel._();

  const factory TaskDataModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? title,
    @JsonKey(name: 'color') String? description,
    @JsonKey(name: 'pantone_value') String? dueDate,
  }) = _TaskDataModel;

  factory TaskDataModel.fromJson(Map<String, dynamic> json) =>
      _$TaskDataModelFromJson(json);

  factory TaskDataModel.toModel(TaskItemEntity entity) {
    return TaskDataModel(
        id: entity.id.toIntOrDefault(),
        title: entity.title,
        description: entity.description,
        dueDate: entity.dueDate);
  }
}
