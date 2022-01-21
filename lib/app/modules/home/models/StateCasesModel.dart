import 'package:brazil_covid_per_state/app/modules/home/models/CasesModels.dart';

class StateCasesModel {
  final String name;
  final List<DayResult> results;

  StateCasesModel(this.name, this.results);
}
