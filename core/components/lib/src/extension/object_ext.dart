extension ObjectExt<T> on T {
  R ktLet<R>(R Function(T it) op) => op(this);
  T ktApply(Function(T it) op) {
    op(this);
    return this;
  }
}