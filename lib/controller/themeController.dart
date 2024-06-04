import 'package:sky_scrapper/headers.dart';

class ThemeController extends ChangeNotifier {
  bool isdark = false;

  void ChangeTheme() {
    isdark = !isdark;
    print('${isdark}');
    notifyListeners();
  }
}
