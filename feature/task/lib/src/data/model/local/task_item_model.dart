import 'package:common_dependency/common_dependency.dart';

part 'task_item_model.g.dart';

@HiveType(typeId: HiveAdapterKey.TASK_ADAPTER_KEY)
@JsonSerializable(explicitToJson: true, anyMap: true)
class TaskItemModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String dueDate;

  @HiveField(4)
  final bool isSynced;

  @HiveField(5)
  final String status;

  TaskItemModel({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    this.isSynced = false,
    this.status = 'Pending',
  });

  TaskItemModel copyWith({
    String? id,
    String? title,
    String? description,
    String? dueDate,
    bool? isSynced,
    String? status,
  }) {
    return TaskItemModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      isSynced: isSynced ?? this.isSynced,
      status: status ?? this.status,
    );
  }

  factory TaskItemModel.fromJson(Map<String, dynamic> json) =>
      _$TaskItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskItemModelToJson(this);
}


