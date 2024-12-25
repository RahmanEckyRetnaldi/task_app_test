
import 'package:common_dependency/common_dependency.dart';

extension ListExtension<T> on List<T> {
  void insertSeparator({
    required T separator,
    T Function(T child)? itemBuilder,
  }) {
    final newList = expandIndexed(
          (index, element) => [
        if (index > 0) separator,
        itemBuilder?.call(element) ?? element,
      ],
    ).toList();
    clear();
    addAll(newList);
  }

}