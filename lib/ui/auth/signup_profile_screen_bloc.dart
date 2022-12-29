import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class SignUpProfileScreenBloc extends Cubit<bool>{
  final TextEditingController vehicleTextController = TextEditingController();
  SignUpProfileScreenBloc():super(true);

  // void handleImageSelection(XFile file) => emit(Data(data: file));

  void togglePasswordObscure() =>
      emit(!state);

}