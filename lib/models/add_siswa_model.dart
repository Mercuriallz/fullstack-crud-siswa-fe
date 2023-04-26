class AddSiswaModels {
  int? id;
  String? nama;
  int? kelas;
  int? umur;
  String? alamat;
  int? statusSiswa;

  AddSiswaModels(
      {this.id,
      this.nama,
      this.kelas,
      this.umur,
      this.alamat,
      this.statusSiswa});

  AddSiswaModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    kelas = json['kelas'];
    umur = json['umur'];
    alamat = json['alamat'];
    statusSiswa = json['status_siswa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = nama;
    data['kelas'] = kelas;
    data['umur'] = umur;
    data['alamat'] = alamat;
    data['status_siswa'] = statusSiswa;
    return data;
  }
}
