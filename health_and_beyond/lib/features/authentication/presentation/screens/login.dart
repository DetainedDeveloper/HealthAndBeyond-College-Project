import 'package:flutter/material.dart';
import 'package:health_and_beyond/features/authentication/presentation/widgets/login_form.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Image.asset(
          'assets/images/background.jpg',
          width: _size.width,
          height: _size.height,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            child: Center(
              child: LoginForm(),
            ),
          ),
        ),
      ],
    );
  }
}
