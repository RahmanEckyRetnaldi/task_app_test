import 'package:common_dependency/common_dependency.dart';

import 'base_page_state.dart';

mixin BasePageListener<STATE extends BasePageState> on BlocBase<STATE> {
  clearErrorState();
}
