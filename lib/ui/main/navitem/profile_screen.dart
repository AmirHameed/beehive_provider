import 'package:beehive_provider/extension/context_extension.dart';
import 'package:beehive_provider/ui/common/app_button.dart';
import 'package:beehive_provider/ui/my_information_screen.dart';
import 'package:beehive_provider/ui/reviews_screen.dart';
import 'package:beehive_provider/ui/setting/setting_screen.dart';
import 'package:beehive_provider/utils/app_strings.dart';
import 'package:beehive_provider/utils/constants.dart';
import 'package:flutter/material.dart';

class ProfileNavigationItemScreen extends StatelessWidget {
  static const String key_title = 'profile_nav_screen_key_title';
  const ProfileNavigationItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const SizedBox(height: 10),
        const Text(AppText.PROFILE,
            style: TextStyle(
                color: Constants.colorOnSecondary,
                fontSize: 16,
                fontFamily: Constants.cairoBold)),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Divider(
            thickness: 1,
            color: Constants.colorTextLight2,
            height: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
              child: Stack(
            children: [
              Image.asset('assets/home_location_header.png'),
              Positioned(
                left: 10,
                top: 15,
                right: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text('Your Balance',
                            style: TextStyle(
                                color: Constants.colorOnPrimary,
                                fontSize: 12,
                                fontFamily: Constants.cairoRegular)),
                        Text('234.34\$',
                            style: TextStyle(
                                color: Constants.colorOnPrimary,
                                fontSize: 15,
                                fontFamily: Constants.cairoBold))
                      ],
                    ),
                    const Text('Withdraw',
                        style: TextStyle(
                            color: Constants.colorOnPrimary,
                            fontSize: 12,
                            fontFamily: Constants.cairoRegular)),
                  ],
                ),
              )
            ],
          )),
        ),
        const SizedBox(height: 10),
        _SingleProfileItemNavigation(
            title: AppText.MY_INFORMATION,
            image: 'assets/user-square.png',
            onTap: () =>Navigator.pushNamed(context, MyInformationScreen.route)),

        _SingleProfileItemNavigation(
            title: AppText.SETTINGS, image: 'assets/setting-2@2x.png', onTap: () {
              Navigator.pushNamed(context, SettingScreen.route);
        }),

        _SingleProfileItemNavigation(
            title: AppText.CONTACT_US,
            image: 'assets/call_tracking.png',
            onTap: () =>showContactInformationBottomSheet(context)),
        _SingleProfileItemNavigation(
            title: AppText.MY_REVIEWS,
            image: 'assets/full.png',
            onTap: () => Navigator.pushNamed(context, ReviewsScreen.route)),

      _SingleProfileItemNavigation(
          title: AppText.BANK_DETAILS,
          image: 'assets/bank.png',
          onTap: () => showBankInformationBottomSheet(context)),
    ]);
  }
}

class _SingleProfileItemNavigation extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;

  const _SingleProfileItemNavigation(
      {required this.title, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        onTap: onTap,
        title: Text(title,
            style: const TextStyle(
                color: Constants.colorOnSecondary, fontSize: 16, fontFamily: Constants.cairoRegular)),
        leading: Image.asset(image, height: 25, width: 25,color: Colors.black),
        trailing: const Icon(Icons.arrow_forward_ios_rounded,
            size: 20, color: Constants.colorTextLight),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Constants.colorTextLight2, width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}


showBankInformationBottomSheet(BuildContext context) {
  final _formkey = GlobalKey<FormState>();
  final size = context.screenSize;

  return showModalBottomSheet(
    context: context,
    enableDrag: true,
    isScrollControlled: true,
    constraints: BoxConstraints(minHeight: size.height/1.4,maxHeight: size.height/1.4),
    isDismissible: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
    ),
    builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Constants.colorTextLight2,
            ),
            width: 40,
            height: 6,
          ),
          const Text(AppText.BANK_DETAILS,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: Constants.cairoSemibold,
                  color: Constants.colorOnSecondary)),
          Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(AppText.BANK_NAME,
                      style: TextStyle(
                          fontSize: 14, color: Constants.colorOnSecondary, fontFamily: Constants.cairoRegular)),
                  Container(
                      height: 48,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      margin: const EdgeInsets.only(
                          bottom: 20, top: 10, left: 0, right: 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: Constants.colorTextLight)),
                      child: TextFormField(
                          controller: TextEditingController(),
                          onChanged: (String? value) {},
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                              color: Constants.colorOnSecondary, fontSize: 14),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: 'Enter',
                              hintStyle: TextStyle(
                                  color: Constants.colorTextLight,
                                  fontFamily: Constants.cairoRegular,
                                  fontSize: 13)))),
                  const Text(AppText.ACCOUNT_TITLE,
                      style: TextStyle(
                          fontSize: 14, color: Constants.colorOnSecondary, fontFamily: Constants.cairoRegular)),
                  Container(
                      height: 48,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      margin: const EdgeInsets.only(
                          bottom: 20, top: 10, left: 0, right: 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: Constants.colorTextLight)),
                      child: TextFormField(
                          controller: TextEditingController(),
                          onChanged: (String? value) {},
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                              color: Constants.colorOnSecondary, fontSize: 14),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: 'Enter',
                              hintStyle: TextStyle(
                                  color: Constants.colorTextLight,
                                  fontFamily: Constants.cairoRegular,
                                  fontSize: 13)))),
                  const Text(AppText.ACCOUNT_NUMBER,
                      style: TextStyle(
                          fontSize: 14, color: Constants.colorOnSecondary, fontFamily: Constants.cairoRegular)),
                  Container(
                      height: 48,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      margin: const EdgeInsets.only(
                          bottom: 20, top: 10, left: 0, right: 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: Constants.colorTextLight)),
                      child: TextFormField(
                          controller: TextEditingController(),
                          onChanged: (String? value) {},
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                              color: Constants.colorOnSecondary, fontSize: 14),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: 'Enter',
                              hintStyle: TextStyle(
                                  color: Constants.colorTextLight,
                                  fontFamily: Constants.cairoRegular,
                                  fontSize: 13)))),

                  const Text(AppText.IBAN,
                      style: TextStyle(
                          fontSize: 14, color: Constants.colorOnSecondary, fontFamily: Constants.cairoRegular)),
                  Container(
                      height: 48,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      margin: const EdgeInsets.only(
                          bottom: 20, top: 10, left: 0, right: 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: Constants.colorTextLight)),
                      child: TextFormField(
                          controller: TextEditingController(),
                          onChanged: (String? value) {},
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                              color: Constants.colorOnSecondary, fontSize: 14),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: 'Enter',
                              hintStyle: TextStyle(
                                  color: Constants.colorTextLight,
                                  fontFamily: Constants.cairoRegular,
                                  fontSize: 13)))),

                  SizedBox(
                      height: 48,
                      width: size.width,
                      child: AppButton(
                          onClick: () {
                            FocusScope.of(context).unfocus();
                          },
                          text: AppText.SAVE,
                          textColor: Constants.colorOnSurface,
                          borderRadius: 8.0,
                          fontSize: 16,
                          color: Constants.colorPrimary)),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}
showContactInformationBottomSheet(BuildContext context) {
  final size = context.screenSize;

  return showModalBottomSheet(
    context: context,
    enableDrag: true,
    isDismissible: true,
    isScrollControlled: true,
    constraints: BoxConstraints(minHeight: size.height/1.4,maxHeight: size.height/1.4),
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Constants.colorTextLight2,
              ),
              width: 40,
              height: 6,
            ),
            const Text(AppText.CONTACT_US,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: Constants.cairoSemibold,
                    color: Constants.colorOnSecondary)),
            const SizedBox(height: 20),
            const Image(image: AssetImage('assets/contact_image.png'),width: 188,height: 188,),

            const SizedBox(height: 20),

            const Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: Constants.cairoRegular,
                    color: Constants.colorOnSecondary)),
            const SizedBox(
              height: 20),

            SizedBox(
              height: 48,
              width: size.width,
              child: RawMaterialButton(
                  constraints: const BoxConstraints(minHeight: 44, maxHeight: 44),
                  fillColor:Constants.colorPrimary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  onPressed: () {},
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/contact_message.png',width: 22,height: 22),
                        const SizedBox(width:  5),
                        const Padding(
                          padding: EdgeInsets.only(right: 22),
                          child: Text(AppText.CONTACT_VIA_EMAIL,
                              style: TextStyle(
                                  color: Constants.colorOnPrimary,
                                  fontFamily: Constants.cairoMedium,
                                  fontSize: 14)),
                        )
                      ])),
            ),
            const SizedBox(height: 10),
            SizedBox(
                height: 48,
                width: size.width,
                child: IconAppButton(
                    onClick: () {},
                    prefixIcon: Image.asset('assets/contact_watsapp.png',width: 30,height: 22),
                    text: AppText.CONTACT_VIA_WHATSAPP,
                    textColor: Constants.colorOnPrimary,
                    borderRadius: 8.0,
                    fontSize: 14,
                    color:  Constants.colorPrimary))
          ],
        ),
      );
    },
  );
}
