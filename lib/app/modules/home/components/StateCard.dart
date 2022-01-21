import 'package:brazil_covid_per_state/app/modules/home/models/StateCasesModel.dart';
import 'package:brazil_covid_per_state/app/shared/consts/AppConsts.dart';
import 'package:brazil_covid_per_state/app/shared/consts/AppStrings.dart';
import 'package:brazil_covid_per_state/app/shared/sytles/ComponentsStyles.dart';
import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StateCard extends StatelessWidget {
  final StateCasesModel state;
  final int index;
  StateCard({Key key, this.state, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(AppConsts.five),
        child: Container(
          height: AppConsts.twoHundred,
          width: AppConsts.hundredNinety,
          decoration: ComponentsStyles.backgroundLoginDecoration,
          child: Padding(
            padding: EdgeInsets.fromLTRB(AppConsts.twenty, AppConsts.twenty, AppConsts.twenty, AppConsts.ten),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(state.name, style: ComponentsStyles.bold20Black,),
                Text("${AppStrings.confirmedCases}${state.results.first.confirmed}",style: ComponentsStyles.bold15Black87,),
                Text("${AppStrings.lastMeasurement}${state.results.first.date.day}/${state.results.first.date.month}/${state.results.first.date.year}",style: ComponentsStyles.bold15Black54,),
                Padding(
                  padding: EdgeInsets.fromLTRB(AppConsts.zero, AppConsts.zero, AppConsts.five, AppConsts.zero),
                  child: Align(
                      alignment: Alignment.bottomRight, 
                      child: Text("${index+1}",style: ComponentsStyles.bold15Black35,)
                    ),
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () => Modular.to.pushNamed(
          "${AppStrings.statesList}${AppStrings.specificState}".replaceFirst(":id", "$index")),
    );
  }
}
