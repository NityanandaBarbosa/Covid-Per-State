import 'package:brazil_covid_per_state/app/modules/home/home_store.dart';
import 'package:brazil_covid_per_state/app/shared/dio/dio_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid per state'),
      ),
      body: Observer(
        builder: (context) => Text('Conta'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
