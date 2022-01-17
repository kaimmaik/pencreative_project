import 'package:flutter/material.dart';
import 'package:pencreative_project/presentation/widgets/text_field.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 300),
      child: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            children: <Widget>[
              const TextFieldInput(hint: 'UserName'),
              const TextFieldInput(
                hint: 'Password',
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                height: 55,
                child: const Text('Login'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}