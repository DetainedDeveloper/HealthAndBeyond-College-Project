// ignore: import_of_legacy_library_into_null_safe
import 'package:data_connection_checker/data_connection_checker.dart' show DataConnectionChecker;

class Network {
  static DataConnectionChecker _dataConnectionChecker = DataConnectionChecker();

  static Future<bool> get connected => _dataConnectionChecker.hasConnection;
}
