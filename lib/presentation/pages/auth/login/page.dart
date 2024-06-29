import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Widgets/Widgets.dart';
import '../../../../core/constants/constants.dart';
import '../../../../data/models/Widgets/richString.dart';

import 'form.dart';

/// login page
class LoginPage extends StatelessWidget {
  ///constructor
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: SizeConfig.pagePadding,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _appName(),
                SizeConfig.verticalSpace(height: 60.sp),
                _subtile(),
                SizeConfig.verticalSpace(height: 40.sp),
                const LoginForm(),
                SizeConfig.verticalSpaceMedium(),
                _orDivider(),
                SizeConfig.verticalSpace(),
                SocialLoginButtons(
                  onLogin: (type){
                    print(type);
                  },
                ),
                SizeConfig.verticalSpace(),
                _businessUserLoginAndSignUp(),
                SizeConfig.verticalSpace(height: 40.sp),
                _termsAndConditions()
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Returns a widget that displays the app name.
  ///
  /// This widget is a [Widgets.heading] widget that displays the app name obtained from the [AppInfo.appName] constant.
  ///
  /// Returns:
  ///   A [Widgets.heading] widget displaying the app name.
  Widget _appName() {
    return Widgets.heading(text: AppInfo.appName);
  }

  Widget _subtile() {
    return Widgets.heading(
        text: 'Hi, Welcome Back!', fontSize: 20.sp, color: Colors.black87);
  }

  /// Returns a widget that displays a horizontal divider with the text 'or' in the center.
  ///
  /// The widget consists of a row with three equally spaced containers:
  /// - The first and third containers are empty and have a height of 1.sp and a color of grey.
  /// - The second container displays the text 'or' in the center.
  ///
  /// The row is wrapped in a padding widget with horizontal padding equal to twice the value of `SizeConfig.spaceBetween`.
  ///
  /// Returns:
  ///   A `Widget` representing the horizontal divider with the text 'or' in the center.
  Widget _orDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.spaceBetween * 2),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
          child: Container(
            height: 1.sp,
            color: Colors.grey,
          ),
        ),
        const SizedBox(width: 10),
         Txt('or',fontWeight: FontWeight.bold,
        fontSize: 15.sp,),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 1.sp,
            color: Colors.grey,
          ),
        ),
      ]),
    );
  }

  /// Returns a widget that displays a row with two [RichTxt] widgets.
  ///
  /// The first [RichTxt] widget displays the text "Business User?" in black color and the text "Login Here" in blue color.
  /// The second [RichTxt] widget displays the text "Don't have an account?" in black color and the text "Sign Up" in blue color.
  ///
  /// The widget is aligned to the center of the row.
  ///
  /// Returns:
  ///   A [Row] widget with two [RichTxt] widgets.
  Widget _businessUserLoginAndSignUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichTxt(
          textAlign: TextAlign.left,
          richStrings: [
            const RichString('Business User?\n', color: Colors.black),
            RichString('Login Here',
                color: Colors.blue, fontWeight: FontWeight.bold, onTap: () {}),
          ],
        ),
        RichTxt(textAlign: TextAlign.end, richStrings: [
          const RichString("Don't have an account? \n", color: Colors.black),
          RichString('Sign Up',
              color: Colors.blue, fontWeight: FontWeight.bold, onTap: () {})
        ])
      ],
    );
  }

  /// Returns a widget that displays the terms and conditions.
  ///
  /// The widget is a [RichTxt] widget with the text "By continuing you agree to" followed by the app name obtained from the [AppInfo.appName] constant. The text is displayed in grey color.
  /// The second [RichString] widget displays the text "Terms & Conditions" in black color and triggers the `onTap` callback when clicked.
  ///
  /// Returns:
  ///   A [RichTxt] widget displaying the terms and conditions.
  Widget _termsAndConditions() {
    return RichTxt(textAlign: TextAlign.center, richStrings: [
      const RichString('By continuing you agree to\n ${AppInfo.appName}',
          color: Colors.grey),
      RichString('Terms & Conditions', color: Colors.black, onTap: () {})
    ]);
  }
}
