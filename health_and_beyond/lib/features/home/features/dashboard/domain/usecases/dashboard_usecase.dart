// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:health_and_beyond/core/errors/failure.dart';
import 'package:health_and_beyond/core/usecases/dashboard_usecase.dart';
import 'package:health_and_beyond/features/home/features/dashboard/domain/entities/dashboard_data.dart';
import 'package:health_and_beyond/features/home/features/dashboard/domain/entities/dashboard_object.dart';
import 'package:health_and_beyond/features/home/features/dashboard/domain/repositories/dashboard_repository.dart';

class GetDashboardData implements DashboardUseCase {
  final DashboardRepository dashboardRepository;

  GetDashboardData({required this.dashboardRepository});
  @override
  Future<Either<Failure, DashboardData>> execute({required DashboardObject dashboardObject}) async {
    return await dashboardRepository.getDashboardData(dashboardObject: dashboardObject);
  }
}
