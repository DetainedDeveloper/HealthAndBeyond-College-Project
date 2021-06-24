// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:health_and_beyond/core/errors/failure.dart';
import 'package:health_and_beyond/core/usecases/event_usecase.dart';
import 'package:health_and_beyond/features/notification/features/event/domain/entities/event_data.dart';
import 'package:health_and_beyond/features/notification/features/event/domain/entities/event_object.dart';
import 'package:health_and_beyond/features/notification/features/event/domain/repositories/event_repository.dart';

class GetEventData implements EventUseCase {
  final EventRepository eventRepository;

  GetEventData({required this.eventRepository});

  @override
  Future<Either<Failure, EventData>> execute({required EventObject eventObject}) async {
    return await eventRepository.getEventData(eventObject: eventObject);
  }
}
