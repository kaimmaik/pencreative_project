import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pencreative_project/logic/cubit/home_bloc.dart';
import 'package:pencreative_project/presentation/widgets/text_field.dart';
import 'package:sizer/sizer.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 150.0.sp),
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
                  child: const Text('New here ? SignIn'),
                  onPressed: () {
                    BlocProvider.of<HomeBloc>(context)
                        // ignore: invalid_use_of_visible_for_testing_member
                        .emit(HomeLoadedState(hasAccount: false));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
