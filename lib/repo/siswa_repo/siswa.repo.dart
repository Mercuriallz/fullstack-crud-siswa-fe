import 'package:belajarfullstack/models/add_siswa_model.dart';
import 'package:dio/dio.dart';
import 'package:belajarfullstack/models/siswa_model.dart';

class SiswaRepository {
  Future<Response> editSiswa(AddSiswaModels formData) async {
    Map<String, dynamic> form = {
      "nama": formData.nama,
      "kelas": formData.kelas.toString(),
      "umur": formData.umur.toString(),
      "alamat": formData.alamat,
      "status_siswa": formData.statusSiswa
    };
    try {
      var response = await Dio()
          .put("http://192.168.203.6:8080/update-siswa/${formData.id}",
              // data: FormData.fromMap({
              //   "nama": formData.nama,
              //   "kelas": formData.kelas.toString(),
              //   "umur": formData.umur.toString(),
              //   "alamat": formData.alamat,
              //   "status_siswa": formData.statusSiswa
              // }),
              data: form,
              options: Options(
                  validateStatus: (status) {
                    return status! < 500;
                  },
                  followRedirects: false));
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
      }
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> addSiswa(AddSiswaModels formData) async {
    try {
      var response = await Dio().post("http://192.168.203.6:8080/add-siswa",
          data: FormData.fromMap({
            "nama": formData.nama,
            "kelas": formData.kelas.toString(),
            "umur": formData.umur.toString(),
            "alamat": formData.alamat,
            "status_siswa": formData.statusSiswa
          }),
          options: Options(
              validateStatus: (status) {
                return status! < 500;
              },
              followRedirects: false));
      return response;
      // if (kDebugMode || response.statusCode == 200 || response.statusCode == 201) {
      //   print(response.data);
      //    gets.Get.snackbar("Successs add siswa", "check your data",
      //       snackPosition: gets.SnackPosition.BOTTOM,
      //       colorText: Colors.white,
      //       backgroundColor: Colors.green,
      //       duration: const Duration(seconds: 1));

      // } else {
      //   gets.Get.snackbar("Failed add siswa", "check your data",
      //       snackPosition: gets.SnackPosition.BOTTOM,
      //       colorText: Colors.white,
      //       backgroundColor: Colors.red,
      //       duration: const Duration(seconds: 1));
      // }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Siswa>> loadSiswa() async {
    var response = await Dio().get("http://192.168.203.6:8080/siswa",
        options: Options(
            validateStatus: (status) {
              return status! < 500;
            },
            followRedirects: false));
    ("Kesiniiii 1 $response.data");
    ("ADA GK -- > $response.data");
    try {
      ("KESINIIII 2");
      return SiswaStatusModel.fromJson(response.data).siswa!.toList();
    } catch (e) {
      ("KESINIIII 3");
      throw Exception(e.toString());
    }
  }
}
