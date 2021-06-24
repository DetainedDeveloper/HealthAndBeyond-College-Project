import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:health_and_beyond/core/requests/request_constants.dart';
import 'package:health_and_beyond/core/resources/colors.dart';
import 'package:health_and_beyond/core/resources/dimensions.dart';
import 'package:health_and_beyond/core/resources/resources.dart';
import 'package:health_and_beyond/core/resources/styles.dart';
import 'package:health_and_beyond/core/utils/random_color_generator.dart';
import 'package:health_and_beyond/features/home/features/dashboard/domain/entities/chart_data.dart';

class Chart extends StatefulWidget {
  final List<dynamic> data;
  final String type;

  Chart({required this.data, required this.type});

  @override
  _ChartState createState() => _ChartState(data: data, type: type);
}

class _ChartState extends State<Chart> {
  final List<dynamic> data;
  final String type;
  int touchedIndex = -1;

  _ChartState({required this.data, required this.type});

  List<PieChartSectionData> _getPieChartData(List<ChartData> data, List<double> percent, double width) {
    return List.generate(
      data.length,
      (index) => PieChartSectionData(
        value: percent[index],
        title: percent[index].toString() + '%',
        color: AppColors.chartSectionColors[index],
        radius: width / (index == touchedIndex ? 3 : 4),
        titleStyle: AppStyles.textStyle.copyWith(
          fontSize: AppDimensions.d14,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
        ),
        badgeWidget: index == touchedIndex
            ? Card(
                elevation: AppDimensions.d8,
                child: Padding(
                  padding: const EdgeInsets.all(AppDimensions.d8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        data[index].value.toString() + ' people have',
                        style: AppStyles.textStyle.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        data[index].name,
                        style: AppStyles.textStyle.copyWith(
                          fontSize: AppDimensions.d16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.chartSectionColors[index],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final List<ChartData> chartData = _convertToChartData(data);

    return Container(
      margin: const EdgeInsets.all(AppDimensions.d8),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.d8),
        ),
        elevation: AppDimensions.d8,
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.d16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(AppDimensions.d8),
                  child: Text(
                    AppStrings.diseasesIn + type,
                    style: AppStyles.textStyle.copyWith(
                      fontSize: AppDimensions.d24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.all(AppDimensions.d16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      chartData.length,
                      (index) => Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: AppDimensions.d18,
                            height: AppDimensions.d18,
                            margin: const EdgeInsets.only(left: AppDimensions.d16, right: AppDimensions.d8),
                            color: AppColors.chartSectionColors[index],
                          ),
                          Text(
                            chartData[index].name,
                            style: AppStyles.textStyle.copyWith(
                              fontSize: AppDimensions.d16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: _size.width / 1.5,
                height: _size.width / 1.5,
                margin: const EdgeInsets.all(AppDimensions.d8),
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (pieTouchResponse) {
                        setState(() {
                          final bool desiredTouch =
                              pieTouchResponse.touchInput is! PointerHoverEvent && pieTouchResponse.touchInput is! PointerUpEvent;
                          if (desiredTouch && pieTouchResponse.touchedSection != null) {
                            touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                          } else {
                            touchedIndex = -1;
                          }
                        });
                      },
                    ),
                    sections: _getPieChartData(chartData, _calculatePercentage(chartData), _size.width),
                    sectionsSpace: 2,
                    centerSpaceRadius: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<double> _calculatePercentage(List<ChartData> data) {
  int total = 0;
  for (int index = 0; index < data.length; index++) {
    total += data[index].value;
  }
  return List.generate(
    data.length,
    (index) => (((data[index].value) / total) * 100).roundToDouble(),
  );
}

List<ChartData> _convertToChartData(List<dynamic> data) {
  return List.generate(
    data.length,
    (index) => ChartData.toChartData(
      name: data[index][RequestConstants.name],
      value: int.parse(data[index][RequestConstants.value]),
    ),
  );
}
