// ignore: import_of_legacy_library_into_null_safe
import 'dart:convert';

// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:health_and_beyond/core/errors/failure.dart';
import 'package:health_and_beyond/core/resources/resources.dart';
import 'package:health_and_beyond/features/authentication/domain/entities/auth_user.dart';
import 'package:health_and_beyond/features/core/widgets/widgets.dart';
import 'package:health_and_beyond/features/home/features/dashboard/data/data_sources/dashboard_data_local_source.dart';
import 'package:health_and_beyond/features/home/features/dashboard/data/data_sources/dashboard_data_remote_source.dart';
import 'package:health_and_beyond/features/home/features/dashboard/data/models/dashboard_object_model.dart';
import 'package:health_and_beyond/features/home/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:health_and_beyond/features/home/features/dashboard/domain/entities/dashboard_data.dart';
import 'package:health_and_beyond/features/home/features/dashboard/domain/usecases/dashboard_usecase.dart';
import 'package:health_and_beyond/features/home/features/dashboard/presentation/widgets/body.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  final GetDashboardData _getDashboardData = GetDashboardData(
    dashboardRepository: DashboardRepositoryImpl(
      dashboardDataRemoteSource: DashboardDataRemoteSourceImpl(),
      dashboardDataLocalSource: DashboardDataLocalSourceImpl(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final AuthUser _user = Provider.of<AuthUser>(context);

    return FutureBuilder<Either<Failure, DashboardData>>(
      future: _getDashboardData.execute(
        dashboardObject: DashboardObjectModel(
          type: _user.type,
          uid: _user.uid,
          city: _user.city,
          state: _user.state,
        ),
      ),
      builder: (context, data) {
        switch (data.connectionState) {
          case ConnectionState.waiting:
            return Progress();

          case ConnectionState.done:
            return _body(data.data!);

          case ConnectionState.none:
            return DisplayMessage(message: AppStrings.somethingWentWrong);

          default:
            return DisplayMessage(message: AppStrings.somethingWentWrong);
        }
      },
    );
  }
}

Widget _body(Either<Failure, DashboardData> data) {
  Widget widget = Progress();
  data.fold(
    (left) {
      widget = DisplayMessage(message: left.message);
    },
    (right) {
      widget = DashboardBody(jsonData: jsonDecode(right.data));
    },
  );
  return widget;
}
