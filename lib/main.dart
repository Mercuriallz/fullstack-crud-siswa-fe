import 'package:belajarfullstack/bloc/siswa_bloc/add_siswa_bloc.dart';
import 'package:belajarfullstack/bloc/siswa_bloc/edit_siswa_bloc.dart';
import 'package:belajarfullstack/bloc/siswa_bloc/siswa_bloc.dart';
import 'package:belajarfullstack/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => SiswaCubit()),
      BlocProvider(create: (_) => AddSiswaCubit()),
      BlocProvider(create: (_) => EditSiswaCubit())
    ],
    child: const GetMaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}



