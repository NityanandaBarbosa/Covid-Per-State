import 'package:brazil_covid_per_state/app/modules/home/exception/get_cases_exceptions.dart';
import 'package:brazil_covid_per_state/app/modules/home/models/StateCases.dart';
import 'package:brazil_covid_per_state/app/modules/home/models/CasesModels.dart';
import 'package:brazil_covid_per_state/app/shared/consts/AppConsts.dart';
import 'package:brazil_covid_per_state/app/shared/dio/dio_client.dart';
import 'package:dartz/dartz.dart' hide State;
import 'package:flutter_modular/flutter_modular.dart';

class CovidCasesRepository {
  final dio = Modular.get<DioClient>().dio;

  Either<GetCasesException, List<StateCases>> getCases() {
    var listResults = <DayResult>[];

    List<StateCases> listStatesCases = [];

    Map<State, List<DayResult>> statesMap = {};

    State.values.forEach((element) {
      statesMap[element] = <DayResult>[];
    });

    dio.get("${AppConsts.baseUrl}${AppConsts.apiFilter}").then((value) {
      listResults = Result.fromJson(value.data).results;

      listResults.forEach((element) {
        statesMap[element.state].add(element);
      });

      statesMap.forEach((key, value) {
        listStatesCases.add(new StateCases(key, value));
      });

      return right(listStatesCases);
    }).onError((error, stackTrace) {
      print("This is the $error");
      return left(GetCasesException("$error"));
    });
    return left(GetCasesException("Was not possible to get the cases !"));
  }
}
