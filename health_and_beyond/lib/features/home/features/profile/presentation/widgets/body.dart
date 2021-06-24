import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:health_and_beyond/core/resources/colors.dart';
import 'package:health_and_beyond/core/resources/dimensions.dart';
import 'package:health_and_beyond/core/resources/resources.dart';
import 'package:health_and_beyond/features/home/features/profile/domain/entities/doctor_profile_data.dart';
import 'package:health_and_beyond/features/home/features/profile/domain/entities/patient_profile_data.dart';
import 'package:health_and_beyond/features/home/features/profile/presentation/widgets/doctor_cards.dart';
import 'package:health_and_beyond/features/home/features/profile/presentation/widgets/patient_cards.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfileBody extends StatelessWidget {
  final String uid, type, data;

  ProfileBody({
    required this.uid,
    required this.type,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width,
      padding: const EdgeInsets.all(AppDimensions.d32),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              color: AppColors.primaryColor,
              elevation: AppDimensions.d16,
              child: QrImage(
                data: uid,
                version: QrVersions.auto,
                size: AppDimensions.d256,
              ),
            ),
            SizedBox(
              height: AppDimensions.d32,
            ),
            type == AppStrings.userTypes[0]
                ? DoctorProfileCards(
                    profile: DoctorProfileData.toProfileData(
                      jsonData: jsonDecode(data),
                    ),
                  )
                : PatientProfileCards(
                    profile: PatientProfileData.toProfileData(
                      jsonData: jsonDecode(data),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
