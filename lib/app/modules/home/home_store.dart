import 'package:brazil_covid_per_state/app/modules/home/exception/get_cases_exceptions.dart';
import 'package:brazil_covid_per_state/app/modules/home/models/StateCasesModel.dart';
import 'package:brazil_covid_per_state/app/modules/home/repository/covid_cases_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'models/CasesModels.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final _repository = Modular.get<CovidCasesRepository>();

  @observable
  List<StateCasesModel> statesList = [];

  @observable
  GetCasesException getCasesException;

  @action
  setStatesList(List<StateCasesModel> value) => statesList = value;

  @action
  setCasesException(GetCasesException value) => getCasesException = value;

  @action
  Future<void> getStateCases() async {
    final response = await _repository.getCases();
    response.fold((l) {
      setCasesException(l);
    }, (r) {
      setStatesList(r);
    });
  }
}
