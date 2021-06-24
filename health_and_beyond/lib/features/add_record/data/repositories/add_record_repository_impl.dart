// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:health_and_beyond/core/errors/exceptions.dart';
import 'package:health_and_beyond/core/errors/failure.dart';
import 'package:health_and_beyond/core/network/network.dart';
import 'package:health_and_beyond/core/resources/resources.dart';
import 'package:health_and_beyond/features/add_record/data/data_sources/add_record_remote_data_source.dart';
import 'package:health_and_beyond/features/add_record/data/models/patient_object_model.dart';
import 'package:health_and_beyond/features/add_record/domain/entities/patient_data.dart';
import 'package:health_and_beyond/features/add_record/domain/entities/patient_object.dart';
import 'package:health_and_beyond/features/add_record/domain/repositories/add_record_repository.dart';

class AddRecordRepositoryImpl implements AddRecordRepository {
  final AddRecordRemoteDataSource addRecordRemoteDataSource;

  AddRecordRepositoryImpl({required this.addRecordRemoteDataSource});

  @override
  Future<Either<Failure, PatientData>> getPatientDetails({required PatientObject patientObject}) async {
    if (await Network.connected) {
      try {
        final PatientData patientData = await addRecordRemoteDataSource.getPatientDetails(
          patientObjectModel: PatientObjectModel(
            uid: patientObject.uid,
            type: patientObject.type,
          ),
        );
        return Right(patientData);
      } on NetworkException {
        return Left(NetworkFailure(message: AppStrings.networkFailed));
      }
    } else {
      return Left(NetworkFailure(message: AppStrings.networkFailed));
    }
  }
}
