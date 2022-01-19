import 'package:brazil_covid_per_state/app/modules/home/exception/get_cases_exceptions.dart';
import 'package:brazil_covid_per_state/app/modules/home/models/StateCases.dart';
import 'package:brazil_covid_per_state/app/modules/home/repository/covid_cases_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'models/CasesModels.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final _repository = Modular.get<CovidCasesRepository>();

  @observable
  List<StateCases> statesList;

  @observable
  GetCasesException getCasesException;

  @action
  setStatesDict(List<StateCases> value) => statesList = value;

  @action
  setCasesException(GetCasesException value) => getCasesException = value;

  @action
  void getStateCases() {
    _repository.getCases().fold((l) => setCasesException(l), (r) => setStatesDict(r));
  }
}

class DayResult {}
