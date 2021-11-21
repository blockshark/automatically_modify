library automatically_modity;

import 'dart:async';

import 'package:flutter/services.dart';

import 'dart:io';

import 'package:automatically_modify/android.dart' as android;
import 'package:automatically_modify/constants.dart' as constants;
import 'package:automatically_modify/ios.dart' as ios;
import 'package:yaml/yaml.dart';


class AutomaticallyModify {
  static const MethodChannel _channel = MethodChannel('automatically_modify');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
exec() {
  print('start');

  final config = loadConfigFile();

  final newName = config['name'];

  android.overwriteAndroidManifest(newName);
  ios.overwriteInfoPlist(newName);

  print('exit');
}
Map<String, dynamic> loadConfigFile() {
  final File file = File('pubspec.yaml');
  final String yamlString = file.readAsStringSync();
  final Map yamlMap = loadYaml(yamlString);

  if (yamlMap == null || !(yamlMap[constants.yamlKey] is Map)) {
    throw new Exception('automatically_modity was not found');
  }

  // yamlMap has the type YamlMap, which has several unwanted sideeffects
  final Map<String, dynamic> config = <String, dynamic>{};
  for (MapEntry<dynamic, dynamic> entry in yamlMap[constants.yamlKey].entries) {
    config[entry.key] = entry.value;
  }

  return config;
}