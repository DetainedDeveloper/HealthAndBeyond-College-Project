// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:health_and_beyond/core/errors/failure.dart';
import 'package:health_and_beyond/features/home/features/dashboard/domain/entities/dashboard_data.dart';
import 'package:health_and_beyond/features/home/features/dashboard/domain/entities/dashboard_object.dart';

abstract class DashboardRepository {
  Future<Either<Failure, DashboardData>> getDashboardData({required DashboardObject dashboardObject});
}
