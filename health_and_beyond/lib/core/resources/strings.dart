class AppStrings {
  static const String appName = 'Health and Beyond';

  static const String login = 'Login';
  static const String logOut = 'Log Out';
  static const String submit = 'Submit';

  static const String email = 'Email';
  static const String password = 'Password';

  static const String patientId = 'Patient ID';
  static const String scanPatientQRCode = 'Scan Patient QR Code';
  static const String addPatientRecord = 'Add Patient Record';

  static const String firstName = 'First Name';
  static const String disease = 'Disease';
  static const String description = 'Description';
  static const String prescription = 'Prescription';
  static const String city = 'City';
  static const String state = 'State';

  static const String fontFamily = 'Poppins';

  static const List<String> radioTypes = <String>[
    'doctor',
    'patient',
  ];

  static const List<String> userTypes = <String>[
    'Doctor',
    'Patient',
  ];

  static List<String> navigationTitles = <String>[
    'Dashboard',
    'View History',
    'Profile',
  ];

  static const List<String> statsTypes = <String>[
    'Patients registered',
    'Doctors registered',
    'Health cards',
    'Events',
  ];

  static const List<String> notificationTabs = <String>[
    'Notifications',
    'Health Events',
  ];

  static const String diseasesIn = 'Diseases in your ';

  static const String inputsCannotBeEmpty = 'Inputs can\'t be empty';
  static const String loginSuccessful = 'Login successful, welcome ';
  static const String loginFailed = 'Login failed, invalid email or password';
  static const String networkFailed = 'Please check your internet connection';
  static const String dataFailed = 'Could\'nt fetch data';
  static const String somethingWentWrong = 'Something went wrong, Please try again';
  static const String copiedToClipboard = 'Copied to clipboard';
}
