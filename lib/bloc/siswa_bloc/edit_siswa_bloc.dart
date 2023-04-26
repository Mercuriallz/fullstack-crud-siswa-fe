import 'package:belajarfullstack/models/add_siswa_model.dart';
import 'package:belajarfullstack/repo/siswa_repo/siswa.repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class EditSiswaState extends Equatable {
  @override
  List<Object> get props => [];
}

class EditSiswaLoading extends EditSiswaState {}

class EditSiswaMessage extends EditSiswaState {}

class EditSiswaFailedMessage extends EditSiswaState {
  final String message;

  EditSiswaFailedMessage(this.message);
}

class EditSiswaCubit extends Cubit<EditSiswaState> {
  EditSiswaCubit() : super(EditSiswaLoading());

  void editSiswa(AddSiswaModels data) async {
    var responseCreate = await SiswaRepository().editSiswa(data);
    print('daTA --> ${responseCreate.data}');
    if (responseCreate.statusCode == 201) {
      emit(EditSiswaMessage());
    } else {
    }
  }
}
