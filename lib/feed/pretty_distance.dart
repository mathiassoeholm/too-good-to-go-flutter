String prettyDistance(num distance) {
  if (distance >= 1000) {
    var stringNum = (distance.round() / 1000).toStringAsFixed(1);
    stringNum = stringNum.replaceAll('.0', '');

    return '$stringNum km';
  } else {
    return '${distance.round()} m';
  }
}