import 'package:sky_scrapper/headers.dart';
import 'package:sky_scrapper/pages/splesh_screen/splesh_screen.dart';
import '../pages/deatils_page/deatils_page.dart';
import '../pages/pin_page/pin_page.dart';

class AppRoutes {
  static String homePage = 'home_page';
  static String detailPage = 'detail_page';
  static String pinPage = 'pin_page';
  static String spleshScreen = '/';

  static Map<String, WidgetBuilder> routes = {
    AppRoutes.homePage: (context) => HomePage(),
    AppRoutes.spleshScreen: (context) => SpleshScreen(),
    AppRoutes.detailPage: (context) => DetailsPage(),
    AppRoutes.pinPage: (context) => PinPage(),
  };
}
