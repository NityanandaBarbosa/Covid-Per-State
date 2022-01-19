import 'package:brazil_covid_per_state/app/modules/home/models/CasesModels.dart';

class StateCases {
  final State state;
  final List<DayResult> results;

  StateCases(this.state, this.results);
}
