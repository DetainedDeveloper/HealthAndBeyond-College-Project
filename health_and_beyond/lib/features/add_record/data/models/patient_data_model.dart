import 'package:health_and_beyond/features/add_record/domain/entities/patient_data.dart';

class PatientDataModel extends PatientData {
  final String data;

  PatientDataModel({required this.data}) : super(data: data);
}
