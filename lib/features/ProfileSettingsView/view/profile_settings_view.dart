import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app.dart';
import '../../../core/extensions/locale_extensions.dart';
import '../../../core/lang/locale_key.g.dart';
import '../../../core/provider/cache_provider.dart';
import '../../LoginView/view/login_view.dart';
import '../constants/delete_account_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileSettingsView extends StatelessWidget {
  const ProfileSettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prefs = context.watch<CacheProvider>();
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context, prefs),
    );
  }

  ListView buildBody(BuildContext context, CacheProvider prefs) {
    return ListView(
      children: [
        buildProfileCard(context, prefs),
        buildChangeSexChoice(context, prefs),
        // buildPrivacyPolicy(context),
        buildDeleteAccount(context),
      ],
    );
  }

  Container buildDeleteAccount(BuildContext context) {
    return Container(
      width: double.infinity,
      child: buildCard(
        context,
        () async {
          await showDialog(
            context: context,
            builder: (context) => DeleteAccountDialog(),
          );
        },
        LocaleKeys.delete_account.locale,
        context.colorScheme.error,
      ),
    );
  }

  Container buildPrivacyPolicy(BuildContext context) {
    return Container(
      width: double.infinity,
      child: buildCard(
        context,
        () async {
          final url = 'http://swinderapp.com/#/privacy';
          if (await canLaunch(url)) {
            await launch(url);
          }
        },
        LocaleKeys.privacy.locale,
        null,
      ),
    );
  }

  Container buildChangeSexChoice(BuildContext context, CacheProvider prefs) {
    return Container(
        width: double.infinity,
        child: buildCard(context, () async {
          await prefs.clearCache();

          await context.navigation
              .push(MaterialPageRoute(builder: (context) => LoginView()));
        }, LocaleKeys.change_sex_choice.locale, null));
  }

  Divider buildDivider(BuildContext context) => Divider(
        color: context.colorScheme.secondary,
        thickness: .6,
      );

  Card buildProfileCard(BuildContext context, CacheProvider prefs) {
    return Card(
      elevation: 8,
      child: ListTile(
        leading: buildProfileImage(context, prefs),
        title: buildTitle(prefs),
        subtitle: buildSubTitles(prefs),
      ),
    );
  }

  AutoSizeText buildTitle(CacheProvider prefs) {
    return AutoSizeText(
        prefs.getStringCache('username') ?? 'Please Login Again');
  }

  Column buildSubTitles(CacheProvider prefs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(prefs.getStringCache('bio') ?? 'An Error occured.'),
        Row(
          children: [
            AutoSizeText('${LocaleKeys.follows.locale} '),
            AutoSizeText(
                prefs.getStringCache('follows') ?? 'An Error occured.'),
          ],
        ),
        Row(
          children: [
            AutoSizeText('${LocaleKeys.followers.locale} '),
            AutoSizeText(
                prefs.getStringCache('followers') ?? 'An Error occured.'),
          ],
        ),
      ],
    );
  }

  ClipRRect buildProfileImage(BuildContext context, CacheProvider prefs) {
    return ClipRRect(
      borderRadius: context.highBorderRadius,
      child: Image.network(
        prefs.getStringCache('pp') ?? AppConstants.RANDOM_IMAGE,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: AutoSizeText(
        LocaleKeys.profile_settings.locale,
        style: context.textTheme.headline6!
            .copyWith(color: context.colorScheme.primary),
      ),
      centerTitle: false,
    );
  }

  Card buildCard(
      BuildContext context, Function() onPressed, String text, Color? color) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: context.lowBorderRadius),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextButton(
          onPressed: onPressed,
          child: AutoSizeText(text,
              style: context.textTheme.bodyText1!
                  .copyWith(color: color ?? context.colorScheme.primary)),
        ),
      ),
    );
  }
}
