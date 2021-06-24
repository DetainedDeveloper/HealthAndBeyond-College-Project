import 'package:health_and_beyond/features/home/features/profile/domain/entities/profile_response.dart';

class ProfileResponseModel extends ProfileResponse {
  final String data;

  ProfileResponseModel({required this.data}) : super(data: data);
}
