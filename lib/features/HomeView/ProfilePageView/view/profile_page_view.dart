import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../../../core/cache/shared/shared_pref_cache.dart';
import '../../../../core/extensions/locale_extensions.dart';
import '../../../../core/lang/locale_key.g.dart';
import '../../../LoginView/view/login_view.dart';
import '../../../ProfileSettingsView/view/profile_settings_view.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildButton(
            context,
            LocaleKeys.profile_settings.locale,
            () => context.navigation.push(
                MaterialPageRoute(builder: (context) => ProfileSettingsView())),
            context.colorScheme.primary,
          ),
          buildButton(
            context,
            LocaleKeys.logout.locale,
            () async {
              await SharedPreferencesConstant.instance.clearCache();

              await context.navigation
                  .push(MaterialPageRoute(builder: (context) => LoginView()));
            },
            context.colorScheme.error,
          ),
        ],
      ),
    );
  }

  Container buildButton(
      BuildContext context, String text, Function() onPressed, Color color) {
    return Container(
      height: 60,
      decoration: buildBoxDecoration(context),
      child: TextButton(
        onPressed: onPressed,
        style: buildButtonStyle(context),
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: context.textTheme.bodyText1!
                .copyWith(fontSize: 18, color: color),
          ),
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration(BuildContext context) {
    return BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 0.8, color: context.colorScheme.secondary),
      ),
    );
  }

  ButtonStyle buildButtonStyle(BuildContext context) {
    return ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all(context.colorScheme.background),
      elevation: MaterialStateProperty.all(0),
    );
  }
}
