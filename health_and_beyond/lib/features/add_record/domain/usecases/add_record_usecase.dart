// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:health_and_beyond/core/errors/failure.dart';
import 'package:health_and_beyond/core/usecases/add_record_usecase.dart';
import 'package:health_and_beyond/features/add_record/domain/entities/patient_data.dart';
import 'package:health_and_beyond/features/add_record/domain/entities/patient_object.dart';
import 'package:health_and_beyond/features/add_record/domain/repositories/add_record_repository.dart';

class GetPatientDetails implements AddRecordUseCase {
  final AddRecordRepository addRecordRepository;

  GetPatientDetails({required this.addRecordRepository});

  @override
  Future<Either<Failure, PatientData>> execute({required PatientObject patientObject}) async {
    return await addRecordRepository.getPatientDetails(patientObject: patientObject);
  }
}
