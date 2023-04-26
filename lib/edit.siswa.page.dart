import 'package:belajarfullstack/bloc/siswa_bloc/edit_siswa_bloc.dart';
import 'package:belajarfullstack/home.dart';
import 'package:belajarfullstack/models/add_siswa_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as gets;
import 'package:get/get.dart';

class EditSiswaScreen extends StatefulWidget {
  final int? id;
  final String? nama;
  final int? kelas;
  final int? umur;
  final String? alamat;
  final int? statusSiswa;
  const EditSiswaScreen(
      {super.key,
      this.id,
      this.nama,
      this.kelas,
      this.umur,
      this.alamat,
      this.statusSiswa});

  @override
  State<EditSiswaScreen> createState() => _EditSiswaScreenState();
}

class _EditSiswaScreenState extends State<EditSiswaScreen> {
  TextEditingController nama = TextEditingController();
  TextEditingController kelas = TextEditingController();
  TextEditingController umur = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController statusSiswa = TextEditingController();

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
  void initState() {
    super.initState();
    nama.text = widget.nama ?? "";
    kelas.text = widget.kelas.toString() ?? "";
    umur.text = widget.umur.toString() ?? "";
    alamat.text = widget.alamat ?? "";
    statusSiswa.text = widget.statusSiswa.toString() ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<EditSiswaCubit, EditSiswaState>(
          listener: (context, stateListener) {
            if (stateListener is EditSiswaMessage) {
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
          child: SingleChildScrollView(
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
                    // onChanged: (value) {
                    //   setState(() {
                    //     nama.text = value;
                    //   });
                    // },
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
                    // onChanged: (value) {
                    //   setState(() {
                    //     kelas.text = value;
                    //   });
                    // },
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
                    controller: umur,
                    // onChanged: (value) {
                    //   setState(() {
                    //     umur.text = value;
                    //   });
                    // },
                    keyboardType: TextInputType.number,
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
                    // onChanged: (value) {
                    //   setState(() {
                    //     alamat.text = value;
                    //   });
                    // },
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
                    controller: statusSiswa,
                    // onChanged: (value) {
                    //   setState(() {
                    //     statusSiswa.text = value;
                    //   });
                    // },
                    keyboardType: TextInputType.number,
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
                          id: widget.id,
                          nama: nama.text,
                          kelas: int.parse(kelas.text.numericOnly()),
                          umur: int.parse(umur.text.toString().numericOnly()),
                          alamat: alamat.text,
                          statusSiswa: int.parse(statusSiswa.text));
                      context.read<EditSiswaCubit>().editSiswa(data);
                      print("DATA STATUS SISWA -> ${widget.id}");
                      print(data.nama);
                      print(data.kelas);
                      print(data.umur);
                      print(data.alamat);
                      print(data.statusSiswa);

                      Get.off(const Home());
                    },
                    child: const Text("Edit Siswa"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
