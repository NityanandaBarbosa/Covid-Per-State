import 'package:brazil_covid_per_state/app/modules/home/models/StateCasesModel.dart';
import 'package:brazil_covid_per_state/app/shared/consts/AppConsts.dart';
import 'package:brazil_covid_per_state/app/shared/sytles/ComponentsStyles.dart';
import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StateCard extends StatelessWidget {
  final StateCasesModel state;
  final double width;
  final double height;
  final int index;
  StateCard({Key key, this.state, this.width, this.height, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(AppConsts.five),
        child: Container(
          height: height * AppConsts.twelvePercent,
          width: width * AppConsts.fortyFivePercent,
          decoration: ComponentsStyles.backgroundLoginDecoration,
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${state.state}"),
                Text("Confirmed cases:\n${state.results.first.confirmed}"),
                Text(
                    "Last measurement:\n${state.results.first.date.day}/${state.results.first.date.month}/${state.results.first.date.year}"),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Align(
                      alignment: Alignment.bottomRight, 
                      child: Text("${index+1}")
                    ),
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () => Modular.to.pushNamed(
          "/registered_states/state/:id".replaceFirst(":id", "$index")),
    );
  }
}
