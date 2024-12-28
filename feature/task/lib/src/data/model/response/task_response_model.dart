import 'package:freezed_annotation/freezed_annotation.dart';

import '../request/task_data_model.dart';

part 'task_response_model.freezed.dart';
part 'task_response_model.g.dart';

@freezed
class TaskResponseModel with _$TaskResponseModel {
  const factory TaskResponseModel ({
    @JsonKey(name: 'page') int? page,
    @JsonKey(name: 'per_page') int? perPage,
    @JsonKey(name: 'total') int? total,
    @JsonKey(name: 'total_pages') int? totalPages,
    @JsonKey(name: 'data') List<TaskDataModel>? data
  }) = _TaskResponseModel;

  factory TaskResponseModel.fromJson(Map<String, dynamic> json) =>
    _$TaskResponseModelFromJson(json);
}