import 'package:beehive_provider/extension/context_extension.dart';
import 'package:beehive_provider/ui/auth/login_screen.dart';
import 'package:beehive_provider/ui/common/app_bar.dart';
import 'package:beehive_provider/ui/common/app_button.dart';
import 'package:beehive_provider/utils/app_strings.dart';
import 'package:beehive_provider/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyInformationScreen extends StatelessWidget {
  static const String route = 'my_information_screen_route';

  const MyInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: AppBarItem(title: AppText.MY_INFORMATION),
            ),
            Stack(
              children: [
                Image.asset('assets/profile.png', width: 90, height: 90),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                        onTap: () {
                          ImagePicker().pickImage(source: ImageSource.gallery);
                        },
                        child: Image.asset('assets/edit_profile.png',
                            width: 30, height: 30)))
              ],
            ),
            const SizedBox(height: 10),
            _SingleProfileItemNavigation(
              title: AppText.FULL_NAME,
              name: 'Amir Hameed',
              onTap: () {
                showChangeInformationBottomSheet(context,AppText.FULL_NAME,AppText.CHANGE_FULL_NAME,'Amir Hameed');
              },
            ),
            _SingleProfileItemNavigation(
                title: AppText.EMAIL,
                name: 'Amir@gmail.com',
                onTap: () {
                  showChangeInformationBottomSheet(context,AppText.EMAIL,AppText.CHANGE_EMAIL,'Amir@gmail.com');
                }),
            _SingleProfileItemNavigation(
                title: AppText.MOBILE_NUMBER, name: '123456789', onTap: () {
              showChangeInformationBottomSheet(context,AppText.MOBILE_NUMBER,AppText.CHANGE_MOBILE_NUMBER,'123456789');

            }),
            _SingleProfileItemNavigation(
                title: 'Password',
                name: '************',
                onTap: () {
                  showChangePasswordInformationBottomSheet(context);
                }),

            _SingleProfileItemNavigation(
                title: AppText.VEHICLE_TYPE,
                name: 'viat',
                isChange: false,
                onTap: () {
                  // showChangeInformationBottomSheet(context,AppText.EMAIL,AppText.CHANGE_EMAIL,'Amir@gmail.com');
                }),

            _SingleProfileItemNavigation(
                title: AppText.VEHICLE_PLATE_NUMBER,
                name: '1234567',
                isChange: false,
                onTap: () {
                  // showChangeInformationBottomSheet(context,AppText.EMAIL,AppText.CHANGE_EMAIL,'Amir@gmail.com');
                }),

            _SingleProfileItemNavigation(
                title: AppText.DRIVING_LICENSE,
                name: 'Photo.pdf',
                isChange: false,
                onTap: () {
                  // showChangeInformationBottomSheet(context,AppText.EMAIL,AppText.CHANGE_EMAIL,'Amir@gmail.com');
                }),
            _SingleProfileItemNavigation(
                title: AppText.VEHICLE_PHOTO,
                name: 'Photo.pdf',
                isChange: false,
                onTap: () {
                  // showChangeInformationBottomSheet(context,AppText.EMAIL,AppText.CHANGE_EMAIL,'Amir@gmail.com');
                }),
            _SingleProfileItemNavigation(
                title: AppText.PROVIDER_MEDICAL_CHECKUP,
                name: 'Photo.pdf',
                isChange: false,
                onTap: () {
                  // showChangeInformationBottomSheet(context,AppText.EMAIL,AppText.CHANGE_EMAIL,'Amir@gmail.com');
                }),



            const SizedBox(height: 20),
            GestureDetector(
              onTap: ()=>Navigator.pushNamedAndRemoveUntil(context, LoginScreen.route, (route) => false),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(AppText.LOGOUT,
                      style: TextStyle(
                          fontSize: 14,
                          color: Constants.colorOnSecondary,
                          fontFamily: Constants.cairoSemibold)),
                  Image.asset('assets/logout@2x.png', width: 25)
                ],
              ),
            ),
            const SizedBox(height: 20)
          ]),
        ),
      ),
    );
  }
}

class _SingleProfileItemNavigation extends StatelessWidget {
  final String title;
  final String name;
  final bool isChange;
  final VoidCallback onTap;

  const _SingleProfileItemNavigation(
      {required this.title, required this.name, required this.onTap,this.isChange=true});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: Constants.colorTextLight2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Constants.colorOnSecondary,
                      fontFamily: Constants.cairoSemibold)),
              Text(name,
                  style: const TextStyle(
                      fontSize: 14, color: Constants.colorTextLight, fontFamily: Constants.cairoRegular)),
            ],
          ),
          isChange?GestureDetector(
            onTap: onTap,
            child: const Text('Change',
                style: TextStyle(
                    fontSize: 14,
                    color: Constants.colorPrimary,
                    fontFamily: Constants.cairoRegular)),
          ):const SizedBox(),
        ],
      ),
    );
  }
}

showChangeInformationBottomSheet(
    BuildContext context, String title, String header, String text) {
  final _formkey = GlobalKey<FormState>();
  final size = context.screenSize;

  return showModalBottomSheet(
    context: context,
    enableDrag: true,
    isDismissible: true,
    isScrollControlled: true,
    constraints: BoxConstraints(minHeight: size.height/2.9,maxHeight: size.height/2.9),
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
          const SizedBox(
            height: 10,
          ),
          Text(header,
              style: const TextStyle(
                  fontSize: 16,
                  color: Constants.colorOnSecondary,
                  fontFamily: Constants.cairoSemibold)),
          Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
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
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: text,
                              hintStyle: const TextStyle(
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

showChangePasswordInformationBottomSheet(BuildContext context) {
  final _formkey = GlobalKey<FormState>();
  final size = context.screenSize;

  return showModalBottomSheet(
    context: context,
    enableDrag: true,
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
          const Text(AppText.CHANGE_PASSWORD,
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
                  const Text(AppText.CURRENT_PASSWORD,
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
                              suffixIcon: Icon(Icons.remove_red_eye_rounded,
                                  color: Constants.colorTextLight, size: 22),
                              focusedBorder: InputBorder.none,
                              hintText: 'Enter',
                              hintStyle: TextStyle(
                                  color: Constants.colorTextLight,
                                  fontFamily: Constants.cairoRegular,
                                  fontSize: 13)))),
                  const Text(AppText.NEW_PASSWORD,
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
                              suffixIcon: Icon(Icons.remove_red_eye_rounded,
                                  color: Constants.colorTextLight, size: 22),
                              focusedBorder: InputBorder.none,
                              hintText: 'Enter',
                              hintStyle: TextStyle(
                                  color: Constants.colorTextLight,
                                  fontFamily: Constants.cairoRegular,
                                  fontSize: 13)))),
                  const Text(AppText.CONFIRM_NEW_PASSWORD,
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
                              suffixIcon: Icon(Icons.remove_red_eye_rounded,
                                  color: Constants.colorTextLight, size: 22),
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
