import 'package:beehive_provider/extension/context_extension.dart';
import 'package:beehive_provider/ui/auth/login_screen.dart';
import 'package:beehive_provider/ui/main/main_screen.dart';
import 'package:beehive_provider/utils/app_strings.dart';
import 'package:beehive_provider/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WeWillContactYouScreen extends StatelessWidget {
  static const String route = 'we_will_contact_you_screen';

  const WeWillContactYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;

    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  'assets/we_will_contact.png',
                  width: 90,
                  height: 90,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 20),
                const Text(AppText.WE_WILL_CONTACT_YOU_SOON,
                    style: TextStyle(
                        fontSize: 14,
                        color: Constants.colorOnSecondary,
                        fontFamily: Constants.cairoBold)),
                const SizedBox(height: 12),
                const Text(AppText.YOU_WILL_RECEIVED_AN_EMAIL_WITHIN_24,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12,
                        color: Constants.colorOnSecondary,
                        fontFamily: Constants.cairoRegular)),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                  onTap: () => Navigator.pushNamedAndRemoveUntil(context, LoginScreen.route, (route) => false),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 22,
                      color: Constants.colorOnSecondary,
                    ),
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}
