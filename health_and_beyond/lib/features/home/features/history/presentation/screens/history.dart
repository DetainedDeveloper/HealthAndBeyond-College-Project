import 'package:flutter/material.dart';
import 'package:health_and_beyond/core/resources/resources.dart';
import 'package:health_and_beyond/features/authentication/domain/entities/auth_user.dart';
import 'package:health_and_beyond/features/core/widgets/snackbar_message.dart';
import 'package:health_and_beyond/features/home/features/history/presentation/screens/scan_patient_qr_code.dart';
import 'package:health_and_beyond/features/home/features/history/presentation/widgets/base.dart';
import 'package:provider/provider.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final TextEditingController _controller = TextEditingController();
  Widget _widget = Container();

  @override
  Widget build(BuildContext context) {
    final AuthUser _user = Provider.of<AuthUser>(context);
    if (_user.type == AppStrings.userTypes[1]) {
      return HistoryBase(uid: _user.uid, type: _user.type);
    } else {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              margin: const EdgeInsets.all(AppDimensions.d8),
              elevation: AppDimensions.d8,
              child: ListTile(
                tileColor: AppColors.primaryColor,
                leading: IconButton(
                  icon: Icon(Icons.qr_code_scanner_outlined, color: AppColors.activeColor),
                  onPressed: () async {
                    final String uid = await _getPatientUid(context);
                    if (uid.isNotEmpty) {
                      setState(() {
                        _widget = HistoryBase(uid: uid, type: _user.type);
                      });
                    }
                  },
                ),
                title: TextField(
                  decoration: AppStyles.inputDecoration.copyWith(hintText: AppStrings.patientId),
                  controller: _controller,
                  keyboardType: TextInputType.numberWithOptions(signed: true, decimal: false),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.search, color: AppColors.activeColor),
                  onPressed: () {
                    if (_controller.text.length > 0) {
                      setState(() {
                        FocusScope.of(context).unfocus();
                        _widget = HistoryBase(uid: _controller.text, type: _user.type);
                      });
                    } else {
                      SnackBarMessage.displayMessage(context: context, message: AppStrings.inputsCannotBeEmpty);
                    }
                  },
                ),
              ),
            ),
            _widget,
          ],
        ),
      );
    }
  }
}

Future<String> _getPatientUid(BuildContext context) async {
  return await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ScanPatientQRCode(context: context),
    ),
  );
}
