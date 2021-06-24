import 'package:flutter/material.dart';
import 'package:health_and_beyond/core/preferences/preferences.dart';
import 'package:health_and_beyond/core/resources/colors.dart';
import 'package:health_and_beyond/core/resources/strings.dart';
import 'package:health_and_beyond/core/resources/styles.dart';
import 'package:health_and_beyond/features/add_record/presentation/screens/add_record.dart';
import 'package:health_and_beyond/features/authentication/domain/entities/auth_user.dart';
import 'package:health_and_beyond/features/core/widgets/display_message.dart';
import 'package:health_and_beyond/features/core/widgets/snackbar_message.dart';
import 'package:health_and_beyond/features/home/features/dashboard/presentation/screens/dashboard.dart';
import 'package:health_and_beyond/features/home/features/history/presentation/screens/history.dart';
import 'package:health_and_beyond/features/home/features/history/presentation/screens/scan_patient_qr_code.dart';
import 'package:health_and_beyond/features/home/features/profile/presentation/screens/profile.dart';
import 'package:health_and_beyond/features/home/presentation/widgets/app_bar.dart';
import 'package:health_and_beyond/features/home/presentation/widgets/navigation.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _bodyList = <Widget>[
    Dashboard(),
    History(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AuthUser>(
      future: AppPreferences.getUser(),
      builder: (context, authUser) {
        if (authUser.data != null) {
          final AuthUser user = authUser.data!;

          return Scaffold(
            appBar: HomeAppBar(
              context: context,
              title: user.name,
              subtitle: user.email,
            ),
            body: FutureProvider<AuthUser>(
              initialData: user,
              create: (context) => Future.value(user),
              child: _bodyList[_currentIndex],
            ),
            bottomNavigationBar: HomeNavigation(
              currentIndex: _currentIndex,
              onItemSelected: (index) {
                setState(() => _currentIndex = index);
              },
            ),
            floatingActionButton: user.type == AppStrings.userTypes[0]
                ? _addRecordFAB(context, user.type)
                : null,
          );
        } else {
          return DisplayMessage(message: AppStrings.somethingWentWrong);
        }
      },
    );
  }
}

Widget _addRecordFAB(BuildContext context, String type) {
  return FloatingActionButton(
    backgroundColor: AppColors.activeColor,
    child: Icon(Icons.add),
    onPressed: () {
      showDialog(
        context: context,
        builder: (context) {
          final TextEditingController _controller = TextEditingController();
          return AlertDialog(
            content: TextField(
              decoration: AppStyles.inputDecoration.copyWith(hintText: AppStrings.patientId),
              controller: _controller,
              keyboardType: TextInputType.numberWithOptions(signed: true, decimal: false),
            ),
            actions: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.qr_code_scanner_outlined, color: AppColors.activeColor),
                    onPressed: () async {
                      final String uid = await _getPatientUid(context);
                      _navigateToAddRecord(context, uid, type);
                    },
                  ),
                  Text('OR'),
                  TextButton(
                    child: Text(AppStrings.submit, style: TextStyle(color: AppColors.activeColor)),
                    onPressed: () {
                      if (_controller.text.length > 0) {
                        _navigateToAddRecord(context, _controller.text, type);
                      } else {
                        SnackBarMessage.displayMessage(context: context, message: AppStrings.inputsCannotBeEmpty);
                      }
                    },
                  ),
                ],
              ),
            ],
          );
        },
      );
    },
  );
}

Future<String> _getPatientUid(BuildContext context) async {
  return await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ScanPatientQRCode(context: context),
    ),
  );
}

void _navigateToAddRecord(BuildContext context, String uid, String type) {
  FocusScope.of(context).unfocus();
  Navigator.pop(context);
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => AddRecord(uid: uid, type: type),
    ),
  );
}
