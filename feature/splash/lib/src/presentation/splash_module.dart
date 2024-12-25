
import 'package:common_dependency/common_dependency.dart';

import 'pages/cubit/splash_cubit.dart';

class SplashModule{
  Future<void> call()async{
    // Cubit
    di.registerFactory<SplashCubit>(() => SplashCubit());
  }
}