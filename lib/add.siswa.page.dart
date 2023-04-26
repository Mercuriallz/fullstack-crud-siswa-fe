import 'package:belajarfullstack/bloc/siswa_bloc/add_siswa_bloc.dart';
import 'package:belajarfullstack/home.dart';
import 'package:belajarfullstack/models/add_siswa_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as gets;
import 'package:get/get.dart';

class AddSiswaScreen extends StatefulWidget {
  const AddSiswaScreen({super.key});

  @override
  State<AddSiswaScreen> createState() => _AddSiswaScreenState();
}

class _AddSiswaScreenState extends State<AddSiswaScreen> {
  final nama = TextEditingController();
  final kelas = TextEditingController();
  final umur = TextEditingController();
  final alamat = TextEditingController();
  final statusSiswa = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nama.dispose();
    kelas.dispose();
    umur.dispose();
    alamat.dispose();
    statusSiswa.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<AddSiswaCubit,AddSiswaState>(
          listener: (context,stateListener){
              if(stateListener is AddSiswaMessage) {
                 gets.Get.snackbar("Successs add siswa", "mantep",
            snackPosition: gets.SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 1));
              } else {
                gets.Get.snackbar("Cannot add siswa", "check your data",
            snackPosition: gets.SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 1));
              }
          },
          child:   SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 15, left: 15, top: 8, bottom: 15),
                    child: TextFormField(
                      controller: nama,
                      decoration: InputDecoration(
                          hintText: "Nama Siswa",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 15, left: 15, top: 8, bottom: 15),
                    child: TextFormField(
                      controller: kelas,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "Kelas",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 15, left: 15, top: 8, bottom: 15),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: umur,
                      decoration: InputDecoration(
                          hintText: "Umur",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 15, left: 15, top: 8, bottom: 15),
                    child: TextFormField(
                      controller: alamat,
                      decoration: InputDecoration(
                          hintText: "Alamat",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 15, left: 15, top: 8, bottom: 15),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: statusSiswa,
                      decoration: InputDecoration(
                          hintText: "Status Siswa",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var data = AddSiswaModels(
                            nama: nama.text,
                            kelas: int.parse(kelas.text.numericOnly()),
                            umur: int.parse(umur.text.toString().numericOnly()),
                            alamat: alamat.text,
                            statusSiswa: int.parse(statusSiswa.text));
                        context.read<AddSiswaCubit>().createSiswa(data);
                        print("DATA STATUS SISWA -> ${data.statusSiswa}");
                        print(data.nama);
                        Get.off(const Home());
                      },
                      child: const Text("Tambah Siswa"))
                ],
              ),
            ),
        ),
      ),
    );
  }
}
