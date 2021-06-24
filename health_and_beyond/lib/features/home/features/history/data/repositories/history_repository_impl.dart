// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:health_and_beyond/core/errors/exceptions.dart';
import 'package:health_and_beyond/core/errors/failure.dart';
import 'package:health_and_beyond/core/network/network.dart';
import 'package:health_and_beyond/core/resources/resources.dart';
import 'package:health_and_beyond/features/home/features/history/data/data_sources/history_data_remote_source.dart';
import 'package:health_and_beyond/features/home/features/history/data/models/history_object_model.dart';
import 'package:health_and_beyond/features/home/features/history/domain/entities/history_data.dart';
import 'package:health_and_beyond/features/home/features/history/domain/entities/history_object.dart';
import 'package:health_and_beyond/features/home/features/history/domain/repositories/history_repository.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final HistoryDataRemoteSource historyDataRemoteSource;

  HistoryRepositoryImpl({required this.historyDataRemoteSource});

  @override
  Future<Either<Failure, HistoryData>> getHistoryData({required HistoryObject historyObject}) async {
    if (await Network.connected) {
      try {
        final HistoryData historyData = await historyDataRemoteSource.getHistoryData(
          historyObjectModel: HistoryObjectModel.toHistoryObjectModel(
            historyObject: historyObject,
          ),
        );
        return Right(historyData);
      } on NetworkException {
        return Left(NetworkFailure(message: AppStrings.networkFailed));
      }
    } else {
      return Left(NetworkFailure(message: AppStrings.networkFailed));
    }
  }
}
