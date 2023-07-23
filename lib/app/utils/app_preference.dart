import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class AppPreference {

  static var data;

  static Future<void> init() async {
    var appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    Hive.init(appDocPath);
    data= await Hive.openBox('StarLinex');
  }

  //sets
  static setBool(String key, bool? value)  async =>
      await data.put(key, value);

  static setString(String key, String? value)  =>
      data.put(key, value);

  setInt(String key, int? value)  =>
      data.put(key, value);

  //gets
  static bool? getBool(String key) => data.get(key);

  int? getInt(String key) => data.get(key);

  static String? getString(String key) => data.get(key);

  //deletes..
  static remove(String key) => data.delete(key);

  static clear() => data.clear();


}