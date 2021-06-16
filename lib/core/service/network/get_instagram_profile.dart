import 'dart:io';

import 'package:dio/dio.dart';

import '../../cache/shared/shared_pref_cache.dart';
import '../../model/instagram_profile_model.dart';

class GetInstagramProfileService {
  final Dio service;

  GetInstagramProfileService({required this.service});

  Future<InstagramProfileInfoModel> fetchInsta() async {
    final prefs = SharedPreferencesConstant.instance;

    final response =
        await service.get('/${prefs.getStringValue('username')}/?__a=1');

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      if (data is List) {}

      return InstagramProfileInfoModel.fromJson(data);
    }
    throw Exception();
  }

  // INetworkManager manager = NetworkManager(
  //   options: BaseOptions(baseUrl: AppConstants.INSTA_URL),
  //   fileManager: LocalPreferences(),
  // );

  // Future<InstagramProfileInfoModel> fetchInsta() async {
  //   final prefs = SharedPreferencesConstant.instance;

  //   final response = await manager.send(
  //     '/${prefs.getStringValue('username')}/?__a=1',
  //     expiration: Duration(minutes: 120),
  //     parseModel: InstagramProfileInfoModel(),
  //     method: RequestType.GET,
  //   );
  //   return response.data ?? [];
  // }
}
