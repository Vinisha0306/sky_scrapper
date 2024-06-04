import 'package:sky_scrapper/headers.dart';
import '../modal/api_modal.dart';

class ApiController extends ChangeNotifier {
  Weather allWeather = Weather.demoWeather;

  ApiController() {
    loadData();
  }

  Future<void> loadData({city}) async {
    allWeather = await ApiCalling.apiCalling.getWeather(city: city);
    notifyListeners();
  }
}
