class ChartData {
  final String name;
  final int value;

  ChartData({required this.name, required this.value});

  factory ChartData.toChartData({required String name, required int value}) {
    return ChartData(
      name: name,
      value: value,
    );
  }
}
