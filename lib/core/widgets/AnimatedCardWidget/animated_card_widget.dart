import 'package:auto_size_text/auto_size_text.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../extensions/locale_extensions.dart';
import '../../lang/locale_key.g.dart';

class FlipCardWidget extends StatelessWidget {
  const FlipCardWidget({
    Key? key,
    required this.imageWidget,
    required this.titleWidget,
    required this.bioWidget,
    required this.followers,
    required this.follows,
    required this.username,
  }) : super(key: key);

  final Widget? imageWidget;
  final Widget? titleWidget;
  final Widget? bioWidget;
  final String? followers;
  final String? follows;
  final String? username;

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      direction: FlipDirection.VERTICAL,
      front: buildFront(context),
      back: buildBack(context),
    );
  }

  Widget buildFront(BuildContext context) {
    return Container(
      margin: context.horizontalPaddingLow,
      padding: context.paddingLow * 1.6,
      decoration: BoxDecoration(
        border: Border.all(width: 0.2),
        borderRadius: context.normalBorderRadius,
      ),
      child: ListTile(
        leading: buildProfileImage(context),
        title: titleWidget,
        subtitle: buildSubTitleBio(context),
      ),
    );
  }

  Widget buildBack(BuildContext context) {
    return Container(
      margin: context.paddingLow,
      decoration: BoxDecoration(
        border: Border.all(width: 0.2),
        borderRadius: context.normalBorderRadius,
      ),
      child: Column(
        children: [buildRowFirst(context), buildRowSecond(context)],
      ),
    );
  }

  Row buildRowSecond(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            height: context.dynamicHeight(0.05),
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 12),
            child: followers == '' || followers == null || followers == 'null'
                ? AutoSizeText('0')
                : AutoSizeText(followers ?? '0'),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            height: context.dynamicHeight(0.05),
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 12),
            child: follows == '' || follows == null || follows == 'null'
                ? AutoSizeText('0')
                : AutoSizeText(follows ?? '0'),
          ),
        ),
        buildInstagramButton(context)
      ],
    );
  }

  Expanded buildInstagramButton(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        height: context.dynamicHeight(0.05),
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 12),
        child: MaterialButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            void _launchURL() async {
              final url = 'instagram://user?username=$username';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                await launch('https://www.instagram.com/$username/');
              }
            }

            _launchURL();
          },
          child: FaIcon(
            FontAwesomeIcons.instagram,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Row buildRowFirst(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            height: context.dynamicHeight(0.05),
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 12),
            child: AutoSizeText(LocaleKeys.followers.locale),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            height: context.dynamicHeight(0.05),
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 12),
            child: AutoSizeText(LocaleKeys.follows.locale),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            height: context.dynamicHeight(0.05),
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 12),
            child: AutoSizeText(LocaleKeys.see_profile.locale),
          ),
        ),
      ],
    );
  }

  Column buildSubTitleBio(BuildContext context) {
    return Column(
      children: [
        Container(
          height: context.dynamicHeight(0.05),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 12),
          child: bioWidget,
        )
      ],
    );
  }

  ClipRRect buildProfileImage(BuildContext context) {
    return ClipRRect(
      borderRadius: context.normalBorderRadius,
      child: imageWidget,
    );
  }
}
