import 'package:brazil_covid_per_state/app/modules/home/models/CasesModels.dart';
import 'package:brazil_covid_per_state/app/shared/consts/AppConsts.dart';
import 'package:brazil_covid_per_state/app/shared/sytles/ComponentsStyles.dart';
import 'package:flutter/material.dart';
    
class CasesCard extends StatelessWidget {
  final DayResult result;
  final double width;
  final double height;
  const CasesCard({Key key, @required this.result, @required this.width, @required this.height}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(AppConsts.five),
        child: Container(
          height: height * AppConsts.twelvePercent,
          width: width * AppConsts.fortyFivePercent,
          decoration: ComponentsStyles.backgroundLoginDecoration,
          child: Padding(
            padding: const EdgeInsets.all(AppConsts.ten),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Casos confirmados:\n${result.confirmed}"),
                Text("Casos confirmados p/ 100k:\n${result.confirmedPer100KInhabitants}"),
                Text("Taxa de obito:\n${result.deathRate}"),
                Text("População estimada:\n${result.estimatedPopulation}"),
                Text("Data da medição:\n${result.date.day}/${result.date.month}/${result.date.year}")
              ],
            ),
          ),
        ),
      );
  }
}