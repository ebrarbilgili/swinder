import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/constants/app.dart';
import '../../../../core/extensions/locale_extensions.dart';
import '../../../../core/lang/locale_key.g.dart';
import '../../../../core/widgets/AnimatedCardWidget/animated_card_widget.dart';
import '../model/FetchUser/home_page_model.dart';
import '../service/home_page_service.dart';
import '../viewmodel/home_page_viewmodel.dart';

class HomePageView extends StatelessWidget {
  HomePageView({Key? key}) : super(key: key);

  final viewModel = HomePageViewModel(
    homePageService: HomePageService(),
    postUserInformationService: PostUserInformationService(),
  );

  @override
  Widget build(BuildContext context) {
    viewModel.post(context);

    return Observer(builder: (context) {
      return viewModel.usersList.isEmpty
          ? buildSwipeUpText
          : buildUsers(context);
    });
  }

  Widget buildUsers(BuildContext context) {
    return FutureBuilder<List<GetAround>>(
        future: viewModel.getUsers(),
        builder: (context, snapshot) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final user = viewModel.usersList[index];
                return buildFlipCardWidget(user, context);
                // buildAnimatedCardWidget(user, context);
              },
              childCount: viewModel.usersList.length,
            ),
          );
        });
  }

  FlipCardWidget buildFlipCardWidget(GetAround user, BuildContext context) {
    return FlipCardWidget(
      imageWidget: buildProfileImageWidget(user),
      titleWidget: buildUsernameText(user, context),
      bioWidget: buildBioText(user, context),
      followers: user.followers,
      follows: user.follows,
      username: user.name,
    );
  }

  Widget buildProfileImageWidget(GetAround user) {
    return user.photo == '' && user.photo == 'null' && user.photo == null
        ? Image.network(
            AppConstants.RANDOM_IMAGE,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Image.network(
              AppConstants.RANDOM_IMAGE,
              fit: BoxFit.cover,
            ),
          )
        : Image.network(
            user.photo!,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Image.network(
              AppConstants.RANDOM_IMAGE,
              fit: BoxFit.cover,
            ),
          );
  }

  Text buildUsernameText(GetAround user, BuildContext context) => Text(
        '${user.name}',
        style: context.textTheme.bodyText1!
            .copyWith(fontSize: 18, fontWeight: FontWeight.w400),
      );

  Widget buildBioText(GetAround user, BuildContext context) {
    return user.bio == '' || user.bio == 'null' || user.bio == null
        ? AutoSizeText('')
        : AutoSizeText(
            '${user.bio}',
            style: context.textTheme.bodyText1!,
          );
  }

  SliverFillRemaining get buildSwipeUpText {
    return SliverFillRemaining(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(LocaleKeys.no_one_around_you.locale),
          AutoSizeText(LocaleKeys.swipe_up.locale),
        ],
      ),
    );
  }
}
