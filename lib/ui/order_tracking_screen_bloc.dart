import 'package:flutter_bloc/flutter_bloc.dart';

class OrderTrackingScreenBloc extends Cubit<int>{
  OrderTrackingScreenBloc():super(0);

  void updateTracking()=>emit(state+1);

}