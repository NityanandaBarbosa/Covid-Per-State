import 'package:brazil_covid_per_state/app/modules/home/exception/get_cases_exceptions.dart';
import 'package:brazil_covid_per_state/app/modules/home/models/StateCases.dart';
import 'package:brazil_covid_per_state/app/modules/home/models/CasesModels.dart';
import 'package:brazil_covid_per_state/app/shared/consts/AppConsts.dart';
import 'package:brazil_covid_per_state/app/shared/dio/dio_client.dart';
import 'package:dartz/dartz.dart' hide State;
import 'package:flutter_modular/flutter_modular.dart';

class CovidCasesRepository {
  final dio = Modular.get<DioClient>().dio;

  Future<Either<GetCasesException, List<StateCases>>> getCases() async {
    var listResults = <DayResult>[];

    List<StateCases> listStatesCases = [];

    Map<State, List<DayResult>> statesMap = {};

    State.values.forEach((element) {
      statesMap[element] = <DayResult>[];
    });

    try{
      final response =  await dio.get("${AppConsts.baseUrl}${AppConsts.apiFilter}");
      listResults = Result.fromJson(response.data).results;

      listResults.forEach((element) {
        statesMap[element.state].add(element);
      });

      statesMap.forEach((key, value) {
        listStatesCases.add(StateCases(key, value));
      });

      return right(listStatesCases);
    }catch(error){
      return left(GetCasesException("$error"));
    }
  }
}
