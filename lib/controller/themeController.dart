import 'package:shared_preferences/shared_preferences.dart';
import 'package:sky_scrapper/headers.dart';

class ThemeController extends ChangeNotifier {
  bool isdark = false;
  late SharedPreferences preferences;

  ThemeController({required this.preferences}) {
    init();
  }

  init() {
    isdark = preferences.getBool('isdark') ?? false;
    print("$isdark");
  }

  void ChangeTheme() {
    isdark = !isdark;
    preferences.setBool('isdark', isdark);

    print('${isdark}');
    notifyListeners();
  }
}
