import 'package:health_and_beyond/core/requests/requests.dart';
import 'package:health_and_beyond/features/add_record/data/models/patient_data_model.dart';
import 'package:health_and_beyond/features/add_record/data/models/patient_object_model.dart';

abstract class AddRecordRemoteDataSource {
  Future<PatientDataModel> getPatientDetails({required PatientObjectModel patientObjectModel});
}

class AddRecordRemoteDataSourceImpl implements AddRecordRemoteDataSource {
  @override
  Future<PatientDataModel> getPatientDetails({required PatientObjectModel patientObjectModel}) async {
    final data = await AppRequests.getPatientDetails(patientObjectModel: patientObjectModel);
    return PatientDataModel(data: data);
  }
}
