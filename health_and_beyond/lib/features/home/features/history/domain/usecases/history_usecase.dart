// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:health_and_beyond/core/errors/failure.dart';
import 'package:health_and_beyond/core/usecases/history_usecase.dart';
import 'package:health_and_beyond/features/home/features/history/domain/entities/history_data.dart';
import 'package:health_and_beyond/features/home/features/history/domain/entities/history_object.dart';
import 'package:health_and_beyond/features/home/features/history/domain/repositories/history_repository.dart';

class GetPatientHistory implements HistoryUseCase {
  final HistoryRepository historyRepository;

  GetPatientHistory({required this.historyRepository});

  @override
  Future<Either<Failure, HistoryData>> execute({required HistoryObject historyObject}) async {
    return await historyRepository.getHistoryData(historyObject: historyObject);
  }
}
