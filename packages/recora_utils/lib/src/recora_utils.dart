import 'dart:math';

/// {@template num_abbreviated_number}
/// Returns a number as thousands, millions, billions
/// E.g. 1246 => 1.2k
/// {@endtemplate}
extension NumAbbreviatedNumber on num {
  /// {@macro num_abbreviated_number}
  String get abbreviated {
    final units = ['k', 'm', 'b', 't'];
    final decPlaces = pow(10, 1);
    var result = toDouble();

    for (var i = units.length - 1; i >= 0; i--) {
      final size = pow(10, (i + 1) * 3);

      if (size <= result) {
        result = (result * decPlaces / size).round() / decPlaces;

        if ((result == 1000) && (i < units.length - 1)) {
          result = 1;
          i++;
        }

        return '$result${units[i]}';
      }
    }

    return truncate().toString();
  }
}
