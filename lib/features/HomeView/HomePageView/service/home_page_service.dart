import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:swinder/features/HomeView/HomePageView/model/PostUser/post_user_model.dart';
import 'package:vexana/vexana.dart';

import '../../../../core/cache/shared/shared_pref_cache.dart';
import '../../../../core/constants/app.dart';
import '../model/FetchUser/home_page_model.dart';

class HomePageService {
  INetworkManager manager = NetworkManager(
    options: BaseOptions(baseUrl: AppConstants.BASE_URL),
    fileManager: LocalPreferences(),
    // isEnableLogger: true,
  );

  Future<List<GetAround>> getUsers() async {
    final prefs = SharedPreferencesConstant.instance;

    final response = await manager.send(
      '?method=tara&name=${prefs.getStringValue('username')}&gender=${prefs.getStringValue('choosesex')}',
      expiration: Duration(seconds: 32),
      parseModel: GetAround(null, null, null, null, null, null, null),
      method: RequestType.GET,
    );

    return response.data ?? [];
  }
}

class PostUserInformationService {
  Future<PostProfileInformations> postProfileInfo(
      PostProfileInformations postProfileInformations) async {
    final url = 'https://www.swinderapp.com/swinder/swinder.php?method=ekle';
    final response = await http.post(Uri.parse(url), body: {
      'name': postProfileInformations.name ?? '',
      'photo': postProfileInformations.photo ?? '',
      'bio': postProfileInformations.bio ?? '',
      'lat':
          // '41.03695253689671',
          postProfileInformations.lat ?? '',
      'lon':
          //  '28.83409233557873',
          postProfileInformations.lon ?? '',
      'gender': postProfileInformations.gender ?? '',
      'follows': postProfileInformations.follows ?? '',
      'followers': postProfileInformations.followers ?? '',
    });

    if (response.statusCode == 200) {
      final List<dynamic> responseString = json.decode(response.body);
      print('POSTED!');
      return PostProfileInformations.fromJson(responseString[0]);
    } else {
      throw Exception('Error');
    }
  }
}
