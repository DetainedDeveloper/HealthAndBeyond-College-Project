// ignore: import_of_legacy_library_into_null_safe
import 'dart:convert';

// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:health_and_beyond/core/errors/failure.dart';
import 'package:health_and_beyond/core/requests/request_constants.dart';
import 'package:health_and_beyond/core/resources/strings.dart';
import 'package:health_and_beyond/features/core/widgets/display_message.dart';
import 'package:health_and_beyond/features/core/widgets/progress.dart';
import 'package:health_and_beyond/features/home/features/history/data/data_sources/history_data_remote_source.dart';
import 'package:health_and_beyond/features/home/features/history/data/models/history_object_model.dart';
import 'package:health_and_beyond/features/home/features/history/data/repositories/history_repository_impl.dart';
import 'package:health_and_beyond/features/home/features/history/domain/entities/history_data.dart';
import 'package:health_and_beyond/features/home/features/history/domain/usecases/history_usecase.dart';
import 'package:health_and_beyond/features/home/features/history/presentation/widgets/body.dart';

class HistoryBase extends StatelessWidget {
  final String uid, type;
  final GetPatientHistory _getPatientHistory = GetPatientHistory(
    historyRepository: HistoryRepositoryImpl(
      historyDataRemoteSource: HistoryDataRemoteSourceImpl(),
    ),
  );

  HistoryBase({required this.uid, required this.type});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Either<Failure, HistoryData>>(
      future: _getPatientHistory.execute(
        historyObject: HistoryObjectModel(
          uid: uid,
          type: type,
        ),
      ),
      builder: (context, data) {
        switch (data.connectionState) {
          case ConnectionState.waiting:
            return Progress();

          case ConnectionState.done:
            return _body(data.data!);

          case ConnectionState.none:
            return DisplayMessage(message: AppStrings.somethingWentWrong);

          default:
            return DisplayMessage(message: AppStrings.somethingWentWrong);
        }
      },
    );
  }
}

Widget _body(Either<Failure, HistoryData> data) {
  Widget widget = Progress();
  data.fold(
    (left) {
      widget = DisplayMessage(message: left.message);
    },
    (right) {
      final jsonData = jsonDecode(right.data);
      widget = HistoryBody(jsonData: jsonData[RequestConstants.historyData]);
    },
  );
  return widget;
}
