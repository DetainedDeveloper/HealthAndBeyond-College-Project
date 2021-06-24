import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_and_beyond/core/resources/colors.dart';
import 'package:health_and_beyond/core/resources/dimensions.dart';
import 'package:health_and_beyond/core/resources/resources.dart';
import 'package:health_and_beyond/features/core/widgets/snackbar_message.dart';
import 'package:health_and_beyond/features/home/features/profile/domain/entities/patient_profile_data.dart';

class PatientProfileCards extends StatefulWidget {
  final PatientProfileData profile;

  PatientProfileCards({required this.profile});

  @override
  _PatientProfileCardsState createState() => _PatientProfileCardsState(profile: profile);
}

class _PatientProfileCardsState extends State<PatientProfileCards> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final PatientProfileData profile;
  int _currentIndex = 0;

  _PatientProfileCardsState({required this.profile});

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    );
    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            2,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimensions.d2, vertical: AppDimensions.d16),
              child: CircleAvatar(
                radius: AppDimensions.d4,
                backgroundColor: _currentIndex == index ? AppColors.activeColor : AppColors.iconColor.withAlpha(75),
              ),
            ),
          ),
        ),
        Card(
          color: AppColors.primaryColor,
          elevation: AppDimensions.d8,
          child: SizedBox(
            height: AppDimensions.d256,
            child: TabBarView(
              controller: _tabController,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppColors.activeColor,
                        child: Icon(
                          Icons.person_outline,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      title: Text(
                        profile.firstName + ' ' + profile.middleName + ' ' + profile.lastName,
                      ),
                      subtitle: Text(profile.uniqueId),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.copy,
                          color: AppColors.activeColor,
                        ),
                        onPressed: () => _copyToClipboard(context, profile.uniqueId),
                      ),
                    ),
                    Divider(),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppColors.activeColor,
                        child: Icon(
                          Icons.school_outlined,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      title: Text(profile.bloodGroup),
                      subtitle: Text(profile.dob),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.info_outline,
                          color: AppColors.activeColor,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Divider(),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppColors.activeColor,
                        child: Icon(
                          Icons.quick_contacts_dialer_outlined,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      title: Text(profile.email),
                      subtitle: Text('+91 ' + profile.mobile),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.call_outlined,
                          color: AppColors.activeColor,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: AppColors.activeColor,
                    child: Icon(
                      Icons.home_outlined,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  title: Text(profile.address),
                  subtitle: Text(profile.city + ', ' + profile.state),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.directions_outlined,
                      color: AppColors.activeColor,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

void _copyToClipboard(BuildContext context, String text) {
  Clipboard.setData(ClipboardData(text: text));
  SnackBarMessage.displayMessage(
    context: context,
    message: AppStrings.copiedToClipboard,
  );
}
