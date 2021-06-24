// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:health_and_beyond/core/errors/exceptions.dart';
import 'package:health_and_beyond/core/errors/failure.dart';
import 'package:health_and_beyond/core/network/network.dart';
import 'package:health_and_beyond/core/resources/resources.dart';
import 'package:health_and_beyond/features/home/features/dashboard/data/data_sources/dashboard_data_local_source.dart';
import 'package:health_and_beyond/features/home/features/dashboard/data/data_sources/dashboard_data_remote_source.dart';
import 'package:health_and_beyond/features/home/features/dashboard/data/models/dashboard_data_model.dart';
import 'package:health_and_beyond/features/home/features/dashboard/data/models/dashboard_object_model.dart';
import 'package:health_and_beyond/features/home/features/dashboard/domain/entities/dashboard_data.dart';
import 'package:health_and_beyond/features/home/features/dashboard/domain/entities/dashboard_object.dart';
import 'package:health_and_beyond/features/home/features/dashboard/domain/repositories/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardDataRemoteSource dashboardDataRemoteSource;
  final DashboardDataLocalSource dashboardDataLocalSource;

  DashboardRepositoryImpl({
    required this.dashboardDataRemoteSource,
    required this.dashboardDataLocalSource,
  });

  @override
  Future<Either<Failure, DashboardData>> getDashboardData({required DashboardObject dashboardObject}) async {
    if (await Network.connected) {
      try {
        final DashboardData dashboardData = await dashboardDataRemoteSource.getDashboardData(
          dashboardObjectModel: DashboardObjectModel.toDashboardObjectModel(dashboardObject: dashboardObject),
        );
        await dashboardDataLocalSource.setDashboardData(
          dashboardDataModel: DashboardDataModel(data: dashboardData.data),
        );
        return Right(dashboardData);
      } on NetworkException {
        return Left(NetworkFailure(message: AppStrings.dataFailed));
      }
    } else {
      try {
        return Right(await dashboardDataLocalSource.getDashboardData());
      } on CacheException {
        return Left(CacheFailure(message: AppStrings.dataFailed));
      }
    }
  }
}
