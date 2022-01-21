import 'package:brazil_covid_per_state/app/modules/home/models/CasesModels.dart';
import 'package:brazil_covid_per_state/app/shared/consts/AppConsts.dart';
import 'package:brazil_covid_per_state/app/shared/consts/AppStrings.dart';
import 'package:brazil_covid_per_state/app/shared/sytles/ComponentsStyles.dart';
import 'package:flutter/material.dart';
    
class CasesCard extends StatelessWidget {
  final DayResult result;
  const CasesCard({Key key, @required this.result}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(AppConsts.five),
        child: Container(
          height: AppConsts.threeHundredFifety,
          width: AppConsts.hundredNinety,
          decoration: ComponentsStyles.backgroundLoginDecoration,
          child: Padding(
            padding: EdgeInsets.all(AppConsts.ten),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${AppStrings.confirmedCases}${result.confirmed}", style: ComponentsStyles.bold15Black),
                Text("${AppStrings.casesPerCard}${result.confirmedPer100KInhabitants.toStringAsFixed(2)}", style:ComponentsStyles.bold15Black54,),
                Text("${AppStrings.deathRate}${(result.deathRate*100).toStringAsFixed(2)}%", style:ComponentsStyles.bold15Black54,),
                Text("${AppStrings.estimatPopulation}${result.estimatedPopulation}", style: ComponentsStyles.bold15Black54,),
                Text("${AppStrings.measurementDate}${result.date.day}/${result.date.month}/${result.date.year}", style: ComponentsStyles.bold15Black87,)
              ],
            ),
          ),
        ),
      );
  }
}