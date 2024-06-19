import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sky_scrapper/controller/PinController.dart';
import 'package:sky_scrapper/controller/api_controller.dart';
import 'package:sky_scrapper/controller/cityController.dart';
import 'package:sky_scrapper/controller/themeController.dart';

import 'controller/serachController.dart';
import 'headers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ApiController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeController(preferences: preferences),
        ),
        ChangeNotifierProvider(
          create: (context) => CityController(),
        ),
        ChangeNotifierProvider(
          create: (context) => searchMethodController(),
        ),
        ChangeNotifierProvider(
          create: (context) => PinController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
