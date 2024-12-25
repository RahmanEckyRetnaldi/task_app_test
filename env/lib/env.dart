import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '../.env')
abstract class Env {
  const Env._();
  @EnviedField(varName: 'BASE_URL')
  static const String baseUrl = _Env.baseUrl;

}
