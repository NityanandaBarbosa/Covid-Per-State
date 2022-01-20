import 'package:brazil_covid_per_state/app/modules/home/components/StateCard.dart';
import 'package:brazil_covid_per_state/app/modules/home/home_store.dart';
import 'package:brazil_covid_per_state/app/shared/sytles/ComponentsStyles.dart';
import 'package:edge_alerts/edge_alerts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  void initState() {
    super.initState();
    store.getStateCases();
    reaction((_) => store.getCasesException, (_) {
      edgeAlert(context,
          title: "Error",
          description: "Was not possible get states!",
          duration: 2,
          icon: Icons.error,
          gravity: Gravity.top,
          backgroundColor: Colors.red);
    });
  }

  @override
  Widget build(BuildContext context) {
    final fullMediaWidth = MediaQuery.of(context).size.width;
    final fullMediaHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Covid per state'),
        flexibleSpace: ComponentsStyles.gradientAppbaContainer,
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                store.setStatesList([]);
                store.getStateCases();
              })
        ],
      ),
      body: Observer(
        builder: (_) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [Colors.green, Colors.yellow]),
            ),
            child: store.statesList.isNotEmpty
                ? SafeArea(
                    child: ListView(
                      children: [
                        Wrap(
                            alignment: WrapAlignment.spaceEvenly,
                            children: store.statesList
                                .map((item) => StateCard(
                                    state: item,
                                    height: fullMediaHeight,
                                    width: fullMediaWidth))
                                .toList()),
                      ],
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        },
      ),
    );
  }
}
