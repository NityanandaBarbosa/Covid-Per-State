import 'package:brazil_covid_per_state/app/modules/home/models/models.dart';
import 'package:brazil_covid_per_state/app/shared/dio/dio_client.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CovidCasesRepository {
  final dio = Modular.get<DioClient>().dio;

  List<DayResult> getCasos() {
    var list = <DayResult>[];
    dio
        .get(
            "https://api.brasil.io/v1/dataset/covid19/caso/data/?search=&date=&state=&place_type=state&is_last=&city_ibge_code")
        .then((value) {
      list = Result.fromJson(value.data).results;
      print("Lista ${list.length}");
      State.values.forEach((element) {
        print("Estado ${element}");
      });
    }).onError((error, stackTrace) {
      print("Here $error");
    });
  }
}
