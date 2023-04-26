import 'package:belajarfullstack/models/add_siswa_model.dart';
import 'package:belajarfullstack/repo/siswa_repo/siswa.repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


abstract class AddSiswaState extends Equatable {
  @override
  List<Object> get props => [];
}

class AddSiswaLoading extends AddSiswaState {}

class AddSiswaMessage extends AddSiswaState {}

class AddSiswaFailedMessage extends AddSiswaState {
  final String message;

  AddSiswaFailedMessage(this.message);
}

class AddSiswaCubit extends Cubit<AddSiswaState> {
  AddSiswaCubit() : super(AddSiswaLoading());
  void createSiswa(AddSiswaModels data) async {
    var responseCreate = await SiswaRepository().addSiswa(data);
    if (responseCreate.statusCode == 200) {
      emit(AddSiswaMessage());
    } else {
      emit(AddSiswaFailedMessage(responseCreate.data));
    }
  }
}
