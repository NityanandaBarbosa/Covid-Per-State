import 'package:brazil_covid_per_state/app/shared/exception/connectionFailure.dart';

class GetCasesException extends ConnectionFailure {
  final String error;
  GetCasesException(this.error);
}