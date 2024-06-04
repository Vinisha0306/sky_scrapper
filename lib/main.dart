import 'package:provider/provider.dart';
import 'package:sky_scrapper/controller/api_controller.dart';
import 'package:sky_scrapper/controller/cityController.dart';
import 'package:sky_scrapper/controller/themeController.dart';

import 'controller/serachController.dart';
import 'headers.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ApiController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeController(),
        ),
        ChangeNotifierProvider(
          create: (context) => CityController(),
        ),
        ChangeNotifierProvider(
          create: (context) => searchMethodController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
