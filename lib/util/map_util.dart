import 'dart:math';

double calculateDistance(lat1, lon1, lat2, lon2) {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  double d = 12742 * asin(sqrt(a));
  // if (d > 1000) d = d / 1000;
  d += 0.400;
  return double.parse(d.toStringAsFixed(2));
}
