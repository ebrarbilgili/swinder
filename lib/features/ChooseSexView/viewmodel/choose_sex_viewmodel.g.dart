// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choose_sex_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChooseSexViewModel on _ChooseSexViewModelBase, Store {
  final _$sexAtom = Atom(name: '_ChooseSexViewModelBase.sex');

  @override
  int? get sex {
    _$sexAtom.reportRead();
    return super.sex;
  }

  @override
  set sex(int? value) {
    _$sexAtom.reportWrite(value, super.sex, () {
      super.sex = value;
    });
  }

  final _$choosesexAtom = Atom(name: '_ChooseSexViewModelBase.choosesex');

  @override
  int? get choosesex {
    _$choosesexAtom.reportRead();
    return super.choosesex;
  }

  @override
  set choosesex(int? value) {
    _$choosesexAtom.reportWrite(value, super.choosesex, () {
      super.choosesex = value;
    });
  }

  final _$chooseControlAtom =
      Atom(name: '_ChooseSexViewModelBase.chooseControl');

  @override
  bool get chooseControl {
    _$chooseControlAtom.reportRead();
    return super.chooseControl;
  }

  @override
  set chooseControl(bool value) {
    _$chooseControlAtom.reportWrite(value, super.chooseControl, () {
      super.chooseControl = value;
    });
  }

  final _$isAcceptedAtom = Atom(name: '_ChooseSexViewModelBase.isAccepted');

  @override
  bool get isAccepted {
    _$isAcceptedAtom.reportRead();
    return super.isAccepted;
  }

  @override
  set isAccepted(bool value) {
    _$isAcceptedAtom.reportWrite(value, super.isAccepted, () {
      super.isAccepted = value;
    });
  }

  final _$_ChooseSexViewModelBaseActionController =
      ActionController(name: '_ChooseSexViewModelBase');

  @override
  void onPressedYourGender(String gender, int number) {
    final _$actionInfo = _$_ChooseSexViewModelBaseActionController.startAction(
        name: '_ChooseSexViewModelBase.onPressedYourGender');
    try {
      return super.onPressedYourGender(gender, number);
    } finally {
      _$_ChooseSexViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onPressedPreferGender(String gender, int number) {
    final _$actionInfo = _$_ChooseSexViewModelBaseActionController.startAction(
        name: '_ChooseSexViewModelBase.onPressedPreferGender');
    try {
      return super.onPressedPreferGender(gender, number);
    } finally {
      _$_ChooseSexViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onPressedGoButton() {
    final _$actionInfo = _$_ChooseSexViewModelBaseActionController.startAction(
        name: '_ChooseSexViewModelBase.onPressedGoButton');
    try {
      return super.onPressedGoButton();
    } finally {
      _$_ChooseSexViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sex: ${sex},
choosesex: ${choosesex},
chooseControl: ${chooseControl},
isAccepted: ${isAccepted}
    ''';
  }
}
