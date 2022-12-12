import 'package:beehive_provider/data/meta_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SignUpProfileScreenBloc extends Cubit<DataEvent>{
  SignUpProfileScreenBloc():super(const Initial());

  void handleImageSelection(XFile file) => emit(Data(data: file));


}