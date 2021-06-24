import 'package:flutter/material.dart';
import 'package:health_and_beyond/core/preferences/preferences.dart';
import 'package:health_and_beyond/features/authentication/data/data_sources/auth_user_remote_source.dart';
import 'package:health_and_beyond/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:health_and_beyond/features/authentication/domain/entities/auth_object.dart';
import 'package:health_and_beyond/features/authentication/domain/uescases/auth_usecase.dart';
import 'package:health_and_beyond/core/resources/resources.dart' hide AppTheme;
import 'package:health_and_beyond/features/core/widgets/snackbar_message.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String? _userType = AppStrings.radioTypes[0];
  bool _obscure = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: AppDimensions.d32),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.d8),
      ),
      elevation: AppDimensions.d8,
      child: Padding(
        padding: EdgeInsets.all(AppDimensions.d32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: AppDimensions.d16),
              child: Text(
                AppStrings.login,
                style: AppStyles.textStyle.copyWith(
                  fontSize: AppDimensions.appBarTitle,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppDimensions.d16),
              child: Row(
                children: [
                  Flexible(
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      leading: Radio(
                        value: AppStrings.radioTypes[0],
                        groupValue: _userType,
                        onChanged: (String? value) {
                          setState(() {
                            _userType = value;
                          });
                        },
                      ),
                      title: Text(AppStrings.userTypes[0]),
                      onTap: () {
                        setState(() {
                          _userType = AppStrings.radioTypes[0];
                        });
                      },
                    ),
                  ),
                  Flexible(
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      leading: Radio(
                        value: AppStrings.radioTypes[1],
                        groupValue: _userType,
                        onChanged: (String? value) {
                          setState(() {
                            _userType = value;
                          });
                        },
                      ),
                      title: Text(AppStrings.userTypes[1]),
                      onTap: () {
                        setState(() {
                          _userType = AppStrings.radioTypes[1];
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            TextField(
              decoration: AppStyles.inputDecoration.copyWith(hintText: AppStrings.email),
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: AppDimensions.d16),
            TextField(
              decoration: AppStyles.inputDecoration.copyWith(
                hintText: AppStrings.password,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscure = !_obscure;
                    });
                  },
                  icon: Icon(
                    _obscure ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.iconColor,
                  ),
                ),
              ),
              controller: _passwordController,
              keyboardType: TextInputType.text,
              obscureText: _obscure,
            ),
            SizedBox(height: AppDimensions.d32),
            MaterialButton(
              minWidth: AppDimensions.d128,
              height: AppDimensions.d48,
              color: AppColors.accentColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimensions.d8),
              ),
              child: Text(
                AppStrings.submit,
                style: AppStyles.textStyle.copyWith(color: AppColors.buttonTextColor),
              ),
              onPressed: () async {
                final String type = _userType as String;
                final String email = _emailController.text;
                final String password = _passwordController.text;

                if (email.length > 0 && password.length > 0) {

                  final GetAuthUser _getAuthUser = GetAuthUser(
                    authRepository: AuthRepositoryImpl(
                      authUserRemoteSource: AuthUserRemoteSourceImpl(),
                    ),
                  );

                  final response = await _getAuthUser.execute(
                    authObject: AuthObject(
                      type: type,
                      email: email,
                      password: password,
                    ),
                  );

                  if (response.isRight()) {
                    response.forEach((user) {
                      AppPreferences.logIn();
                      AppPreferences.setUser(user);
                      displayMessage(context, AppStrings.loginSuccessful + user.name.replaceRange(0, 1, user.name.substring(0, 1).toUpperCase()));
                      Navigator.pushReplacementNamed(context, AppRoutes.home);
                    });
                  } else if (response.isLeft()) {
                    displayMessage(context, AppStrings.loginFailed);
                  }
                } else {
                  displayMessage(context, AppStrings.inputsCannotBeEmpty);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

void displayMessage(BuildContext context, String message) {
  SnackBarMessage.displayMessage(context: context, message: message);
}
