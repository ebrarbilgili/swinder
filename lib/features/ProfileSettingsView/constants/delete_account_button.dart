import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/cache/shared/shared_pref_cache.dart';
import '../../../core/extensions/locale_extensions.dart';
import '../../../core/lang/locale_key.g.dart';
import '../../HomeView/HomePageView/model/PostUser/post_user_model.dart';
import '../../HomeView/HomePageView/service/home_page_service.dart';
import '../../LoginView/view/login_view.dart';

class DeleteAccountDialog extends StatelessWidget {
  DeleteAccountDialog({
    Key? key,
  }) : super(key: key);

  final postUserInformationService = PostUserInformationService();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: context.normalBorderRadius),
      child: Container(
        height: context.dynamicHeight(0.2),
        width: context.dynamicWidth(0.12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: AutoSizeText(
                LocaleKeys.are_you_sure.locale,
                style: context.textTheme.bodyText1!.copyWith(
                    color: context.colorScheme.primary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: AutoSizeText(
                LocaleKeys.you_deleting.locale,
                style: context.textTheme.bodyText1!.copyWith(
                    color: context.colorScheme.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildDeleteAccountButton(context),
                buildCancelButton(context),
              ],
            )
          ],
        ),
      ),
    );
  }

  CupertinoButton buildCancelButton(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        context.navigation.pop();
      },
      child: AutoSizeText(
        LocaleKeys.cancel.locale,
        style: context.textTheme.bodyText1!
            .copyWith(color: context.colorScheme.error),
      ),
    );
  }

  CupertinoButton buildDeleteAccountButton(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => Dialog(
            backgroundColor: context.colorScheme.surface,
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            child: Container(
              color: context.colorScheme.surface,
              height: context.dynamicHeight(0.08),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CupertinoActivityIndicator(radius: 36)],
              ),
            ),
          ),
        );

        post(context).whenComplete(() => print('Deleted!'));
        Future.delayed(Duration(seconds: 2), () {
          context.navigation.pop();
        });

        Future.delayed(Duration(seconds: 3), () async {
          await SharedPreferencesConstant.instance.clearCache();

          await navigateLogout(context);
        });
      },
      child: AutoSizeText(
        LocaleKeys.delete_account.locale,
        style: context.textTheme.bodyText1!
            .copyWith(color: context.colorScheme.primary),
      ),
    );
  }

  Future navigateLogout(BuildContext context) {
    return context.navigation.push(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => LoginView(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.linear;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    ));
  }

  Future post(BuildContext context) async {
    final prefs = SharedPreferencesConstant.instance;

    return await postUserInformationService.postProfileInfo(
      PostProfileInformations(
        name: prefs.getStringValue('username'),
        photo: '',
        bio: '',
        lat: '',
        lon: '',
        gender: '',
        follows: '',
        followers: '',
      ),
    );
  }
}
