import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants/instagram/instagram_constant.dart';
import '../../../core/extensions/locale_extensions.dart';
import '../../../core/lang/locale_key.g.dart';
import '../viewmodel/instagram_viewmodel.dart';

class InstagramView extends StatelessWidget {
  InstagramView({
    Key? key,
    required this.mySex,
    required this.chooseSex,
  }) : super(key: key);

  final String mySex;
  final String chooseSex;

  final viewModel = InstagramViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.redirectToHome(context, mySex, chooseSex);
    return WebviewScaffold(
      url: InstagramConstant.instance.url,
      resizeToAvoidBottomInset: true,
      appBar: buildAppBar(context),
    );
  }

  AppBar buildAppBar(BuildContext context) => AppBar(
        backgroundColor: context.colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: context.colorScheme.primary),
        title: AutoSizeText(
          LocaleKeys.login_with_insta.locale,
          style: context.textTheme.headline6!
              .copyWith(color: context.colorScheme.primary),
        ),
      );
}
