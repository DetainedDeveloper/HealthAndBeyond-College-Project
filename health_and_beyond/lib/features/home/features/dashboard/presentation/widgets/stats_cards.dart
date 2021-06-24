import 'package:flutter/material.dart';
import 'package:health_and_beyond/core/resources/dimensions.dart';
import 'package:health_and_beyond/core/resources/resources.dart';

class StatsCards extends StatelessWidget {
  final Map<String, dynamic> data;

  StatsCards({required this.data});

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final List<dynamic> statsList = data.values.toList();
    final List<IconData> _icons = <IconData>[
      Icons.people_outline,
      Icons.people_outline,
      Icons.article_outlined,
      Icons.event_note,
    ];

    return Container(
      width: _size.width,
      margin: const EdgeInsets.all(AppDimensions.d8),
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: AppStrings.statsTypes.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimensions.d8),
            ),
            color: AppColors.statsCardColors[index],
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.d8),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: AppDimensions.d16,
                        ),
                        child: Icon(
                          _icons[index],
                          size: AppDimensions.d64,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            statsList[index].toString(),
                            style: AppStyles.textStyle.copyWith(
                              fontSize: AppDimensions.d48,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          Text(
                            AppStrings.statsTypes[index],
                            style: AppStyles.textStyle.copyWith(
                              fontSize: AppDimensions.d16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
