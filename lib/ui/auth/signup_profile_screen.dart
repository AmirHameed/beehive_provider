import 'package:beehive_provider/extension/context_extension.dart';
import 'package:beehive_provider/ui/auth/signup_profile_screen_bloc.dart';
import 'package:beehive_provider/ui/common/app_bar.dart';
import 'package:beehive_provider/ui/common/app_button.dart';
import 'package:beehive_provider/ui/common/app_text_field.dart';
import 'package:beehive_provider/ui/we_will_contact_screen.dart';
import 'package:beehive_provider/utils/app_strings.dart';
import 'package:beehive_provider/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SignUpProfileScreen extends StatelessWidget {
  static const String route = 'signup_profile_screen_route';

  const SignUpProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    final bloc = context.read<SignUpProfileScreenBloc>();

    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          const AppBarItem(title: AppText.CREATE_ACCOUNT),
          Align(
            alignment: Alignment.center,
            child: Stack(
                children: [
                  Image.asset('assets/profile_image.png', width: 90, height: 90),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                          onTap: () {
                            ImagePicker().pickImage(source: ImageSource.gallery);
                          },
                          child: Image.asset('assets/add_photo.png',
                              width: 30, height: 30)))
                ],
            ),
          ),

          const Text(AppText.FULL_NAME,
                style: TextStyle(
                    fontSize: 16,
                    color: Constants.colorOnSecondary,
                    fontFamily: Constants.cairoSemibold)),
          const AppTextField(
                hint: AppText.ENTER,
                textInputType: TextInputType.text,
                isError: false),
              const SizedBox(height: 10),

          const Text(AppText.EMAIL,
                style: TextStyle(
                    fontSize: 16,
                    color: Constants.colorOnSecondary,
                    fontFamily: Constants.cairoSemibold)),
          const AppTextField(
                hint: AppText.ENTER,
                textInputType: TextInputType.text,
                isError: false),
          const SizedBox(height: 10),

          const Text(AppText.MOBILE_NUMBER,
                style: TextStyle(
                    fontSize: 16,
                    color: Constants.colorOnSecondary,
                    fontFamily: Constants.cairoSemibold)),
          const AppTextField(
                hint: AppText.ENTER,
                textInputType: TextInputType.text,
                isError: false),
          const SizedBox(height: 10),

          const Text(AppText.PASSWORD,
                style: TextStyle(
                    fontSize: 16,
                    color: Constants.colorOnSecondary,
                    fontFamily: Constants.cairoSemibold)),
          const AppTextField(
                hint: AppText.ENTER,
                textInputType: TextInputType.text,
                isError: false),
          const SizedBox(height: 10),

          const Text(AppText.VEHICLE_TYPE,
                style: TextStyle(
                    fontSize: 16,
                    color: Constants.colorOnSecondary,
                    fontFamily: Constants.cairoSemibold)),
          const AppTextField(
                hint: AppText.CHOOSE,
                suffixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(Icons.keyboard_arrow_down_rounded,size: 22,color: Constants.colorTextLight),
                ),
                textInputType: TextInputType.text,
                isError: false),
          const SizedBox(height: 10),

          const Text(AppText.VEHICLE_PLATE_NUMBER,
                style: TextStyle(
                    fontSize: 16,
                    color: Constants.colorOnSecondary,
                    fontFamily: Constants.cairoSemibold)),
          const AppTextField(
                hint: AppText.ENTER,
                textInputType: TextInputType.text,
                isError: false),
          const SizedBox(height: 10),

          const Text(AppText.ID_PHOTO,
                style: TextStyle(
                    fontSize: 16,
                    color: Constants.colorOnSecondary,
                    fontFamily: Constants.cairoSemibold)),
           AppTextField(
                hint: 'Upload photo',
                suffixIcon: GestureDetector(
                  onTap: ()=>ImagePicker().pickImage(source: ImageSource.gallery),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Constants.colorLightPink,
                      borderRadius: BorderRadius.circular(15)
                    ),

                    child: const Text(AppText.UPLOAD,style: TextStyle(fontSize: 14,color: Constants.colorPrimary,fontFamily: Constants.cairoRegular)),
                  ),
                ),
                textInputType: TextInputType.text,
                isError: false),
          const SizedBox(height: 10),

          const Text(AppText.DRIVING_LICENSE,
              style: TextStyle(
                  fontSize: 16,
                  color: Constants.colorOnSecondary,
                  fontFamily: Constants.cairoSemibold)),
          AppTextField(
              hint: 'Upload photo',
              suffixIcon: GestureDetector(
                onTap: ()=>ImagePicker().pickImage(source: ImageSource.gallery),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Constants.colorLightPink,
                      borderRadius: BorderRadius.circular(15)
                  ),

                  child: const Text(AppText.UPLOAD,style: TextStyle(fontSize: 14,color: Constants.colorPrimary,fontFamily: Constants.cairoRegular)),
                ),
              ),
              textInputType: TextInputType.text,
              isError: false),
          const SizedBox(height: 10),

          const Text(AppText.VEHICLE_PHOTO,
              style: TextStyle(
                  fontSize: 16,
                  color: Constants.colorOnSecondary,
                  fontFamily: Constants.cairoSemibold)),
          AppTextField(
              hint: 'Upload photo',
              suffixIcon: GestureDetector(
                onTap: ()=>ImagePicker().pickImage(source: ImageSource.gallery),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Constants.colorLightPink,
                      borderRadius: BorderRadius.circular(15)
                  ),

                  child: const Text(AppText.UPLOAD,style: TextStyle(fontSize: 14,color: Constants.colorPrimary,fontFamily: Constants.cairoRegular)),
                ),
              ),
              textInputType: TextInputType.text,
              isError: false),
          const SizedBox(height: 10),

          const Text(AppText.PROVIDER_MEDICAL_CHECKUP,
              style: TextStyle(
                  fontSize: 16,
                  color: Constants.colorOnSecondary,
                  fontFamily: Constants.cairoSemibold)),
          AppTextField(
              hint: 'Upload photo',
              suffixIcon: GestureDetector(
                onTap: ()=>ImagePicker().pickImage(source: ImageSource.gallery),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Constants.colorLightPink,
                      borderRadius: BorderRadius.circular(15)
                  ),

                  child: const Text(AppText.UPLOAD,style: TextStyle(fontSize: 14,color: Constants.colorPrimary,fontFamily: Constants.cairoRegular)),
                ),
              ),
              textInputType: TextInputType.text,
              isError: false),
          const SizedBox(height: 10),


              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 20),
                child: SizedBox(
                    height: 60,
                    width: size.width,
                    child: AppButton(
                        onClick: () {
                          FocusScope.of(context).unfocus();
                          Navigator.pushNamed(context, WeWillContactYouScreen.route);
                        },
                        text: AppText.CREATE_ACCOUNT,
                        textColor: Constants.colorOnSurface,
                        borderRadius: 8.0,
                        fontSize: 16,
                        color: Constants.colorPrimary)),
              ),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(AppText.HAVE_AN_ACCOUNT,
                  style: TextStyle(
                      color: Constants.colorOnSecondary,
                      fontSize: 14,
                      fontFamily: Constants.cairoRegular)),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Text(AppText.LOGIN,
                    style: TextStyle(
                        color: Constants.colorPrimary,
                        fontSize: 14,
                        fontFamily: Constants.cairoRegular)),
              ),
            ],
          ),

          const SizedBox(height: 15)
      ],
    ),
            ),
          ),
        ));
  }
}
