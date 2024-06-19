import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:sky_scrapper/headers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<City> pinCitys = [];
String city = 'all';
dynamic searchCity = 'all';

class _HomePageState extends State<HomePage> {
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
              Navigator.pushNamed(context, AppRoutes.pinPage);
            },
            icon: const Icon(
              CupertinoIcons.pin_fill,
            ),
          ),
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
            icon: Provider.of<ThemeController>(context).isdark
                ? const Icon(
                    Icons.sunny,
                  )
                : const Icon(
                    CupertinoIcons.moon_fill,
                  ),
          ),
        ],
      ),
      body: listnable.Connected == true
          ? listnable.allCity.isNotEmpty
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
                                itemBuilder: (context, index) =>
                                    GestureDetector(
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
                                    margin: const EdgeInsets.all(10),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: const DecorationImage(
                                        image: NetworkImage(
                                          'https://wallpapergod.com/images/hd/dark-blue-aesthetic-1440X2960-wallpaper-77c8ozje67p3mr7l.jpeg',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          listnable.allCity[index].name,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            pinCitys.contains(
                                                    listnable.allCity[index])
                                                ? pinCitys.remove(
                                                    listnable.allCity[index],
                                                  )
                                                : pinCitys.add(
                                                    listnable.allCity[index]);
                                            setState(() {});
                                          },
                                          icon: pinCitys.contains(
                                                  listnable.allCity[index])
                                              ? const Icon(
                                                  CupertinoIcons.pin_fill,
                                                  color: Colors.white,
                                                )
                                              : const Icon(
                                                  CupertinoIcons.pin,
                                                  color: Colors.white,
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GestureDetector(
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
                                      margin: const EdgeInsets.all(10),
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: const DecorationImage(
                                          image: NetworkImage(
                                            'https://wallpapergod.com/images/hd/dark-blue-aesthetic-1440X2960-wallpaper-77c8ozje67p3mr7l.jpeg',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            searchCity.name,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              pinCitys.contains(searchCity)
                                                  ? pinCitys.remove(searchCity)
                                                  : pinCitys.add(searchCity);
                                              setState(() {});
                                            },
                                            icon: pinCitys.contains(searchCity)
                                                ? const Icon(
                                                    CupertinoIcons.pin_fill,
                                                    color: Colors.white,
                                                  )
                                                : const Icon(
                                                    CupertinoIcons.pin,
                                                    color: Colors.white,
                                                  ),
                                          ),
                                        ],
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
                )
          : Center(
              child: Lottie.asset('lib/assets/NoWifi.json'),
            ),
    );
  }
}
