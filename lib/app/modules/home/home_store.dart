import 'package:brazil_covid_per_state/app/modules/home/repository/caso_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final _repository = Modular.get<CasoRepository>();
  @observable
  int counter = 0;

  Future<void> increment() async {
    counter = counter + 1;
  }

  void getList() {
    _repository.getCasos();
  }
}
