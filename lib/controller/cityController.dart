import 'package:sky_scrapper/headers.dart';

class CityController extends ChangeNotifier {
  List allCity = [];
  bool Connected = false;

  CityController() {
    connectivity();
  }

  void connectivity() async {
    Connectivity().onConnectivityChanged.listen((event) {
      Connected = event.contains(ConnectivityResult.none) ? false : true;
      if (Connected) {
        initData();
      }
      notifyListeners();
    });
  }

  Future<void> initData() async {
    allCity = await ApiCalling.apiCalling.getCity();
    notifyListeners();
  }
}
