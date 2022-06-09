extension PRDStringExtension on String {
  String capitalize() {
    if (this.trim() == '') {
      return this;
    }
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
