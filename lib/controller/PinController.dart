import 'package:sky_scrapper/headers.dart';

class PinController extends ChangeNotifier {
  init({required int index}) {
    pinCitys.remove(pinCitys[index]);
    notifyListeners();
  }
}
