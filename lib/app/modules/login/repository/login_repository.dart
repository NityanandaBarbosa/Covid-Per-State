import 'package:brazil_covid_per_state/app/modules/login/exception/login_exceptions.dart';
import 'package:brazil_covid_per_state/app/shared/exception/connectionFailure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class LoginRepositoy {
  final mockedUsers = {"Nityananda@gmail.com": "123456", "userTest@gmail.com": "test123"};

  Either<ConnectionFailure, bool> tryToLogin(
      {@required String username, @required String password}) {
    try {
      if (mockedUsers[username] == password) {
        return right(true);
      } else {
        throw "Error";
      }
    } catch (e) {
      return left(LoginException(e));
    }
  }
}
