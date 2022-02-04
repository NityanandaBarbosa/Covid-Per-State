import 'package:brazil_covid_per_state/app/modules/login/login_store.dart';
import 'package:brazil_covid_per_state/app/shared/consts/AppConsts.dart';
import 'package:brazil_covid_per_state/app/shared/consts/AppKeys.dart';
import 'package:brazil_covid_per_state/app/shared/consts/AppStrings.dart';
import 'package:brazil_covid_per_state/app/shared/sytles/ComponentsStyles.dart';
import 'package:edge_alerts/edge_alerts.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({key, this.title = 'LoginPage'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ModularState<LoginPage, LoginStore> {

  @override
  void initState() {
    super.initState();
    reaction((_) => store.loginException, (_) {
      edgeAlert(
          context, 
          title: AppStrings.error, 
          description: AppStrings.wrongUsernameOrPassword,
          duration: AppConsts.delayTwo, 
          icon: Icons.error, 
          gravity: Gravity.top, 
          backgroundColor: Colors.red
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final fullMediaWidth = MediaQuery.of(context).size.width;
    final fullMediaHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
            height: fullMediaHeight,
            width: fullMediaWidth,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [Colors.green, Colors.yellow]),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: loginWidget(fullMediaWidth, fullMediaHeight)
                )
              )
            ),
      ),
    );
  }

  Widget loginWidget(fullMediaWidth, fullMediaHeight) {
    return Observer(builder: (_) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(AppConsts.zero, AppConsts.zero, AppConsts.zero, AppConsts.forty),
              child: Text(AppStrings.appTitle, style: ComponentsStyles.normal25Blue),
            ),
            Container(
              alignment: Alignment.center,
              width: AppConsts.threeHundred,
              height: AppConsts.threeHundred,
              padding: EdgeInsets.all(AppConsts.twentyFive),
              decoration: ComponentsStyles.backgroundLoginDecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.all(AppConsts.ten),
                      child: Text(AppStrings.accessAcc,
                        style: ComponentsStyles.normal20Black,
                      ),
                    ),
                  ),
                  loginFormField(
                      componentKey: AppKeys.emailInputKey,
                      mediaWidth: fullMediaWidth,
                      hintText: AppStrings.email,
                      labelText: AppStrings.email,
                      isPassword: false,
                      textController: store.usernameController),
                  loginFormField(
                      componentKey: AppKeys.passwordInputKey,
                      mediaWidth: fullMediaWidth,
                      hintText: AppStrings.password,
                      labelText: AppStrings.password,
                      isPassword: true,
                      isPasswordHide: store.isPasswordHide,
                      textController: store.passwordController),
                  Padding(
                    padding: EdgeInsets.only(left: AppConsts.five),
                    child: ButtonTheme(
                      child: ElevatedButton(
                        key: Key(AppKeys.signInBtnKey),
                          child: Text(AppStrings.singIn,
                              style: ComponentsStyles.normal15White),
                          onPressed: () {
                            store.tryToLog();
                          },
                          style: ComponentsStyles.greenButton),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget loginFormField(
      {@required double mediaWidth,
      @required String hintText,
      @required String labelText,
      @required bool isPassword,
      @required TextEditingController textController,
      @required String componentKey,
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
                key: Key(componentKey),
                obscureText: isPasswordHide,
                controller: textController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: hintText,
                  labelText: labelText,
                  labelStyle: ComponentsStyles.regurlar13Black,
                  border: ComponentsStyles.inputBorderBlack54,
                  suffixIcon: !isPassword
                    ? IconButton(
                        icon: Icon(Icons.account_circle),
                        onPressed: null,
                      )
                    : IconButton(
                        icon: Icon(!isPasswordHide
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () => store.setObscurePassword(!store.isPasswordHide),
                        key: Key(AppKeys.hidePasswordBtnKey),
                      ),
                  // onChanged: store.setEmail,
                ),
              ),
            ),
          ));
    });
  }
}
