import 'package:belajarfullstack/repo/siswa_repo/siswa.repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:belajarfullstack/models/siswa_model.dart';

abstract class SiswaState extends Equatable {
  @override
  List<Object> get props => [];
}

class SiswaLoading extends SiswaState {}

class SiswaLoaded extends SiswaState {
  final List<Siswa> data;

  SiswaLoaded(this.data);

  @override
  List<Object> get props => [data];
}

class SiswaEmpty extends SiswaState {}

class SiswaError extends SiswaState {
  final String message;

  SiswaError(this.message);

  @override
  List<Object> get props => [message];
}

class SiswaCubit extends Cubit<SiswaState> {
  SiswaCubit() : super(SiswaLoading());

  void loadSiswa() async {
    var response = await SiswaRepository().loadSiswa();
    try {
      if (response.isNotEmpty) {
        emit(SiswaLoaded(response));
      } else {
        emit(SiswaEmpty());
      }
    } catch (e) {
      emit(SiswaError(e.toString()));
      (e);
    }
  }
}
