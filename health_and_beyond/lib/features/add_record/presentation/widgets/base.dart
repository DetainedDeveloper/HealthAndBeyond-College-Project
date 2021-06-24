// ignore: import_of_legacy_library_into_null_safe
import 'dart:convert';

// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:health_and_beyond/core/errors/failure.dart';
import 'package:health_and_beyond/core/requests/request_constants.dart';
import 'package:health_and_beyond/core/resources/strings.dart';
import 'package:health_and_beyond/features/add_record/data/data_sources/add_record_remote_data_source.dart';
import 'package:health_and_beyond/features/add_record/data/models/patient_object_model.dart';
import 'package:health_and_beyond/features/add_record/data/repositories/add_record_repository_impl.dart';
import 'package:health_and_beyond/features/add_record/domain/entities/disease.dart';
import 'package:health_and_beyond/features/add_record/domain/entities/patient.dart';
import 'package:health_and_beyond/features/add_record/domain/entities/patient_data.dart';
import 'package:health_and_beyond/features/add_record/domain/usecases/add_record_usecase.dart';
import 'package:health_and_beyond/features/add_record/presentation/widgets/body.dart';
import 'package:health_and_beyond/features/core/widgets/display_message.dart';
import 'package:health_and_beyond/features/core/widgets/progress.dart';

class AddRecordBase extends StatelessWidget {
  final String uid, type, drUid, drFirstName;
  final GetPatientDetails _getPatientDetails = GetPatientDetails(
    addRecordRepository: AddRecordRepositoryImpl(
      addRecordRemoteDataSource: AddRecordRemoteDataSourceImpl(),
    ),
  );

  AddRecordBase({
    required this.uid,
    required this.type,
    required this.drUid,
    required this.drFirstName,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Either<Failure, PatientData>>(
      future: _getPatientDetails.execute(
        patientObject: PatientObjectModel(
          uid: uid,
          type: type,
        ),
      ),
      builder: (context, data) {
        switch (data.connectionState) {
          case ConnectionState.waiting:
            return Progress();

          case ConnectionState.done:
            return _body(uid, type, drUid, drFirstName, data.data!);

          case ConnectionState.none:
            return DisplayMessage(message: AppStrings.somethingWentWrong);

          default:
            return DisplayMessage(message: AppStrings.somethingWentWrong);
        }
      },
    );
  }
}

Widget _body(String uid, String type, String drUid, String drFirstName, Either<Failure, PatientData> data) {
  Widget widget = Progress();
  data.fold(
    (left) {
      widget = DisplayMessage(message: left.message);
    },
    (right) {
      final jsonData = jsonDecode(right.data);
      final List<dynamic> diseaseList = jsonData[RequestConstants.allDiseaseName];
      widget = AddRecordBody(
        uid: uid,
        type: type,
        drUid: drUid,
        drFirstName: drFirstName,
        patient: Patient(
          firstName: jsonData[RequestConstants.addRecord][RequestConstants.patientFirstName],
          dob: jsonData[RequestConstants.addRecord][RequestConstants.profileDOB],
          city: jsonData[RequestConstants.addRecord][RequestConstants.city],
          state: jsonData[RequestConstants.addRecord][RequestConstants.state],
        ),
        diseases: List.generate(
          diseaseList.length,
          (index) => Disease(
            name: diseaseList[index][RequestConstants.diseaseName] as String,
          ),
        ),
      );
    },
  );
  return widget;
}
