import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app.dart';
import '../../../core/service/Locations/location_service.dart';
import '../../../core/service/network/get_instagram_profile.dart';
import '../../../core/widgets/BannerAdWidget/banner_ad.dart';
import '../../../core/widgets/BottomNavigationBar/bottom_navbar.dart';
import '../HomePageView/service/home_page_service.dart';
import '../HomePageView/viewmodel/home_page_viewmodel.dart';
import '../viewmodel/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  HomeView({
    Key? key,
    required this.username,
    required this.mySex,
    required this.chooseSex,
    this.containerHeight,
  }) : super(key: key);

  final String? username;
  final String? mySex;
  final String? chooseSex;

  final double? containerHeight;

  final viewModel = HomeViewModel(
    getInstagramProfileService: GetInstagramProfileService(
      service: Dio(BaseOptions(baseUrl: AppConstants.INSTA_URL)),
    ),
  );

  final homePageViewModel = HomePageViewModel(
    homePageService: HomePageService(),
    postUserInformationService: PostUserInformationService(),
  );

  @override
  Widget build(BuildContext context) {
    // final prefs = context.watch<CacheProvider>();
    viewModel.saveInformations(username!, mySex!, chooseSex!);
    final address = context.read<LocationService>().currentAddress ?? '';

    viewModel.buildInterstitial(3600);
    viewModel.buildInterstitial(60000);

    return Scaffold(
      body: Observer(
        builder: (context) {
          return RefreshIndicator(
            key: homePageViewModel.refreshIndicatorKey,
            strokeWidth: 4,
            color: context.colorScheme.primary,
            onRefresh: () {
              return homePageViewModel
                  .post(context)
                  .whenComplete(() => homePageViewModel.getUsers());
            },
            child: Stack(
              children: [
                buildCustomScrollView(address, context),
                buildBottomNavbarAndBanner
              ],
            ),
          );
        },
      ),
    );
  }

  CustomScrollView buildCustomScrollView(String address, BuildContext context) {
    return CustomScrollView(
      slivers: [
        buildSliverAppBar(address, context),
        viewModel.pages.elementAt(viewModel.selectedIndex),
        buildSliverToBoxAdapter(context)
      ],
    );
  }

  Align get buildBottomNavbarAndBanner {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BannerAdWidget(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Observer(
              builder: (context) => BottomNavigationBarWidget(
                currentIndex: viewModel.selectedIndex,
                onTap: (index) => viewModel.selectedIndex = index,
              ),
            ),
          ),
        ],
      ),
    );
  }

  SliverToBoxAdapter buildSliverToBoxAdapter(BuildContext context) {
    return homePageViewModel.usersList.isNotEmpty
        ? SliverToBoxAdapter(
            child: SizedBox(height: context.dynamicHeight(0.2)))
        : SliverToBoxAdapter();
  }

  SliverAppBar buildSliverAppBar(String address, BuildContext context) {
    return SliverAppBar(
      leading: Image.asset(
        AppConstants.LOGO,
        fit: BoxFit.cover,
      ),
      actions: [
        Padding(
          padding: context.paddingLow,
          child: AutoSizeText(
            address,
            textAlign: TextAlign.end,
            style: TextStyle(color: context.colorScheme.secondary),
          ),
        )
      ],
      leadingWidth: context.dynamicHeight(0.6),
    );
  }
}
