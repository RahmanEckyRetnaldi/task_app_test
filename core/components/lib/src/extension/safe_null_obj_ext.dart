extension StringOrEmpty on String? {
  bool get isFilled => this != null && this!.isNotEmpty;

  bool get isNullOrEmpty => this == null || this!.isEmpty;

  String orEmpty([String defaultValue = '']) {
    return this ?? defaultValue;
  }

  String orDefault(String defaultValue) {
    return isNullOrEmpty ? defaultValue : this!;
  }

  String? nullWhenEmpty() {
    return isNullOrEmpty ? null : this!;
  }

  List<String> toList() {
    return orEmpty().split(',');
  }

  bool? equals(String? other) {
    return isNullOrEmpty ? null : this == other;
  }

  int toIntOrDefault({int defaultValue = 0}) {
    return isNullOrEmpty ? defaultValue : int.parse(this!);
  }
}
