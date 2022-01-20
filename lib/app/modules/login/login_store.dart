import 'package:brazil_covid_per_state/app/modules/login/repository/login_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'exception/login_exceptions.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final LoginRepositoy loginRepositoy = Modular.get();

  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @observable
  bool isPasswordHide = true;

  @observable
  bool isLogged = false;

  @observable
  LoginException loginException;

  @action
  setLogged(bool value) => isLogged = value;

  @action
  setObscurePassword(bool value) => isPasswordHide = value;

  @action
  setLoginException(LoginException value) => loginException = value;

  void tryToLog() {
    final response = loginRepositoy.tryToLogin(
        username: usernameController.text, password: passwordController.text);
    response.fold((l) => setLoginException(l), (r) {
      setLogged(true);
      Modular.to.pushNamed("/registered_states");
    });
  }
}
