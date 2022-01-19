import 'package:brazil_covid_per_state/app/shared/exception/connectionFailure.dart';

class LoginException extends ConnectionFailure {
  final String error;
  LoginException(this.error);
}