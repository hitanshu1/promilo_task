part of 'Widgets.dart';
/// social login buttons that displays a row of social login buttons.
///
/// The row contains multiple social logo buttons, each representing a different social media platform.
/// Each button is created using the `_socialLogoButton` widget, which takes an `onPressed` callback
/// and an `assetsUrl` parameter to specify the image asset for the button.
///
/// The buttons are aligned using `MainAxisAlignment.center` to center them horizontally.
///
/// Returns:
///   A `Row` widget containing the social login buttons.
class SocialLoginButtons extends StatelessWidget {
  ///on login
  final Function(SocialLogins type)? onLogin;
  ///constructor
  const SocialLoginButtons({super.key, this.onLogin});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      _socialLogoButton(
        assetsUrl: Assets.google,
        onPressed: () => onLogin!(SocialLogins.google),
      ),
      _socialLogoButton(
        assetsUrl: Assets.linkedIn,
        onPressed: () => onLogin!(SocialLogins.linkedin),
      ),
      _socialLogoButton(assetsUrl: Assets.facebook
          ,onPressed: () => onLogin!(SocialLogins.facebook)),
      _socialLogoButton(assetsUrl: Assets.instagram
          ,onPressed: () => onLogin!(SocialLogins.instagram)),
      _socialLogoButton(assetsUrl: Assets.whatsapp,
          onPressed: () => onLogin!(SocialLogins.whatsapp)),
    ]);
  }

  /// Creates a social logo button widget.
  ///
  /// The social logo button is an [IconButton] widget that displays an [Icon]
  /// based on the provided [assetsUrl]. The [onPressed] callback is called
  /// when the button is pressed.
  ///
  /// Parameters:
  /// - `onPressed`: The callback function to be called when the button is pressed.
  /// - `assetsUrl`: The URL of the image asset to be displayed as the icon.
  ///
  /// Returns:
  /// - A [Widget] representing the social logo button.
  Widget _socialLogoButton({VoidCallback? onPressed, String? assetsUrl}) {
    return IconButton(
      icon: ViewAppImage(
        height: 40.sp,
        width: 40.sp,
        assetsUrl: assetsUrl,
      ),
      onPressed: onPressed,
    );
  }

}
