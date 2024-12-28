import 'package:common_dependency/common_dependency.dart';
import 'package:task/src/data/data.dart';
import 'package:task/src/data/model/request/task_data_model.dart';

import '../../domain/entitiy/entitiy.dart';

extension TaskDataMapper on TaskDataModel {
  TaskItemEntity toEntity() {
    return TaskItemEntity(
      id: (this.id ?? 0).toString(),
      title: title.orEmpty(),
      description: description.orEmpty(),
      dueDate: dueDate.orEmpty(),
      status: TaskStatus.Pending,
    );
  }
}

extension TaskItenModelMapper on TaskItemModel{
  TaskItemEntity toEntity() {
    return TaskItemEntity(
      id: this.id.orEmpty(),
      title: title.orEmpty(),
      description: description.orEmpty(),
      dueDate: dueDate,
      status: switch(status){
        'Pending' => TaskStatus.Pending,
        'InProgress' => TaskStatus.InProgress,
        'Completed' => TaskStatus.Completed,
        String() => TaskStatus.Pending,
      },
    );
  }
}

extension TaskItemEntityMapper on TaskItemEntity {
  TaskDataModel toModel() {
    return TaskDataModel(
      id: this.id.isEmpty ? null : this.id.toIntOrDefault(),
      title: title,
      description: description,
      dueDate: dueDate,
    );
  }

  TaskItemModel toModelLocal() {
    return TaskItemModel(
      id: this.id,
      title: title,
      description: description,
      dueDate: dueDate,
      status: switch(status){
        TaskStatus.Pending => TaskStatus.Pending.name,
        TaskStatus.InProgress => TaskStatus.InProgress.name,
        TaskStatus.Completed => TaskStatus.Completed.name
      },
    );
  }
}