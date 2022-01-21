import 'package:brazil_covid_per_state/app/modules/home/components/CasesCard.dart';
import 'package:brazil_covid_per_state/app/modules/home/models/StateCasesModel.dart';
import 'package:brazil_covid_per_state/app/shared/sytles/ComponentsStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class StateCases extends StatefulWidget {
  final StateCasesModel state;

  StateCases({Key key, this.state}) : super(key: key);

  @override
  _StateCasesState createState() => _StateCasesState();
}

class _StateCasesState extends State<StateCases> {
  @override
  Widget build(BuildContext context) {
    final fullMediaWidth = MediaQuery.of(context).size.width;
    final fullMediaHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.state.state}"),
        flexibleSpace: ComponentsStyles.gradientAppbaContainer,
      ),
      body: Observer(builder: (_) {
        return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [Colors.green, Colors.yellow]),
            ),
            child: 
            SafeArea(
                child: ListView(
              children: [
                Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    children: widget.state.results
                        .map((item) => CasesCard(
                            result: item,
                            height: fullMediaHeight,
                            width: fullMediaWidth))
                        .toList()),
              ],
            ))
            );
      }),
    );
  }
}
