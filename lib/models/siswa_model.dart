class SiswaStatusModel {
  List<Siswa>? siswa;

  SiswaStatusModel({this.siswa});

  SiswaStatusModel.fromJson(Map<String, dynamic> json) {
    if (json['siswa'] != null) {
      siswa = <Siswa>[];
      json['siswa'].forEach((v) {
        siswa!.add(Siswa.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (siswa != null) {
      data['siswa'] = siswa!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Siswa {
  String? id;
  String? nama;
  String? kelas;
  String? statusAktifSiswa;

  Siswa({this.id, this.nama, this.kelas, this.statusAktifSiswa});

  Siswa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    kelas = json['kelas'];
    statusAktifSiswa = json['status_aktif_siswa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = nama;
    data['kelas'] = kelas;
    data['status_aktif_siswa'] = statusAktifSiswa;
    return data;
  }
}
