extension StringExtension on String {
  String toCapitalize() => "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalize()).join(' ');
}