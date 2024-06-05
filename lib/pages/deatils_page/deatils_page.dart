import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sky_scrapper/headers.dart';
import 'package:provider/provider.dart';
import '../../controller/api_controller.dart';
import 'componets/design.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ApiController listnable = Provider.of<ApiController>(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://wallpapergod.com/images/hd/dark-blue-aesthetic-1440X2960-wallpaper-77c8ozje67p3mr7l.jpeg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                listnable.allWeather.location.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${listnable.allWeather.current.cloud}°",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    ",\t${listnable.allWeather.current.condition.text}",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Image(
                    image: AssetImage(
                      'lib/assets/cloud.png',
                    ),
                    width: 200,
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Text(
                        " ${listnable.allWeather.current.cloud}°",
                        style: const TextStyle(
                          fontSize: 70,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'Cloud',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  designContainer(
                    text: '${listnable.allWeather.current.tempC}°',
                    word: 'Temp_C',
                  ),
                  designContainer(
                    text: '${listnable.allWeather.current.tempF}°',
                    word: 'Temp_F',
                  ),
                  designContainer(
                    text: '${listnable.allWeather.current.dewpointC}°',
                    word: 'DPointC',
                  ),
                  designContainer(
                    text: '${listnable.allWeather.current.dewpointF}°',
                    word: 'DPointF',
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  designContainer(
                    text: '${listnable.allWeather.current.feelslikeC}°',
                    word: 'FeelsLikeC',
                  ),
                  designContainer(
                    text: '${listnable.allWeather.current.feelslikeF}°',
                    word: 'FeelsLikeF',
                  ),
                  designContainer(
                    text: '${listnable.allWeather.current.windchillC}°',
                    word: 'WindChillC',
                  ),
                  designContainer(
                    text: '${listnable.allWeather.current.dewpointF}°',
                    word: 'WindChillF',
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  designContainer(
                    text: '${listnable.allWeather.current.windKph}  ',
                    word: 'WindKph',
                  ),
                  designContainer(
                    text: '${listnable.allWeather.current.windMph}',
                    word: 'WindMph',
                  ),
                  designContainer(
                    text: '${listnable.allWeather.current.heatindexC}°',
                    word: 'HeatIndex_C',
                  ),
                  designContainer(
                    text: '${listnable.allWeather.current.heatindexF}°',
                    word: 'HeatIndex_F',
                  ),
                ],
              ),
              Spacer(),
              const Text(
                'Last Update',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Text(
                listnable.allWeather.current.lastUpdated,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
