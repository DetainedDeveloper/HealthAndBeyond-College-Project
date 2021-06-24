import 'package:health_and_beyond/core/preferences/preference_constants.dart';
import 'package:health_and_beyond/features/authentication/domain/entities/auth_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static Future<SharedPreferences> get _preferences async => await SharedPreferences.getInstance();

  static void logIn() async {
    SharedPreferences preferences = await _preferences;
    preferences.setBool(PreferenceConstants.loggedIn, true);
  }

  static void logOut() async {
    SharedPreferences preferences = await _preferences;
    preferences.setBool(PreferenceConstants.loggedIn, false);
  }

  static Future<bool> get isLoggedIn async {
    SharedPreferences preferences = await _preferences;
    final value = preferences.getBool(PreferenceConstants.loggedIn);
    return value != null ? value : false;
  }

  static void setUser(AuthUser authUser) async {
    SharedPreferences preferences = await _preferences;
    preferences.setString(PreferenceConstants.type, authUser.type.replaceRange(0, 1, authUser.type.substring(0, 1).toUpperCase()));
    preferences.setString(PreferenceConstants.uid, authUser.uid);
    preferences.setString(PreferenceConstants.email, authUser.email);
    preferences.setString(PreferenceConstants.name, authUser.name.replaceRange(0, 1, authUser.name.substring(0, 1).toUpperCase()));
    preferences.setString(PreferenceConstants.city, authUser.city);
    preferences.setString(PreferenceConstants.state, authUser.state);
  }

  static Future<AuthUser> getUser() async {
    SharedPreferences preferences = await _preferences;
    String type = preferences.getString(PreferenceConstants.type) as String;
    String uid = preferences.getString(PreferenceConstants.uid) as String;
    String email = preferences.getString(PreferenceConstants.email) as String;
    String name = preferences.getString(PreferenceConstants.name) as String;
    String city = preferences.getString(PreferenceConstants.city) as String;
    String state = preferences.getString(PreferenceConstants.state) as String;

    return AuthUser(
      type: type,
      uid: uid,
      email: email,
      name: name,
      city: city,
      state: state,
    );
  }

  static void setDashboardData(String data) async {
    SharedPreferences preferences = await _preferences;
    preferences.setString(PreferenceConstants.dashboardData, data);
  }

  static Future<String> getDashboardData() async {
    SharedPreferences preferences = await _preferences;
    return preferences.getString(PreferenceConstants.dashboardData) as String;
  }

  static void setProfileData(String data) async {
    SharedPreferences preferences = await _preferences;
    preferences.setString(PreferenceConstants.profileData, data);
  }

  static Future<String> getProfileData() async {
    SharedPreferences preferences = await _preferences;
    return preferences.getString(PreferenceConstants.profileData) as String;
  }
}
