
import 'package:common_dependency/common_dependency.dart';

part 'task_item_entity.freezed.dart';

@freezed
class TaskItemEntity with _$TaskItemEntity {
  const factory TaskItemEntity ({
    @Default('') String title,
    @Default('') String description,
    @Default('') String dueDate,
    @Default(TaskStatus.Pending) TaskStatus status,
  }) = _TaskItemEntity;

}

enum TaskStatus{
  Pending, InProgress, Completed
}