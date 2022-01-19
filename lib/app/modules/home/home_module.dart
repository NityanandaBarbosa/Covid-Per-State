import 'package:brazil_covid_per_state/app/modules/home/repository/covid_cases_repository.dart';
import 'package:brazil_covid_per_state/app/shared/dio/dio_client.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../home/home_store.dart'; 

import 'home_page.dart';
 
class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => DioClient()),
    Bind.lazySingleton((i) => CovidCasesRepository()),
 ];

 @override
 final List<ModularRoute> routes = [
   ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
 ];
}