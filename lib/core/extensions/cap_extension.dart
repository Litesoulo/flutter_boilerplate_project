extension CapExtension on String {
  String get capitalize => '${this[0].toUpperCase()}${this.substring(1)}';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.capitalize).join(' ');
}
