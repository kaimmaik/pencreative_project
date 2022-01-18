import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pencreative_project/logic/cubit/home_bloc.dart';
import 'package:pencreative_project/presentation/widgets/text_field.dart';
import 'package:sizer/sizer.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 105.0.sp),
        child: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              children: <Widget>[
                const TextFieldInput(hint: 'Email'),
                const TextFieldInput(hint: 'UserName'),
                const TextFieldInput(
                  hint: 'Password',
                ),
                SizedBox(
                  height: 1.0.h,
                ),
                MaterialButton(
                  height: 55,
                  child: const Text('have already an account? SignIn'),
                  onPressed: () {
                    BlocProvider.of<HomeBloc>(context)
                        // ignore: invalid_use_of_visible_for_testing_member
                        .emit(HomeLoadedState(hasAccount: true));
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
