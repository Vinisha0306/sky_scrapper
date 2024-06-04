import 'package:sky_scrapper/headers.dart';

class searchMethodController extends ChangeNotifier {
  bool isSearch = false;

  void Changesearch() {
    isSearch = !isSearch;
    print(isSearch);
    notifyListeners();
  }
}
