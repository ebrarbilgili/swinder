import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:mobx/mobx.dart';

import '../../../core/constants/instagram/instagram_constant.dart';
import '../../HomeView/view/home_view.dart';
import '../model/instagram_model.dart';

part 'instagram_viewmodel.g.dart';

class InstagramViewModel = _InstagramViewModelBase with _$InstagramViewModel;

abstract class _InstagramViewModelBase with Store {
  final InstagramModel instagram = InstagramModel();
  final flutterWebviewPlugin = FlutterWebviewPlugin();

  @action
  void redirectToHome(BuildContext context, String mySex, String chooseSex) {
    flutterWebviewPlugin.onUrlChanged.listen((String url) async {
      if (url.contains(InstagramConstant.redirectUri)) {
        instagram.getAuthorizationCode(url);
        await instagram.getTokenAndUserID().then((isDone) {
          if (isDone) {
            instagram.getUserProfile().then((isDone) async {
              await flutterWebviewPlugin.close();

              print('${instagram.username} logged in!');

              await Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => HomeView(
                      username: instagram.username ?? '',
                      mySex: mySex,
                      chooseSex: chooseSex,
                    ),
                  ),
                  (Route<dynamic> route) => false);
            });
          }
        });
      }
    });
  }
}
