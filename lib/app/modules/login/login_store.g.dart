// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  final _$isPasswordHideAtom = Atom(name: '_LoginStoreBase.isPasswordHide');

  @override
  bool get isPasswordHide {
    _$isPasswordHideAtom.reportRead();
    return super.isPasswordHide;
  }

  @override
  set isPasswordHide(bool value) {
    _$isPasswordHideAtom.reportWrite(value, super.isPasswordHide, () {
      super.isPasswordHide = value;
    });
  }

  final _$isLoggedAtom = Atom(name: '_LoginStoreBase.isLogged');

  @override
  bool get isLogged {
    _$isLoggedAtom.reportRead();
    return super.isLogged;
  }

  @override
  set isLogged(bool value) {
    _$isLoggedAtom.reportWrite(value, super.isLogged, () {
      super.isLogged = value;
    });
  }

  final _$loginExceptionAtom = Atom(name: '_LoginStoreBase.loginException');

  @override
  LoginException get loginException {
    _$loginExceptionAtom.reportRead();
    return super.loginException;
  }

  @override
  set loginException(LoginException value) {
    _$loginExceptionAtom.reportWrite(value, super.loginException, () {
      super.loginException = value;
    });
  }

  final _$_LoginStoreBaseActionController =
      ActionController(name: '_LoginStoreBase');

  @override
  dynamic setLogged(bool value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setLogged');
    try {
      return super.setLogged(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setObscurePassword(bool value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setObscurePassword');
    try {
      return super.setObscurePassword(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoginException(LoginException value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setLoginException');
    try {
      return super.setLoginException(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isPasswordHide: ${isPasswordHide},
isLogged: ${isLogged},
loginException: ${loginException}
    ''';
  }
}
