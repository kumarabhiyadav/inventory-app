double calculatePercentageDifference(double oldValue, double newValue) {
  double difference = (newValue - oldValue).abs();
  double percentage = (difference / oldValue) * 100;
  return percentage;
}

double calculateNumberWithPercentage(double baseNumber, double percentage) {
  return baseNumber + (baseNumber * percentage / 100);
}
