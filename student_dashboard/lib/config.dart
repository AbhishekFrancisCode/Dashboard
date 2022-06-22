import 'dart:convert' as json;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_dashboard/utils/utils.dart';

class Config {
  String? baseUrl;
  Color? backgroundColor;
  Future? initialized;

  Config() {
    initialized = init();
  }

  init() async {
    final configJson = await loadAsset();
    final config = json.jsonDecode(configJson);
    baseUrl = config['base_url'];
    backgroundColor = Utils.getColorFromHex(config['background_color']);
  }

  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/config.json');
  }
}

Config config = Config();
