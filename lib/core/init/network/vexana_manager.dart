import 'dart:io';

import 'package:dio/dio.dart';
import 'package:vexana/vexana.dart';

class VexanaManager {
  static VexanaManager? _instance;
  static VexanaManager get instance => _instance = VexanaManager._init();

  VexanaManager._init();

  static const String _iosBaseUrl = 'http://localhost:3000/';
  static const String _androidBaseUrl = 'http://10.0.2.2:3000/';

  INetworkManager networkManager = NetworkManager(
      isEnableLogger: true,
      options: BaseOptions(
          baseUrl: Platform.isAndroid ? _androidBaseUrl : _iosBaseUrl));
}
