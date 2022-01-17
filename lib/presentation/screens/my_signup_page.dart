import 'package:flutter/material.dart';
import 'package:pencreative_project/presentation/widgets/signup_widget.dart';

class MySignUpPage extends StatelessWidget {
  const MySignUpPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: const SignUpWidget(),
    );
  }
}
