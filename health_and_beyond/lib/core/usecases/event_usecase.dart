// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:health_and_beyond/core/errors/failure.dart';
import 'package:health_and_beyond/features/notification/features/event/domain/entities/event_data.dart';
import 'package:health_and_beyond/features/notification/features/event/domain/entities/event_object.dart';

abstract class EventUseCase {
  Future<Either<Failure, EventData>> execute({required EventObject eventObject});
}
