import 'package:beehive_provider/extension/context_extension.dart';
import 'package:beehive_provider/ui/common/title_with_price_item.dart';
import 'package:beehive_provider/ui/order-detail/order_detail_screen_bloc.dart';
import 'package:beehive_provider/utils/app_strings.dart';
import 'package:beehive_provider/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../helper/dialog_helper.dart';
import '../main/navitem/order_screen.dart';

class OrderDetailScreen extends StatelessWidget {
  static const String route = 'order_detail_screen_route';

  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    final bloc = context.read<OrderDetailScreenBloc>();
    final dialogHelper = DialogHelper.instance();

    return Scaffold(
      bottomNavigationBar:bloc.isPriceOffer? Material(
        elevation: 6,
        color: Colors.white,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            width: 1, color: Constants.colorPrimary)),
                    child: const Text(AppText.DISCARD,
                        style: TextStyle(
                            fontSize: 14,
                            color: Constants.colorPrimary,
                            fontFamily: Constants.cairoRegular)),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    showPriceOfferBottomSheet(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border:
                            Border.all(width: 1, color: Constants.colorPrimary),
                        color: Constants.colorPrimary),
                    child: const Text(AppText.PRICE_OFFER,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: Constants.cairoRegular)),
                  ),
                ),
              )
            ],
          ),
        ),
      ):const SizedBox(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 22,
                          color: Constants.colorOnSecondary,
                        )),
                    const Text('Order ID #1234',
                        style: TextStyle(
                            color: Constants.colorOnSecondary,
                            fontSize: 16,
                            fontFamily: Constants.cairoBold)),
                    const SizedBox()
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Divider(
                  thickness: 1,
                  color: Constants.colorTextLight2,
                  height: 1,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border:
                        Border.all(width: 1, color: Constants.colorTextLight3)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(AppText.ORDER_ITEMS,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: Constants.cairoBold,
                                  color: Constants.colorOnSecondary)),
                          Text(' Hamada restaurant',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Constants.colorPrimary,
                                  fontFamily: Constants.cairoSemibold)),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios_rounded,
                              color: Constants.colorTextLight, size: 18)
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      height: 1,
                      color: Constants.colorTextLight3,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset('assets/home_image1.png',
                                      width: 50, height: 60)),
                              const SizedBox(width: 5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Beef burger',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Constants.colorOnSecondary,
                                          fontFamily: Constants.cairoSemibold)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text('Quantity ',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily:
                                                  Constants.cairoRegular,
                                              color: Constants.colorTextLight)),
                                      Text('2',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Constants.colorPrimary,
                                              fontFamily:
                                                  Constants.cairoRegular)),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('1.90',
                                  style: TextStyle(
                                      color: Constants.colorOnSecondary,
                                      fontSize: 14,
                                      fontFamily: Constants.cairoBold)),
                              Image.asset('assets/dollar.png',
                                  height: 10, width: 10),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(
                        thickness: 1,
                        height: 1,
                        color: Constants.colorTextLight3,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset('assets/home_image1.png',
                                      width: 50, height: 60)),
                              const SizedBox(width: 5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Beef burger',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Constants.colorOnSecondary,
                                          fontFamily: Constants.cairoSemibold)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text('Quantity ',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily:
                                                  Constants.cairoRegular,
                                              color: Constants.colorTextLight)),
                                      Text('2',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Constants.colorPrimary,
                                              fontFamily:
                                                  Constants.cairoRegular)),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('1.90',
                                  style: TextStyle(
                                      color: Constants.colorOnSecondary,
                                      fontSize: 14,
                                      fontFamily: Constants.cairoBold)),
                              Image.asset('assets/dollar.png',
                                  height: 10, width: 10),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 5),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border:
                        Border.all(width: 1, color: Constants.colorTextLight3)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(AppText.DELIVERY_ADDRESS,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Constants.colorOnSecondary,
                                  fontFamily: Constants.cairoBold)),
                          Icon(Icons.arrow_forward_ios_rounded,
                              color: Constants.colorTextLight, size: 18)
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      height: 1,
                      color: Constants.colorTextLight3,
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset('assets/map.png',
                              width: size.width,
                              height: 200,
                              fit: BoxFit.cover),
                          const Text('King Faisal Street, Riyadh, Saudi Arabia',
                              style: TextStyle(
                                  fontFamily: Constants.cairoRegular)),
                          const Text(
                            '+966567112233',
                            style:
                                TextStyle(fontFamily: Constants.cairoRegular),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border:
                    Border.all(width: 1, color: Constants.colorTextLight3)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(AppText.PICKUP_ADDRESS,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Constants.colorOnSecondary,
                                  fontFamily: Constants.cairoBold)),
                          Icon(Icons.arrow_forward_ios_rounded,
                              color: Constants.colorTextLight, size: 18)
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      height: 1,
                      color: Constants.colorTextLight3,
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset('assets/map.png',
                              width: size.width,
                              height: 200,
                              fit: BoxFit.cover),
                          const Text('King Faisal Street, Riyadh, Saudi Arabia',
                              style: TextStyle(
                                  fontFamily: Constants.cairoRegular)),
                          const Text(
                            '+966567112233',
                            style:
                            TextStyle(fontFamily: Constants.cairoRegular),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(AppText.NOTES,
                      style: TextStyle(
                          fontSize: 16,
                          color: Constants.colorOnSecondary,
                          fontFamily: Constants.cairoBold)),
                ),
              ),
              Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          width: 1, color: Constants.colorTextLight3)),
                  child: const Text(
                      'Lorem ipsum Lorem ipsumLorem ipsum Lorem ipsumLorem ipsum Lorem ipsumLorem ipsum Lorem ipsumLorem ipsum Lorem ipsumLorem ipsum Lorem ipsumLorem ipsum Lorem ipsum',
                      style: TextStyle(fontFamily: Constants.cairoRegular))),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border:
                        Border.all(width: 1, color: Constants.colorTextLight3)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text('Bill',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Constants.colorOnSecondary,
                                  fontFamily: Constants.cairoBold)),
                          Text(' Cash',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Constants.colorPrimary,
                                  fontFamily: Constants.cairoSemibold)),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      height: 1,
                      color: Constants.colorTextLight3,
                    ),
                    const TitleWithPriceItem(title: 'Order', value: '1.90'),
                    const TitleWithPriceItem(title: 'Fees', value: '1.90'),
                    const TitleWithPriceItem(
                        title: 'All',
                        value: '21.80',
                        style: TextStyle(
                            color: Constants.colorOnSecondary,
                            fontSize: 18,
                            fontFamily: Constants.cairoBold)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
