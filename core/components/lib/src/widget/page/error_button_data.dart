class ErrorButtonData {
  final String title;
  final Function()? onTap;

  ErrorButtonData({
    required this.title,
    this.onTap,
  });

  @override
  bool operator ==(Object other) {
    return other is ErrorButtonData &&
        other.title == title &&
        other.onTap == onTap;
  }

  @override
  int get hashCode {
    return title.hashCode ^ onTap.hashCode;
  }
}
