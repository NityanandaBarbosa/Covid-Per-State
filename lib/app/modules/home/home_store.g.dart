// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$statesListAtom = Atom(name: 'HomeStoreBase.statesList');

  @override
  List<StateCasesModel> get statesList {
    _$statesListAtom.reportRead();
    return super.statesList;
  }

  @override
  set statesList(List<StateCasesModel> value) {
    _$statesListAtom.reportWrite(value, super.statesList, () {
      super.statesList = value;
    });
  }

  final _$getCasesExceptionAtom = Atom(name: 'HomeStoreBase.getCasesException');

  @override
  GetCasesException get getCasesException {
    _$getCasesExceptionAtom.reportRead();
    return super.getCasesException;
  }

  @override
  set getCasesException(GetCasesException value) {
    _$getCasesExceptionAtom.reportWrite(value, super.getCasesException, () {
      super.getCasesException = value;
    });
  }

  final _$getStateCasesAsyncAction = AsyncAction('HomeStoreBase.getStateCases');

  @override
  Future<void> getStateCases() {
    return _$getStateCasesAsyncAction.run(() => super.getStateCases());
  }

  final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase');

  @override
  dynamic setStatesList(List<StateCasesModel> value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setStatesList');
    try {
      return super.setStatesList(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCasesException(GetCasesException value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setCasesException');
    try {
      return super.setCasesException(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
statesList: ${statesList},
getCasesException: ${getCasesException}
    ''';
  }
}
