import 'package:health_and_beyond/core/requests/request_constants.dart';

class PatientProfileData {
  final String id,
      firstName,
      middleName,
      lastName,
      gender,
      dob,
      bloodGroup,
      mobile,
      pincode,
      city,
      state,
      address,
      password,
      uniqueId,
      email;

  PatientProfileData({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.gender,
    required this.dob,
    required this.bloodGroup,
    required this.mobile,
    required this.pincode,
    required this.city,
    required this.state,
    required this.address,
    required this.password,
    required this.uniqueId,
    required this.email,
  });

  factory PatientProfileData.toProfileData({required jsonData}) {
    return PatientProfileData(
      id: jsonData[RequestConstants.profilePatientId],
      firstName: jsonData[RequestConstants.profileFirstName],
      middleName: jsonData[RequestConstants.profileMiddleName],
      lastName: jsonData[RequestConstants.profileLastName],
      gender: jsonData[RequestConstants.profileGender],
      dob: jsonData[RequestConstants.profileDOB],
      bloodGroup: jsonData[RequestConstants.profilePatientBloodGroup],
      mobile: jsonData[RequestConstants.profileMobile],
      pincode: jsonData[RequestConstants.profilePincode],
      city: jsonData[RequestConstants.profileCity],
      state: jsonData[RequestConstants.profileState],
      address: jsonData[RequestConstants.profileAddress],
      password: jsonData[RequestConstants.profilePassword],
      uniqueId: jsonData[RequestConstants.profileUid],
      email: jsonData[RequestConstants.profileEmail],
    );
  }
}
