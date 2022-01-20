import 'package:brazil_covid_per_state/app/modules/home/models/CasesModels.dart';

class StateCasesModel {
  final State state;
  final List<DayResult> results;

  StateCasesModel(this.state, this.results);
}
