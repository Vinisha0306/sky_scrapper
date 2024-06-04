import 'package:sky_scrapper/headers.dart';

class CityController extends ChangeNotifier {
  List allCity = [];

  CityController() {
    initData();
  }

  Future<void> initData() async {
    allCity = await ApiCalling.apiCalling.getCity();
    notifyListeners();
  }
}
