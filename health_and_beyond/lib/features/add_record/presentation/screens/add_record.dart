import 'package:flutter/material.dart';
import 'package:health_and_beyond/core/preferences/preferences.dart';
import 'package:health_and_beyond/core/resources/resources.dart';
import 'package:health_and_beyond/features/add_record/presentation/widgets/base.dart';
import 'package:health_and_beyond/features/authentication/domain/entities/auth_user.dart';
import 'package:health_and_beyond/features/core/widgets/display_message.dart';

class AddRecord extends StatelessWidget {
  final String uid, type;

  AddRecord({required this.uid, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: Text(AppStrings.addPatientRecord),
      ),
      body: FutureBuilder<AuthUser>(
        future: AppPreferences.getUser(),
        builder: (context, data) {
          if (data.data != null) {
            final AuthUser user = data.data!;

            return AddRecordBase(
              uid: uid,
              type: type,
              drUid: user.uid,
              drFirstName: user.name,
            );
          } else {
            return DisplayMessage(message: AppStrings.somethingWentWrong);
          }
        },
      ),
    );
  }
}
