import 'package:health_and_beyond/core/requests/request_constants.dart';
import 'package:health_and_beyond/features/add_record/domain/entities/add_record_object.dart';

class AddRecordObjectModel extends AddRecordObject {
  final String uid, type, firstName, disease, description, prescription, city, state, uploadDate, dob, drUid, drFirstName;

  AddRecordObjectModel({
    required this.uid,
    required this.type,
    required this.firstName,
    required this.disease,
    required this.description,
    required this.prescription,
    required this.city,
    required this.state,
    required this.uploadDate,
    required this.dob,
    required this.drUid,
    required this.drFirstName,
  }) : super(
          uid: uid,
          type: type,
          firstName: firstName,
          disease: disease,
          description: description,
          prescription: prescription,
          city: city,
          state: state,
          uploadDate: uploadDate,
          dob: dob,
          drUid: drUid,
          drFirstName: drFirstName,
        );

  static Map<String, String> toMap({required AddRecordObjectModel addRecordObjectModel}) {
    return {
      RequestConstants.uid: addRecordObjectModel.uid,
      RequestConstants.patientAddRecord: RequestConstants.patientAddRecord,
      RequestConstants.profileFirstName: addRecordObjectModel.firstName,
      RequestConstants.historyDisease: addRecordObjectModel.disease,
      RequestConstants.historyDescription: addRecordObjectModel.description,
      RequestConstants.historyPrescription: addRecordObjectModel.prescription,
      RequestConstants.city: addRecordObjectModel.city,
      RequestConstants.state: addRecordObjectModel.state,
      RequestConstants.historyUploadDate: addRecordObjectModel.uploadDate,
      RequestConstants.profileDOB: addRecordObjectModel.dob,
      RequestConstants.patientUid: addRecordObjectModel.uid,
      RequestConstants.patientDrUid: addRecordObjectModel.drUid,
      RequestConstants.patientDrFirstName: addRecordObjectModel.drFirstName,
    };
  }
}
