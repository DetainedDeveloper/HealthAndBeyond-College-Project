class AppUrls {
  static const String login = 'https://healthandbeyond.xyz/Login/processLogin.php';

  static String dashboard({required String type}) {
    return 'https://healthandbeyond.xyz/$type/flutterindex.php';
  }

  static String notification({required String type}) {
    return 'https://healthandbeyond.xyz/$type/flutterindex.php';
  }

  static String event({required String type, required String id}) {
    return 'https://healthandbeyond.xyz/$type/fluttereventdetails.php?value=$id';
  }

  static String profile({required String type}) {
    return 'https://healthandbeyond.xyz/$type/flutteraccount.php';
  }

  static String history({required String type}) {
    return 'https://healthandbeyond.xyz/$type/flutterpatientdetailprocess.php';
  }

  static String patient({required String type, required String uid}) {
    return 'https://healthandbeyond.xyz/$type/flutterdoctoraddrecordprocess.php?uid=$uid';
  }

  static String add({required String type, required String uid}) {
    return 'https://healthandbeyond.xyz/$type/flutterdoctoraddrecordprocess.php?uid=$uid';
  }
}
