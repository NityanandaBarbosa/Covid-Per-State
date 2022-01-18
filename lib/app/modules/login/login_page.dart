import 'package:brazil_covid_per_state/app/modules/login/login_store.dart';
import 'package:brazil_covid_per_state/app/shared/sytles/AppConsts.dart';
import 'package:brazil_covid_per_state/app/shared/sytles/ComponentsStyles.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({key, this.title = 'LoginPage'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ModularState<LoginPage, LoginStore> {
  @override
  Widget build(BuildContext context) {
    final fullMediaWidth = MediaQuery.of(context).size.width;
    final fullMediaHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [Colors.green, Colors.yellow]),
            ),
            child: loginWidget(fullMediaWidth, fullMediaHeight)),
      ),
    );
  }

  Widget loginWidget(fullMediaWidth, fullMediaHeight) {
    return Observer(builder: (_) {
      return Center(
        child: Container(
          alignment: Alignment.center,
          width: fullMediaWidth * AppConsts.eightyPercent,
          height: fullMediaHeight * AppConsts.thirtyFivePercent,
          padding: const EdgeInsets.all(AppConsts.twentyFive),
          decoration: ComponentsStyles.backgroundLoginDecoration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.all(AppConsts.ten),
                  child: Text(
                    "Covid Analytics",
                    style: ComponentsStyles.normal20Black,
                  ),
                ),
              ),
              loginFormField(mediaWidth: fullMediaWidth, hintText: "Your Email", labelText: "Email", isPassword: false),
              loginFormField(mediaWidth: fullMediaWidth, hintText: "Your Passwor", labelText: "Password", isPassword: true),
              Padding(
                padding: EdgeInsets.only(left: AppConsts.five),
                child: ButtonTheme(
                  child: ElevatedButton(
                      child: Text('Sing In', style: ComponentsStyles.normal15White),
                      onPressed: null,
                      style: ComponentsStyles.greenButton),
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  Widget loginFormField(
      {@required double mediaWidth,
      @required String hintText,
      @required String labelText,
      @required bool isPassword,
      bool isPasswordHide = false}) {
    return Observer(builder: (_) {
      return Theme(
          data: ThemeData(
              primaryColor: Colors.black54, primaryColorDark: Colors.black54),
          child: Padding(
            padding: EdgeInsets.all(AppConsts.five),
            child: Container(
              alignment: Alignment.topCenter,
              width: mediaWidth,
              child: TextField(
                key: Key(labelText),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: hintText,
                  // "Your Email",
                  labelText: labelText,
                  // "Email",
                  labelStyle: ComponentsStyles.regurlar13Black,
                  border: ComponentsStyles.inputBorderBlack54,
                  suffixIcon: !isPassword
                      ? IconButton(
                          icon: Icon(Icons.account_circle),
                          onPressed: null,
                        )
                      : IconButton(
                          icon: Icon(isPasswordHide
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: null,
                        ),
                  // onChanged: store.setEmail,
                ),
              ),
            ),
          ));
    });
  }
}
