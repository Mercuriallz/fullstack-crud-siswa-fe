import 'package:belajarfullstack/add.siswa.page.dart';
import 'package:belajarfullstack/bloc/siswa_bloc/siswa_bloc.dart';
import 'package:belajarfullstack/edit.siswa.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    getSiswa();
  }

  void getSiswa() async {
    context.read<SiswaCubit>().loadSiswa();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<SiswaCubit, SiswaState>(
            builder: (context, stateSiswa) {
              if (stateSiswa is SiswaLoaded) {
                return Column(
                  children: [
                    ListView.builder(
                        itemCount: stateSiswa.data.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, i) {
                          var siswa = stateSiswa.data[i];
                          return Card(
                            child: ListTile(
                                title: Text(siswa.nama.toString()),
                                leading: Text(siswa.kelas.toString()),
                                subtitle:
                                    Text(siswa.statusAktifSiswa.toString()),
                                isThreeLine: true,
                                trailing: InkWell(
                                  onTap: () {
                                    showAlertDialog(context, siswa.id.toString(), siswa.nama.toString(), siswa.kelas.toString());
                                  },
                                  child: Icon(Icons.more_vert),
                                )),
                          );
                        }),
                    FloatingActionButton(
                      onPressed: () {
                        Get.to(const AddSiswaScreen());
                      },
                      child: const Icon(Icons.add),
                    )
                  ],
                );
              } else {
                return Text(stateSiswa.toString());
              }
            },
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, String id, String nama, String kelas) {
    Widget deleteButton = IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.delete,
          color: Colors.red,
          size: 28,
        ));

    Widget editButton = IconButton(
        onPressed: () {
          Get.to( EditSiswaScreen(
            id: int.parse(id),
            nama: nama,
            kelas: int.parse(kelas),
          ));
        },
        icon: Icon(
          Icons.edit,
          color: Colors.blue[400],
          size: 28,
        ));

    AlertDialog alert = AlertDialog(
      title: const Center(child: Text("Apa yang anda ingin lakukan ?")),
      actions: [deleteButton, editButton],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
