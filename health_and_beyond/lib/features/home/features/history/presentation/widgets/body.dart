import 'package:flutter/material.dart';
import 'package:health_and_beyond/core/resources/colors.dart';
import 'package:health_and_beyond/core/resources/dimensions.dart';
import 'package:health_and_beyond/core/resources/resources.dart';
import 'package:health_and_beyond/features/home/features/history/domain/entities/history_record.dart';

class HistoryBody extends StatelessWidget {
  final List<dynamic> jsonData;

  HistoryBody({required this.jsonData});

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final List<HistoryRecord> _recordList = _convertToRecordList(jsonData).reversed.toList();

    return Container(
      width: _size.width,
      margin: const EdgeInsets.all(AppDimensions.d8),
      color: AppColors.primaryColor,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        separatorBuilder: (context, index) {
          return Divider(color: AppColors.inactiveColor);
        },
        itemCount: _recordList.length,
        itemBuilder: (context, index) {
          final HistoryRecord historyRecord = _recordList[index];
          return Material(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.activeTabColor,
                child: Text(
                  (++index).toString(),
                  style: TextStyle(
                    color: AppColors.activeColor,
                    fontSize: AppDimensions.d18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              title: Text(
                historyRecord.name,
                style: AppStyles.textStyle.copyWith(
                  fontSize: AppDimensions.d18,
                ),
              ),
              subtitle: Text(
                'Dr. ' + historyRecord.drName,
                style: AppStyles.textStyle.copyWith(
                  fontSize: AppDimensions.d14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(
                historyRecord.date,
                style: AppStyles.textStyle.copyWith(
                  fontSize: AppDimensions.d14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {
                FocusScope.of(context).unfocus();
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(historyRecord.name),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(historyRecord.description.replaceAll('\<br\/>', '.')),
                          Text(historyRecord.prescription.replaceAll('\<br\/>', '.')),
                          Text(historyRecord.drName),
                          Text(historyRecord.date),
                        ],
                      ),
                      actions: [
                        TextButton(
                          child: Text('OK'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}

List<HistoryRecord> _convertToRecordList(List<dynamic> data) {
  return List.generate(
    data.length,
    (index) => HistoryRecord.toHistoryRecord(jsonData: data[index]),
  );
}
