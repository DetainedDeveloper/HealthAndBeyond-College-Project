import 'package:health_and_beyond/core/requests/request_constants.dart';
import 'package:health_and_beyond/features/add_record/domain/entities/patient_object.dart';

class PatientObjectModel extends PatientObject {
  final String uid, type;

  PatientObjectModel({
    required this.uid,
    required this.type,
  }) : super(
          uid: uid,
          type: type,
        );

  static Map<String, String> toMap({required String uid}) {
    return {RequestConstants.uid: uid};
  }
}
