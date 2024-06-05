import 'package:provider/provider.dart';
import 'package:sky_scrapper/controller/themeController.dart';
import 'package:sky_scrapper/utils/app_route.dart';

import 'headers.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.blue.shade800,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: Provider.of<ThemeController>(context).isdark
          ? ThemeMode.dark
          : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
    );
  }
}
