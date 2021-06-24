import 'package:health_and_beyond/core/requests/request_constants.dart';

class SingleEvent {
  final String id, name, date, time, pincode, city, state, country, organizer, drName, description, contact, address;

  SingleEvent({
    required this.id,
    required this.name,
    required this.date,
    required this.time,
    required this.pincode,
    required this.city,
    required this.state,
    required this.country,
    required this.organizer,
    required this.drName,
    required this.description,
    required this.contact,
    required this.address,
  });

  factory SingleEvent.toSingleEvent({required jsonData}) {
    return SingleEvent(
      id: jsonData[RequestConstants.eventId],
      name: jsonData[RequestConstants.eventName],
      date: jsonData[RequestConstants.eventDate],
      time: jsonData[RequestConstants.eventTime],
      pincode: jsonData[RequestConstants.eventPincode],
      city: jsonData[RequestConstants.eventCity],
      state: jsonData[RequestConstants.eventState],
      country: jsonData[RequestConstants.eventCountry],
      organizer: jsonData[RequestConstants.eventOrganizer],
      drName:jsonData[RequestConstants.eventDrName],
      description: jsonData[RequestConstants.eventDescription],
      contact: jsonData[RequestConstants.eventContact],
      address: jsonData[RequestConstants.eventAddress],
    );
  }
}
