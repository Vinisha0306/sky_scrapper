import 'package:flutter/cupertino.dart';
import 'package:sky_scrapper/controller/PinController.dart';
import 'package:sky_scrapper/headers.dart';

class PinPage extends StatelessWidget {
  const PinPage({super.key});

  @override
  Widget build(BuildContext context) {
    CityController listnable = Provider.of<CityController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pin Citys'),
      ),
      body: pinCitys.isNotEmpty
          ? ListView.builder(
              itemCount: pinCitys.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  city = pinCitys[index].name;
                  Provider.of<ApiController>(context, listen: false)
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
                  child: Text(
                    pinCitys[index].name,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          : const Center(
              child: Text('No Any Data'),
            ),
    );
  }
}
