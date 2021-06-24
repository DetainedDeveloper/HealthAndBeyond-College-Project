// ignore: import_of_legacy_library_into_null_safe
import 'dart:convert';

// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:health_and_beyond/core/errors/failure.dart';
import 'package:health_and_beyond/core/resources/colors.dart';
import 'package:health_and_beyond/core/resources/strings.dart';
import 'package:health_and_beyond/features/core/widgets/display_message.dart';
import 'package:health_and_beyond/features/core/widgets/progress.dart';
import 'package:health_and_beyond/features/notification/features/event/data/models/event_object_model.dart';
import 'package:health_and_beyond/features/notification/features/event/data/repositories/event_repository_impl.dart';
import 'package:health_and_beyond/features/notification/features/event/data/data_sources/event_data_remote_source.dart';
import 'package:health_and_beyond/features/notification/features/event/domain/entities/event_data.dart';
import 'package:health_and_beyond/features/notification/features/event/domain/entities/single_event.dart';
import 'package:health_and_beyond/features/notification/features/event/domain/usecases/event_usecase.dart';
import 'package:health_and_beyond/features/notification/features/event/presentation/widgets/body.dart';

class Event extends StatelessWidget {
  final String type, id;
  final GetEventData _getDashboardData = GetEventData(
    eventRepository: EventRepositoryImpl(
      eventDataRemoteSource: EventDataRemoteSourceImpl(),
    ),
  );

  Event({required this. type, required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: FutureBuilder<Either<Failure, EventData>>(
        future: _getDashboardData.execute(
          eventObject: EventObjectModel(type: type, id: id),
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
      ),
    );
  }
}

Widget _body(Either<Failure, EventData> data) {
  Widget widget = Progress();
  data.fold(
    (left) {
      widget = DisplayMessage(message: left.message);
    },
    (right) {
      widget = EventBody(
        event: SingleEvent.toSingleEvent(
          jsonData: jsonDecode(right.data),
        ),
      );
    },
  );
  return widget;
}
