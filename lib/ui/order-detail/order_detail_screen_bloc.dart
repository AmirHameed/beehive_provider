import 'package:beehive_provider/ui/order-detail/order_detail_screen_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderDetailScreenBloc extends Cubit<OrderDetailScreenBlocState> {
  final  bool isPriceOffer;

  OrderDetailScreenBloc({required this.isPriceOffer}) : super(const OrderDetailScreenBlocState.initial(isDeliveryPayment: true));
}
