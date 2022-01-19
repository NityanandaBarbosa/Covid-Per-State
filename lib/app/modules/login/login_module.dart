import 'package:brazil_covid_per_state/app/modules/login/login_Page.dart';
import 'package:brazil_covid_per_state/app/modules/login/login_store.dart';
import 'package:brazil_covid_per_state/app/modules/login/repository/login_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginStore()),
    Bind.lazySingleton((i) => LoginRepositoy()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => LoginPage()),
  ];
}
