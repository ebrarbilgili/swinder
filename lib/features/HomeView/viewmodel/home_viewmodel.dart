import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mobx/mobx.dart';
import 'package:swinder/core/model/instagram_profile_model.dart';
import 'package:swinder/core/service/Admob/ad_manager.dart';
import 'package:swinder/core/service/network/get_instagram_profile.dart';
import 'package:swinder/features/HomeView/ProfilePageView/view/profile_page_view.dart';

import '../../../core/cache/shared/shared_pref_cache.dart';
import '../HomePageView/view/home_page_view.dart';

part 'home_viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  @action
  Future<void> saveInformations(
      String username, String mySex, String chooseSex) async {
    await SharedPreferencesConstant.instance
        .setStringValue('username', username);
    await SharedPreferencesConstant.instance.setStringValue('mySex', mySex);
    await SharedPreferencesConstant.instance
        .setStringValue('chooseSex', chooseSex);
  }

  @observable
  int selectedIndex = 0;

  @observable
  bool isHome = true;
  @observable
  bool isProfile = false;

  @action
  void onItemTapped(int index) {
    selectedIndex = index;
  }

  @observable
  var pages = [
    HomePageView(),
    ProfilePageView(),
  ];

  @observable
  String? postpp;
  @observable
  String? postbio;
  @observable
  int? follows;
  @observable
  int? followers;

  final GetInstagramProfileService getInstagramProfileService;

  @observable
  InstagramProfileInfoModel? modelList;

  _HomeViewModelBase({required this.getInstagramProfileService}) {
    getInstagramProfiles();
  }

  @action
  Future<void> getInstagramProfiles() async {
    modelList = await getInstagramProfileService.fetchInsta();
    if (modelList != null) {
      await SharedPreferencesConstant.instance.setStringValue(
          'bio', modelList!.graphql!.user!.biography.toString());
      await SharedPreferencesConstant.instance.setStringValue(
          'pp', modelList!.graphql!.user!.profile_pic_url_hd.toString());
      await SharedPreferencesConstant.instance.setStringValue(
          'follows', modelList!.graphql!.user!.edge_follow!.count.toString());
      await SharedPreferencesConstant.instance.setStringValue('followers',
          modelList!.graphql!.user!.edge_followed_by!.count.toString());
    }
  }

  @action
  void buildInterstitial(int milliseconds) {
    Future.delayed(Duration(milliseconds: milliseconds), () async {
      await InterstitialAd.load(
          adUnitId: AdManager.interstitialAdUnitId,
          request: AdRequest(),
          adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (InterstitialAd ad) {
              ad.show();
            },
            onAdFailedToLoad: (LoadAdError error) {
              print('InterstitialAd failed to load: $error');
            },
          ));
    });
  }
}
