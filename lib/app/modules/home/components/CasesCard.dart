import 'package:brazil_covid_per_state/app/modules/home/models/CasesModels.dart';
import 'package:brazil_covid_per_state/app/shared/consts/AppConsts.dart';
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
          height: 350,
          width: 190,
          decoration: ComponentsStyles.backgroundLoginDecoration,
          child: Padding(
            padding: const EdgeInsets.all(AppConsts.ten),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Confirmed cases:\n${result.confirmed}", style: ComponentsStyles.bold15Black),
                Text("Cases per 100k:\n${result.confirmedPer100KInhabitants.toStringAsFixed(2)}", style:ComponentsStyles.bold15Black54,),
                Text("Death rate:\n${(result.deathRate*100).toStringAsFixed(2)}%", style:ComponentsStyles.bold15Black54,),
                Text("Estimated population:\n${result.estimatedPopulation}", style: ComponentsStyles.bold15Black54,),
                Text("Measurement date:\n${result.date.day}/${result.date.month}/${result.date.year}", style: ComponentsStyles.bold15Black87,)
              ],
            ),
          ),
        ),
      );
  }
}