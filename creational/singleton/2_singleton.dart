import 'dart:convert';
import 'dart:io';

class AppConfig {
  static final AppConfig _instance = AppConfig._internal();

  Map<String, dynamic> _settings = {};

  AppConfig._internal() {
    _settings = _loadSettings();
  }

  static AppConfig get instance => _instance;

  Map<String, dynamic> _loadSettings() {
    final file = File('config.json');
    final jsonString = file.readAsStringSync();
    return jsonDecode(jsonString);
  }

  dynamic getSetting(String key) {
    return _settings[key];
  }

  void setSetting(String key, dynamic value) {
    _settings[key] = value;
    _saveSettings();
  }

  void _saveSettings() {
    final file = File('config.json');
    final jsonString = jsonEncode(_settings);
    file.writeAsStringSync(jsonString);
  }
}

void main() {
  var config = AppConfig.instance;

  config.setSetting('appName', 'My New App');

  print(config.getSetting('appName'));

}
