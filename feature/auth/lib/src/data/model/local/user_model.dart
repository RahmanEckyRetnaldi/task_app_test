import 'package:common_dependency/common_dependency.dart';

part 'user_model.g.dart'; // Untuk Hive adapter

@HiveType(typeId: HiveAdapterKey.USER_ADAPTER_KEY)
@JsonSerializable(explicitToJson: true, anyMap: true)
class UserModel {
  @HiveField(0)
  @JsonKey(name: 'token')
  final String token;

  UserModel({required this.token});
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}