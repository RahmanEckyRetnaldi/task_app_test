// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskItemModelAdapter extends TypeAdapter<TaskItemModel> {
  @override
  final int typeId = 1;

  @override
  TaskItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskItemModel(
      id: fields[0] as String,
      title: fields[1] as String,
      description: fields[2] as String,
      dueDate: fields[3] as String,
      isSynced: fields[4] as bool,
      status: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TaskItemModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.dueDate)
      ..writeByte(4)
      ..write(obj.isSynced)
      ..writeByte(5)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskItemModel _$TaskItemModelFromJson(Map json) => TaskItemModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      dueDate: json['dueDate'] as String,
      isSynced: json['isSynced'] as bool? ?? false,
      status: json['status'] as String? ?? 'Pending',
    );

Map<String, dynamic> _$TaskItemModelToJson(TaskItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'dueDate': instance.dueDate,
      'isSynced': instance.isSynced,
      'status': instance.status,
    };
