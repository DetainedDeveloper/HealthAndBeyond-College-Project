// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:health_and_beyond/core/errors/exceptions.dart';
import 'package:health_and_beyond/core/errors/failure.dart';
import 'package:health_and_beyond/core/network/network.dart';
import 'package:health_and_beyond/core/resources/strings.dart';
import 'package:health_and_beyond/features/notification/features/event/data/models/event_object_model.dart';
import 'package:health_and_beyond/features/notification/features/event/data/data_sources/event_data_remote_source.dart';
import 'package:health_and_beyond/features/notification/features/event/domain/entities/event_data.dart';
import 'package:health_and_beyond/features/notification/features/event/domain/entities/event_object.dart';
import 'package:health_and_beyond/features/notification/features/event/domain/repositories/event_repository.dart';

class EventRepositoryImpl implements EventRepository {
  final EventDataRemoteSource eventDataRemoteSource;

  EventRepositoryImpl({
    required this.eventDataRemoteSource,
  });

  @override
  Future<Either<Failure, EventData>> getEventData({required EventObject eventObject}) async {
    if (await Network.connected) {
      try {
        final EventData eventData = await eventDataRemoteSource.getEventData(
          eventObjectModel: EventObjectModel.toEventObjectModel(eventObject: eventObject),
        );
        return Right(eventData);
      } on NetworkException {
        return Left(NetworkFailure(message: AppStrings.dataFailed));
      }
    } else {
      return Left(NetworkFailure(message: AppStrings.dataFailed));
    }
  }
}
