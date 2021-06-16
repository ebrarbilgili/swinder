import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/extensions/locale_extensions.dart';
import '../../../core/lang/locale_key.g.dart';
import '../../InstagramView/view/instagram_view.dart';
import '../viewmodel/choose_sex_viewmodel.dart';

class ChooseSexView extends StatelessWidget {
  ChooseSexView({Key? key}) : super(key: key);

  final viewModel = ChooseSexViewModel();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return buildScaffold(context);
      },
    );
  }

  Scaffold buildScaffold(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  Column buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildTextWhatIsYourGender(context),
        buildFirstManButton(context),
        buildFirstWomanButton(context),
        buildFirstNotPreferButton(context),
        buildTextGenderPrefer(context),
        buildSecondManButton(context),
        buildSecondWomanButton(context),
        buildSecondBothButton(context),
        buildSizedBox(context),
        buildPrivacyPolicyButton(context),
        buildGoButton(context),
      ],
    );
  }

  Row buildPrivacyPolicyButton(BuildContext context) {
    return Row(children: [
      Expanded(
        child: Checkbox(
          value: viewModel.isAccepted,
          onChanged: (value) => viewModel.onPressAccepted(value!),
          checkColor: context.colorScheme.background,
          activeColor: context.colorScheme.primary,
        ),
      ),
      Expanded(
        flex: 8,
        child: TextButton(
          onPressed: () async {
            final url = 'http://swinderapp.com/#/privacy';
            if (await canLaunch(url)) {
              await launch(url);
            }
          },
          child: Container(
            child: AutoSizeText(
              LocaleKeys.seen_privacy.locale,
              style: context.textTheme.bodyText1!.copyWith(fontSize: 12),
            ),
          ),
        ),
      )
    ]);
  }

  void onPressed(BuildContext context) {
    if (viewModel.choosesex != null && viewModel.sex != null) {
      print('OK');
      context.navigation.push(
        MaterialPageRoute(
          builder: (context) => InstagramView(
            mySex: viewModel.sex.toString(),
            chooseSex: viewModel.choosesex.toString(),
          ),
        ),
      );
    } else {
      viewModel.onPressedGoButton();
    }
  }

  Padding buildGoButton(BuildContext context) => Padding(
        padding: context.paddingLow,
        child: Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed:
                viewModel.isAccepted == false ? null : () => onPressed(context),
            style: buildButtonStyle(context),
            child: AutoSizeText(
              LocaleKeys.go.locale,
              style: context.textTheme.bodyText1!
                  .copyWith(color: context.colorScheme.background),
            ),
          ),
        ),
      );

  SizedBox buildSizedBox(BuildContext context) =>
      SizedBox(height: context.dynamicHeight(0.04));

  Container buildSecondBothButton(BuildContext context) => Container(
        decoration:
            viewModel.choosesex != 0 ? null : buildBoxDecoration(context),
        child: buildPreferGenderButton(LocaleKeys.both.locale, 0),
      );

  Container buildSecondWomanButton(BuildContext context) => Container(
        decoration:
            viewModel.choosesex != 2 ? null : buildBoxDecoration(context),
        child: buildPreferGenderButton(LocaleKeys.woman.locale, 2),
      );

  Container buildSecondManButton(BuildContext context) => Container(
        decoration:
            viewModel.choosesex != 1 ? null : buildBoxDecoration(context),
        child: buildPreferGenderButton(LocaleKeys.man.locale, 1),
      );

  Container buildFirstNotPreferButton(BuildContext context) => Container(
        decoration: viewModel.sex != 0 ? null : buildBoxDecoration(context),
        child: buildYourGenderButton(LocaleKeys.not_prefer.locale, 0),
      );

  Container buildFirstWomanButton(BuildContext context) => Container(
        decoration: viewModel.sex != 2 ? null : buildBoxDecoration(context),
        child: buildYourGenderButton(LocaleKeys.woman.locale, 2),
      );

  Container buildFirstManButton(BuildContext context) => Container(
        decoration: viewModel.sex != 1 ? null : buildBoxDecoration(context),
        child: buildYourGenderButton(LocaleKeys.man.locale, 1),
      );

  TextButton buildYourGenderButton(String gender, int number) => TextButton(
        onPressed: () {
          viewModel.onPressedYourGender(gender, number);
        },
        child: AutoSizeText(gender),
      );

  TextButton buildPreferGenderButton(String gender, int number) => TextButton(
        onPressed: () {
          viewModel.onPressedPreferGender(gender, number);
        },
        child: AutoSizeText(gender),
      );

  Observer buildTextWhatIsYourGender(BuildContext context) => Observer(
        builder: (context) => AutoSizeText(
          LocaleKeys.what_is_your_gender.locale,
          style: styleHeader(context),
        ),
      );

  Observer buildTextGenderPrefer(BuildContext context) => Observer(
        builder: (context) => Container(
          padding: context.paddingLow,
          child: AutoSizeText(
            LocaleKeys.what_gender_prefer.locale,
            style: styleHeader(context),
          ),
        ),
      );

  TextStyle styleHeader(BuildContext context) =>
      context.textTheme.headline5!.copyWith(
        color: viewModel.chooseControl == true
            ? context.colorScheme.error
            : context.colorScheme.primary,
        fontWeight: FontWeight.bold,
      );

  BoxDecoration buildBoxDecoration(BuildContext context) => BoxDecoration(
        border: Border.all(color: context.colorScheme.primary),
        borderRadius: context.lowBorderRadius,
      );

  ButtonStyle buildButtonStyle(BuildContext context) {
    return ButtonStyle(
      padding: MaterialStateProperty.all(context.horizontalPaddingMedium),
    );
  }
}
