import 'package:brazil_covid_per_state/app/modules/home/components/StateCard.dart';
import 'package:brazil_covid_per_state/app/modules/home/home_store.dart';
import 'package:brazil_covid_per_state/app/shared/consts/AppConsts.dart';
import 'package:brazil_covid_per_state/app/shared/consts/AppKeys.dart';
import 'package:brazil_covid_per_state/app/shared/consts/AppStrings.dart';
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
          title: AppStrings.error,
          description: AppStrings.errorMessage,
          duration: AppConsts.delayTwo,
          icon: Icons.error,
          gravity: Gravity.top,
          backgroundColor: Colors.red);
    });
  }

  @override
  Widget build(BuildContext context) {
    final listStateCards = <StateCard>[];

    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.appTitle, style: ComponentsStyles.bold20Black54),
        iconTheme: IconThemeData(color: Colors.black54),
        leading: IconButton(
          key: Key(AppKeys.logOutBtnKey),
          onPressed: () => Modular.to.pop(),
          icon: Icon(Icons.exit_to_app)
        ),
        flexibleSpace: ComponentsStyles.gradientAppbaContainer,
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                listStateCards.clear();
                store.setStatesList([]);
                store.getStateCases();
              },
              key: Key(AppKeys.refreshBtnKey),
            )
        ],
      ),
      body: Observer(
        builder: (_) {
          if (store.statesList.isNotEmpty) {
            store.statesList.asMap().forEach((index, state) {
              listStateCards.add(StateCard(
                state: state,
                index: index,
              ));
            });
          }
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Colors.lightBlueAccent.withOpacity(AppConsts.fiftyPercent), 
                    Colors.amberAccent
                  ]),
            ),
            child: store.statesList.isNotEmpty
                ? SafeArea(
                    child: ListView(
                      children: [
                        Wrap(
                            alignment: WrapAlignment.spaceEvenly,
                            children: listStateCards
                          )
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
