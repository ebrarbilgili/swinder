import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants/app.dart';
import '../../../core/extensions/locale_extensions.dart';
import '../../../core/lang/locale_key.g.dart';
import '../../ChooseSexView/view/choose_sex_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  SafeArea buildBody(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildLogo,
          buildLoginButton(context),
        ],
      ),
    );
  }

  Expanded buildLoginButton(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              context.navigation.push(MaterialPageRoute(
                builder: (context) => ChooseSexView(),
              ));
            },
            style: ButtonStyle(
                padding: MaterialStateProperty.all(context.paddingNormal)),
            child: AutoSizeText(
              LocaleKeys.login_with_insta.locale,
              style: context.textTheme.bodyText1!
                  .copyWith(color: context.colorScheme.background),
            ),
          ),
        ],
      ),
    );
  }

  Expanded get buildLogo => Expanded(child: Image.asset(AppConstants.LOGO));
}
