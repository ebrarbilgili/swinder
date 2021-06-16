import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:swinder/core/cache/shared/shared_pref_cache.dart';
import 'package:swinder/core/service/Locations/location_service.dart';
import 'package:swinder/features/HomeView/HomePageView/model/PostUser/post_user_model.dart';

import '../model/FetchUser/home_page_model.dart';
import '../service/home_page_service.dart';

part 'home_page_viewmodel.g.dart';

class HomePageViewModel = _HomePageViewModelBase with _$HomePageViewModel;

abstract class _HomePageViewModelBase with Store {
  final HomePageService homePageService;
  PostUserInformationService postUserInformationService;

  _HomePageViewModelBase(
      {required this.homePageService,
      required this.postUserInformationService}) {
    getUsers();
  }

  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @observable
  List<GetAround> usersList = [];

  @action
  Future<List<GetAround>> getUsers() async {
    return usersList = await homePageService.getUsers();
  }

  @action
  Future post(BuildContext context) async {
    final prefs = SharedPreferencesConstant.instance;

    return await postUserInformationService
        .postProfileInfo(PostProfileInformations(
          name: prefs.getStringValue('username'),
          photo: prefs.getStringValue('pp'),
          bio: prefs.getStringValue('bio').toString(),
          lat:
              context.read<LocationService>().liveLocation!.latitude.toString(),
          lon: context
              .read<LocationService>()
              .liveLocation!
              .longitude
              .toString(),
          gender: prefs.getStringValue('mySex'),
          follows: prefs.getStringValue('follows'),
          followers: prefs.getStringValue('followers'),
        ))
        .whenComplete(() => getUsers().then((value) => print(value)));
  }
}
