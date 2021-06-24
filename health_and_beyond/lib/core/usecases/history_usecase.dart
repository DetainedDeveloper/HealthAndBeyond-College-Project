// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:health_and_beyond/core/errors/failure.dart';
import 'package:health_and_beyond/features/home/features/history/domain/entities/history_data.dart';
import 'package:health_and_beyond/features/home/features/history/domain/entities/history_object.dart';

abstract class HistoryUseCase {
  Future<Either<Failure, HistoryData>> execute({required HistoryObject historyObject});
}
