import 'package:beehive_provider/extension/context_extension.dart';
import 'package:beehive_provider/ui/main/main_screen_bloc.dart';
import 'package:beehive_provider/ui/main/main_screen_state.dart';
import 'package:beehive_provider/ui/main/navitem/order_screen.dart';
import 'package:beehive_provider/ui/order-detail/order_detail_screen.dart';
import 'package:beehive_provider/utils/app_strings.dart';
import 'package:beehive_provider/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeNavigationItemScreen extends StatelessWidget {
  static const String key_title = 'Home_navigation_detail_screen_key_title';

  const HomeNavigationItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    final bloc = context.read<MainScreenBloc>();

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, ProfileScreen.route);
              },
              child: Image.asset(
                'assets/profile.png',
                width: 30,
                height: 30,
              ),
            ),
            const Spacer(),
            const Text('Hello!',
                style:
                    TextStyle(fontSize: 16, fontFamily: Constants.cairoBold)),
            const SizedBox(width: 5),
            const Icon(Icons.menu, color: Constants.colorOnSecondary, size: 28),
          ],
        ),
      ),
      const Divider(
        thickness: 1,
        color: Constants.colorTextLight2,
        height: 1,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(AppText.LATEST_ORDER,
                style: TextStyle(fontSize: 14, fontFamily: Constants.cairoBold)),
            Text(AppText.VIEW_ALL,
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: Constants.cairoMedium,
                    color: Color(0xff6D6D6D))),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1, color: Constants.colorTextLight2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(AppText.STORE_STATUS,
                style: TextStyle(
                    fontSize: 16,
                    color: Constants.colorOnSecondary,
                    fontFamily: Constants.cairoSemibold)),
            BlocBuilder<MainScreenBloc, MainScreenState>(
              builder: (_, state) => Transform.scale(
                scale: 0.8,
                child: CupertinoSwitch(
                  value: state.isStore,
                  onChanged: (value) => bloc.updateStoreStatus(value),
                  activeColor: Constants.colorGreen,
                ),
              ),
            )
          ],
        ),
      ),
      Expanded(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, OrderDetailScreen.route,
                          arguments: [false, false, true]),
                      child: const SingleOrderItemWidget(title: AppText.NEW)),
                  GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, OrderDetailScreen.route,
                          arguments: [false, false, true]),
                      child: const SingleOrderItemWidget(title: AppText.NEW)),
                ],
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
