import 'package:health_and_beyond/core/preferences/preferences.dart';
import 'package:health_and_beyond/features/home/features/profile/data/models/profile_response_model.dart';

abstract class ProfileResponseLocalSource {
  Future<ProfileResponseModel> getProfileResponse();
  Future<void> setProfileResponse({required ProfileResponseModel profileResponseModel});
}

class ProfileResponseLocalSourceImpl implements ProfileResponseLocalSource {
  @override
  Future<ProfileResponseModel> getProfileResponse() async {
    final data = await AppPreferences.getProfileData();
    return ProfileResponseModel(data: data);
  }

  @override
  Future<void> setProfileResponse({required ProfileResponseModel profileResponseModel}) async {
    return AppPreferences.setProfileData(profileResponseModel.data);
  }
}
