import 'package:health_and_beyond/core/requests/requests.dart';
import 'package:health_and_beyond/features/home/features/profile/data/models/profile_object_model.dart';
import 'package:health_and_beyond/features/home/features/profile/data/models/profile_response_model.dart';

abstract class ProfileResponseRemoteSource {
  Future<ProfileResponseModel> getProfileResponse({required ProfileObjectModel profileObjectModel});
}

class ProfileResponseRemoteSourceImpl implements ProfileResponseRemoteSource {
  @override
  Future<ProfileResponseModel> getProfileResponse({required ProfileObjectModel profileObjectModel}) async {
    final data = await AppRequests.getProfileJSONData(profileObjectModel: profileObjectModel);
    return ProfileResponseModel(data: data);
  }
}
