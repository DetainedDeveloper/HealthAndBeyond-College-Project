// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:health_and_beyond/core/errors/failure.dart';
import 'package:health_and_beyond/features/add_record/domain/entities/patient_data.dart';
import 'package:health_and_beyond/features/add_record/domain/entities/patient_object.dart';

abstract class AddRecordRepository {
  Future<Either<Failure, PatientData>> getPatientDetails({required PatientObject patientObject});
}
