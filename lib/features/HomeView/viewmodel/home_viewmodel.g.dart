// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  final _$selectedIndexAtom = Atom(name: '_HomeViewModelBase.selectedIndex');

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  final _$isHomeAtom = Atom(name: '_HomeViewModelBase.isHome');

  @override
  bool get isHome {
    _$isHomeAtom.reportRead();
    return super.isHome;
  }

  @override
  set isHome(bool value) {
    _$isHomeAtom.reportWrite(value, super.isHome, () {
      super.isHome = value;
    });
  }

  final _$isProfileAtom = Atom(name: '_HomeViewModelBase.isProfile');

  @override
  bool get isProfile {
    _$isProfileAtom.reportRead();
    return super.isProfile;
  }

  @override
  set isProfile(bool value) {
    _$isProfileAtom.reportWrite(value, super.isProfile, () {
      super.isProfile = value;
    });
  }

  final _$pagesAtom = Atom(name: '_HomeViewModelBase.pages');

  @override
  List<StatelessWidget> get pages {
    _$pagesAtom.reportRead();
    return super.pages;
  }

  @override
  set pages(List<StatelessWidget> value) {
    _$pagesAtom.reportWrite(value, super.pages, () {
      super.pages = value;
    });
  }

  final _$postppAtom = Atom(name: '_HomeViewModelBase.postpp');

  @override
  String? get postpp {
    _$postppAtom.reportRead();
    return super.postpp;
  }

  @override
  set postpp(String? value) {
    _$postppAtom.reportWrite(value, super.postpp, () {
      super.postpp = value;
    });
  }

  final _$postbioAtom = Atom(name: '_HomeViewModelBase.postbio');

  @override
  String? get postbio {
    _$postbioAtom.reportRead();
    return super.postbio;
  }

  @override
  set postbio(String? value) {
    _$postbioAtom.reportWrite(value, super.postbio, () {
      super.postbio = value;
    });
  }

  final _$followsAtom = Atom(name: '_HomeViewModelBase.follows');

  @override
  int? get follows {
    _$followsAtom.reportRead();
    return super.follows;
  }

  @override
  set follows(int? value) {
    _$followsAtom.reportWrite(value, super.follows, () {
      super.follows = value;
    });
  }

  final _$followersAtom = Atom(name: '_HomeViewModelBase.followers');

  @override
  int? get followers {
    _$followersAtom.reportRead();
    return super.followers;
  }

  @override
  set followers(int? value) {
    _$followersAtom.reportWrite(value, super.followers, () {
      super.followers = value;
    });
  }

  final _$modelListAtom = Atom(name: '_HomeViewModelBase.modelList');

  @override
  InstagramProfileInfoModel? get modelList {
    _$modelListAtom.reportRead();
    return super.modelList;
  }

  @override
  set modelList(InstagramProfileInfoModel? value) {
    _$modelListAtom.reportWrite(value, super.modelList, () {
      super.modelList = value;
    });
  }

  final _$saveInformationsAsyncAction =
      AsyncAction('_HomeViewModelBase.saveInformations');

  @override
  Future<void> saveInformations(
      String username, String mySex, String chooseSex) {
    return _$saveInformationsAsyncAction
        .run(() => super.saveInformations(username, mySex, chooseSex));
  }

  final _$getInstagramProfilesAsyncAction =
      AsyncAction('_HomeViewModelBase.getInstagramProfiles');

  @override
  Future<void> getInstagramProfiles() {
    return _$getInstagramProfilesAsyncAction
        .run(() => super.getInstagramProfiles());
  }

  final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase');

  @override
  void onItemTapped(int index) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.onItemTapped');
    try {
      return super.onItemTapped(index);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void buildInterstitial(int milliseconds) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.buildInterstitial');
    try {
      return super.buildInterstitial(milliseconds);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedIndex: ${selectedIndex},
isHome: ${isHome},
isProfile: ${isProfile},
pages: ${pages},
postpp: ${postpp},
postbio: ${postbio},
follows: ${follows},
followers: ${followers},
modelList: ${modelList}
    ''';
  }
}
