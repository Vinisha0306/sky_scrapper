import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper/controller/api_controller.dart';
import 'package:sky_scrapper/controller/themeController.dart';
import 'package:sky_scrapper/headers.dart';
import 'package:sky_scrapper/utils/app_route.dart';
import '../../controller/cityController.dart';
import '../../controller/serachController.dart';
import '../../modal/cityModal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // bool connecitivity = false;
  //
  // Future<void> CheckConnectivity() async {
  //   List<ConnectivityResult> connectivityResult =
  //       await Connectivity().checkConnectivity();
  //
  //   if (connectivityResult == ConnectivityResult.mobile) {
  //     connecitivity = true;
  //   }
  // }

  String city = 'all';
  dynamic searchCity = 'all';
  @override
  void initState() {
    // CheckConnectivity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CityController listnable = Provider.of<CityController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<searchMethodController>(context, listen: false)
                  .Changesearch();
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {
              Provider.of<ThemeController>(context, listen: false)
                  .ChangeTheme();
            },
            icon: const Icon(
              Icons.sunny,
            ),
          ),
        ],
      ),
      body: listnable.allCity.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Provider.of<searchMethodController>(context).isSearch
                      ? TextField(
                          onSubmitted: (val) {
                            listnable.allCity.forEach(
                              (element) {
                                if (val == element.name) {
                                  searchCity = element;
                                  setState(() {});
                                }
                                if (val.isEmpty) {
                                  searchCity = 'all';
                                  setState(() {});
                                }
                              },
                            );
                          },
                          decoration: const InputDecoration(
                            labelText: 'Search',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: searchCity == 'all'
                        ? ListView.builder(
                            itemCount: listnable.allCity.length,
                            itemBuilder: (context, index) => Card(
                              child: GestureDetector(
                                onTap: () {
                                  city = listnable.allCity[index].name;
                                  Provider.of<ApiController>(context,
                                          listen: false)
                                      .loadData(city: city);
                                  Navigator.of(context)
                                      .pushNamed(AppRoutes.detailPage)
                                      .then((value) => searchCity = 'all');
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    listnable.allCity[index].name,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Card(
                                child: GestureDetector(
                                  onTap: () {
                                    city = searchCity.name;
                                    Provider.of<ApiController>(context,
                                            listen: false)
                                        .loadData(city: city);
                                    Navigator.of(context)
                                        .pushNamed(AppRoutes.detailPage)
                                        .then(
                                      (value) {
                                        searchCity = 'all';
                                        Provider.of<searchMethodController>(
                                                context,
                                                listen: false)
                                            .Changesearch();
                                      },
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      searchCity.name,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                  ),
                ],
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
