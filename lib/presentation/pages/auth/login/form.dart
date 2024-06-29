import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Extensions/Extensions.dart';
import '../../../../Widgets/Widgets.dart';
import '../../../../core/constants/constants.dart';
import '../../../bloc/login/bloc.dart';
import '../../../bloc/login/event.dart';
import '../../../bloc/login/state.dart';

/// login form containing email, password, and login button
class LoginForm extends StatefulWidget {
  /// constructor
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String? email ;
  String? password ;
  bool rememberMe = false;
  bool get isValid {
    if ((email?.isNotEmpty ?? false) && (password?.isNotEmpty ?? false)) {
      if (email!.isValidEmail) {
        return true;
      }
    }
    return false;
  }
  @override
  void initState() {
    if(Widgets.debugging){
    email = 'test45@yopmail.com';
    password = 'Test@123';
    setState(() {
      
    });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _emailOrMobNoTxtField(),
        _signInWithOtp(),
        _passwordTxtField(),
        SizeConfig.verticalSpace(),
        _rememberMeAndForgotPasswordRow(),
        SizeConfig.verticalSpace(),
        _submitButton(),
      ],
    );
  }

  // Returns a TxtField widget for entering email or mobile number text, with an onChanged function to update the email state.
  Widget _emailOrMobNoTxtField() {
    return TxtField(
        text: email,
        labelText: 'Please Sign in to continue',
        hintText: 'Enter Email or Mob No.',
        onChanged: (val) {
          setState(() {
            email = val;
          });
        });
  }

  /// Returns a widget that displays a text field for entering a password.
  ///
  /// The widget is a [TxtField] widget with the provided [text] as the initial value.
  /// The [hintText] is set to 'Enter Password'.
  /// The [onChanged] callback updates the [password] state with the new value.
  ///
  /// Returns:
  ///   A [TxtField] widget for entering a password.
  Widget _passwordTxtField() {
    return TxtField(
        text: password,
        labelText: 'Password',
        hintText: 'Enter Password',
        onChanged: (val) {
          setState(() {
            password = val;
          });
        });
  }

  Widget _signInWithOtp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TxtButton(
          text: 'Sign in with OTP',
          onPressed: () {},
        )
      ],
    );
  }

  ///   Returns a widget that displays a row with a checkbox, a text label, and a button.
  ///
  ///   The checkbox represents the "Remember Me" option and can be toggled on and off.
  ///   The text label displays the text "Remember Me".
  ///   The button displays the text "Forgot Password?" and triggers the `onPressed` callback when clicked.
  ///
  ///   @return {Widget} A row widget with a checkbox, a text label, and a button.
  ///
  Widget _rememberMeAndForgotPasswordRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: rememberMe,
              onChanged: (newValue) {
                setState(() {
                  rememberMe = newValue ?? false;
                });
              },
            ),
            const Text('Remember Me'),
          ],
        ),
        // const Spacer(),
        Flexible(
          child: TxtButton(
            textAlign: TextAlign.end,
            text: 'Forgot Password?',
            onPressed: () {
              // Handle Forgot Password
            },
          ),
        ),
      ],
    );
  }

  // Widget function that returns a BlocConsumer widget listening to LoginBloc and LoginState.
  Widget _submitButton() {
    return BlocConsumer<LoginBloc, LoginState>(
      builder: (context, state) {
        return Button.submit(
          isValid: isValid,
          submitFn: _onSubmit,
          showErrorFn: _invalidDetails,
        );
      },
      listener: (BuildContext context, LoginState state) {
        if (state is LoginFailure) {
          Widgets.showToast('Invalid ID Password');
        } else if (state is LoginSuccess) {
          // Navigate to the next screen
        }
      },
    );
  }

  void _onSubmit() {
    // Handles the submission process by checking if email and password are not empty, then triggers the LoginButtonPressed event with the provided email and password.
    context
        .read<LoginBloc>()
        .add(LoginButtonPressed(email: email!, password: password!,
        rememberMe: rememberMe));
  }

  /// Updates the [message] based on the validity of the [email] and [password].
  void _invalidDetails() {
     String message = 'Please Enter email';
  if (email?.isEmpty ?? true) {
    message = 'Please Enter email';
  } else if (!(email?.isValidEmail ?? false)) {
    message = 'Please Enter valid email';
  } else if (password?.isEmpty ?? true) {
    message = 'Please Enter password';
  }
  setState(() {
    
  });

  if (message.isNotEmpty) {
    Widgets.showToast(message);
  }
  }
}
