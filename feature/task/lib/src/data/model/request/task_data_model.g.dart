// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskDataModelImpl _$$TaskDataModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskDataModelImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['name'] as String?,
      description: json['color'] as String?,
      dueDate: json['pantone_value'] as String?,
    );

Map<String, dynamic> _$$TaskDataModelImplToJson(_$TaskDataModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.title,
      'color': instance.description,
      'pantone_value': instance.dueDate,
    };
