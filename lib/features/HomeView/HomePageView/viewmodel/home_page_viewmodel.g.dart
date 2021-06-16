// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomePageViewModel on _HomePageViewModelBase, Store {
  final _$usersListAtom = Atom(name: '_HomePageViewModelBase.usersList');

  @override
  List<GetAround> get usersList {
    _$usersListAtom.reportRead();
    return super.usersList;
  }

  @override
  set usersList(List<GetAround> value) {
    _$usersListAtom.reportWrite(value, super.usersList, () {
      super.usersList = value;
    });
  }

  final _$getUsersAsyncAction = AsyncAction('_HomePageViewModelBase.getUsers');

  @override
  Future<List<GetAround>> getUsers() {
    return _$getUsersAsyncAction.run(() => super.getUsers());
  }

  final _$postAsyncAction = AsyncAction('_HomePageViewModelBase.post');

  @override
  Future<dynamic> post(BuildContext context) {
    return _$postAsyncAction.run(() => super.post(context));
  }

  @override
  String toString() {
    return '''
usersList: ${usersList}
    ''';
  }
}
